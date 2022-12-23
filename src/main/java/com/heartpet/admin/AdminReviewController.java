package com.heartpet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.heartpet.action.ReviewDAO;
import com.heartpet.action.UserDAO;
import com.heartpet.model.PageDTO;
import com.heartpet.model.ReviewDTO;
import com.heartpet.model.UserDTO;
import com.heartpet.util.FileUploadImage;

@Controller
public class AdminReviewController {
    
    @Autowired
    private ReviewDAO reviewDAO;
    
    @Autowired
    private UserDAO userDAO;

    // 한 페이지당 보여질 게시물의 수
    private final int rowsize = 10;

    // 전체 게시물의 수
    private int totalRecord = 0;

    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_LIST - 고양이/강아지 선택 추가
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/admin_review_list")
    public String admin_review_list(@RequestParam(value = "search_animal", required = false) String search_animal,
            @RequestParam(value = "search_id", required = false) String search_id,
            @RequestParam(value = "search_content", required = false) String search_content,
            @RequestParam(value = "order", required = false) String order,
            @RequestParam(value = "page", defaultValue = "1") int page, Model model) {

        if (search_animal == null) { search_animal = ""; }
        if (search_id == null) { search_id = ""; }
        if (search_content == null) { search_content = ""; }
        if (order == null) { order = ""; }

        int currentPage = 1; // 현재 페이지 변수
        if (page != 1) { currentPage = page; }

        List<ReviewDTO> reviewList = null;
        PageDTO paging = null;

        // animal name 추출
        // 전체 선택
        totalRecord = this.reviewDAO.listReviewCount(search_animal, search_id, search_content);
        paging = new PageDTO(currentPage, rowsize, totalRecord);
        reviewList = this.reviewDAO.listReview(paging.getStartNo(), paging.getEndNo(), search_animal, search_id, search_content, order);
        
        // 댓글수 추가
        List<Integer> commentList = new ArrayList<Integer>();
        for(int i=0; i<reviewList.size(); i++) {            
            commentList.add(this.reviewDAO.countComment(reviewList.get(i).getReview_no()));
        }

        model.addAttribute("reviewList", reviewList);
        model.addAttribute("total", totalRecord);
        model.addAttribute("paging", paging);
        model.addAttribute("search_animal", search_animal);
        model.addAttribute("search_id", search_id);
        model.addAttribute("search_content", search_content);
        model.addAttribute("order", order);
        model.addAttribute("commentList", commentList);

        return "admin/review/review_list";
    }
    
    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_CONTENT
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/admin_review_content")
    public String admin_review_content(@RequestParam("review_no") int review_no, Model model) {
        ReviewDTO reviewContent = this.reviewDAO.contentReview(review_no);
        this.reviewDAO.hitReview(review_no);
        UserDTO userContent = this.userDAO.getUserInfo(reviewContent.getReview_id());
        model.addAttribute("reviewContent", reviewContent);
        model.addAttribute("userContent", userContent);
        return "admin/review/review_content";
    }
    
    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_UPDATE
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/admin_review_update")
    public String admin_review_update(@RequestParam("review_no") int review_no, Model model) {
        ReviewDTO reviewContent = this.reviewDAO.contentReview(review_no);
        model.addAttribute("reviewContent", reviewContent);
        return "admin/review/review_update";
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_UPDATE_OK
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/admin_review_update_ok", method = RequestMethod.POST)
    public void admin_review_update_ok(@RequestParam("review_file") List<MultipartFile> review_file, 
            @Valid ReviewDTO updateDto, BindingResult result, HttpServletResponse response,
            HttpServletRequest request) throws IOException {
        
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        if (result.hasErrors()) { // 에러를 List로 저장
            List<ObjectError> errors = result.getAllErrors();
            for (ObjectError error : errors) {
                if (error.getDefaultMessage().equals("title")) {
                    out.println("<script>alert('글 제목이 없습니다.'); history.back(); </script>");
                    break;
                } else if (error.getDefaultMessage().equals("content")) {
                    out.println("<script>alert('글 내용이 없습니다.'); history.back(); </script>");
                    break;
                }
            }
        } else {
            ////////////////////////////////////////////////////////////////////////////
            // FileUploadImage.uploadFile(request, 실제 파일, 폴더명, 파일 개수)
            //////////////////////////////////////////////////////////////////////////// 
            // 총 파일 개수
            int totalFileCount = 4;            
            ReviewDTO originalContent = this.reviewDAO.contentReview(updateDto.getReview_no());
            
            // 기존 이미지 및 비디오 이름 가져오기
            List<String> origin_names = new ArrayList<String>();
            origin_names.add(originalContent.getReview_img1());
            origin_names.add(originalContent.getReview_img2());
            origin_names.add(originalContent.getReview_img3());
            origin_names.add(originalContent.getReview_video());
    
            // 파일 업데이트
            FileUploadImage reviewFiles = new FileUploadImage();  
            List<String> updateFile = reviewFiles.updateFile(request, review_file, "review", origin_names, totalFileCount);
            
            updateDto.setReview_img1(updateFile.get(0));
            updateDto.setReview_img2(updateFile.get(1));
            updateDto.setReview_img3(updateFile.get(2));
            updateDto.setReview_video(updateFile.get(3));
      
            int check = this.reviewDAO.updateReview(updateDto);
            if (check > 0) {
                out.println("<script>alert('후기글이 성공적으로 수정됐습니다.'); location.href='" + request.getContextPath() + "/admin_review_list'; </script>");
            } else {
                out.println("<script>alert('후기글 수정을 실패했습니다.'); history.back(); </script>");
            }
        }
    }
    
    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_DELETE
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/admin_review_delete")
    public void admin_review_delete(@RequestParam("review_no") int review_no, HttpServletResponse response,
            HttpServletRequest request) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        ReviewDTO reviewContent = this.reviewDAO.contentReview(review_no);
        
        List<String> origin_names = new ArrayList<String>();
        origin_names.add(reviewContent.getReview_img1());
        origin_names.add(reviewContent.getReview_img2());
        origin_names.add(reviewContent.getReview_img3());
        origin_names.add(reviewContent.getReview_video());
        
        FileUploadImage deleteFiles = new FileUploadImage();  
        deleteFiles.deleteFile(request, origin_names);
        
        this.reviewDAO.deleteAllComment(review_no);
      
        int check = this.reviewDAO.deleteReview(review_no);
        if (check > 0) {
            out.println("<script>alert('후기글이 성공적으로 삭제됐습니다.'); location.href='" + request.getContextPath() + "/admin_review_list'; </script>");
        } else {
            out.println("<script>alert('후기글 삭제를 실패했습니다.'); history.back(); </script>");
        }
    }

}
