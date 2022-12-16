package com.heartpet.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.heartpet.action.AnimalDAO;
import com.heartpet.action.ReviewDAO;
import com.heartpet.model.PageDTO;
import com.heartpet.model.ReviewDTO;
import com.heartpet.util.CheckMimeType;
import com.heartpet.util.FileUploadImage;

@Controller
public class UserReviewController {

    @Autowired
    private ReviewDAO reviewDAO;

    @Autowired
    private AnimalDAO animalDAO;

    // 한 페이지당 보여질 게시물의 수
    private final int rowsize = 6;

    // 전체 게시물의 수
    private int totalRecord = 0;

    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_LIST - 고양이/강아지 선택 추가
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/user_review_list")
    public String user_review_list(@RequestParam(value = "field", required = false) String field,
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "animal_tag", required = false) String animal_tag,
            @RequestParam(value = "page", defaultValue = "1") int page, Model model) {

        if (field == null) { field = ""; }
        if (keyword == null) { keyword = ""; }

        int currentPage = 1; // 현재 페이지 변수
        if (page != 1) { currentPage = page; }

        List<ReviewDTO> reviewList = null;
        PageDTO paging = null;

        // animal name 추출
        // 전체 선택
        if (animal_tag == null) {
            totalRecord = this.reviewDAO.listReviewCount(field, keyword);
            paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);
            reviewList = this.reviewDAO.listReview(paging.getStartNo(), paging.getEndNo(), field, keyword);
        } else { // dog/cat 선택
            totalRecord = this.reviewDAO.listReviewCount(animal_tag);
            paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);
            reviewList = this.reviewDAO.listReview(paging.getStartNo(), paging.getEndNo(), animal_tag);
        }

        model.addAttribute("reviewList", reviewList);
        model.addAttribute("total", totalRecord);
        model.addAttribute("paging", paging);
        model.addAttribute("field", field);
        model.addAttribute("keyword", keyword);

        return "user/review/review_list";
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_CONTENT
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/user_review_content")
    public String user_review_content(@RequestParam("review_no") int review_no, Model model) {
        ReviewDTO reviewContent = this.reviewDAO.contentReview(review_no);
        this.reviewDAO.hitReview(review_no);
        model.addAttribute("reviewContent", reviewContent);
        System.out.println("here");
        return "user/review/review_content";
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_INSERT - animal_no 넘어옴
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/user_review_insert")
    public String user_review_insert(@RequestParam("animal_no") int animal_no, HttpServletResponse response, 
    		HttpServletRequest request, Model model) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        // 로그인 여부 체크
        if (session.getAttribute("session_id") == null || session.getAttribute("session_id") == "") {
            out.println("<script> alert('로그인이 필요합니다.'); location.href='" + request.getContextPath() + "/'; </script>");
            out.flush();
        }

        // animal_name
        Map<String, Object> animal_info = this.animalDAO.animalName(animal_no);
        model.addAttribute("animal_info", animal_info);
        model.addAttribute("animal_no", animal_no);

        return "user/review/review_insert";
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_INSERT_OK
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/user_review_insert_ok", method = RequestMethod.POST)
    public void user_review_insert_ok(@RequestParam("review_file") List<MultipartFile> review_file, 
    		@Valid ReviewDTO reviewDto, BindingResult result, HttpServletResponse response,
    		HttpServletRequest request) throws Exception {
    	
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        System.out.println("review_file eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"+review_file.toString());

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
        	//////////////////////////////////////////////////////////////////////////// 수정 중
        	// request, MultipartFile, folderName, insert/update 구분, 총 파일 개수       	
        	
		    FileUploadImage upload = new FileUploadImage();
		    // 총 파일 개수
		    int totalFileCount = 4;
		    List<String> reviewFiles = upload.uploadFile(request, review_file, "review_file", totalFileCount);
		    
		    // video 타입인지 check
		    CheckMimeType typeCheck = new CheckMimeType();
		    System.out.println("reviewFiles.size() : " + reviewFiles.size());
		    
		    for(int i=0; i<reviewFiles.size(); i++) {
		        System.out.println("i : " + i);
		        if(reviewFiles.get(i) != "") {
		              System.out.println("여기는 몇 번 들어왔나 : " + reviewFiles.get(i));
		            String mimeType = typeCheck.contentType(reviewFiles.get(i)); // 0 img, 1 vid, 2 null, 3 null
		            // null 먼저 골라내기
		            if(mimeType.contains("video")) {
		                System.out.println("video type : "+mimeType.contains("video"));
		                reviewDto.setReview_video(reviewFiles.get(i));		    	    
		            }else if(mimeType.contains("image")) { 
		                switch(i) { 
		                case 0 : reviewDto.setReview_img1(reviewFiles.get(i)); break;
		                case 1 : reviewDto.setReview_img2(reviewFiles.get(i)); break;
		                case 2 : reviewDto.setReview_img3(reviewFiles.get(i)); break;
		                }
		            }
		    	}else {	    	    
		    	    if(StringUtils.isEmpty(reviewDto.getReview_img1()) && reviewDto.getReview_img1() != "") {
		    	        reviewDto.setReview_img1("");
		    	    }else if(StringUtils.isEmpty(reviewDto.getReview_img2()) && reviewDto.getReview_img2() != "") {
		    	        reviewDto.setReview_img2("");
		    	    }else if(StringUtils.isEmpty(reviewDto.getReview_img3()) && reviewDto.getReview_img3() != "") {
		    	        reviewDto.setReview_img3("");
		    	    }else if(StringUtils.isEmpty(reviewDto.getReview_video()) && reviewDto.getReview_video() != "") {
		    	        reviewDto.setReview_video("");
		    	    }		    	    
		    	}
	    	}	   		    
		    
            System.out.println("reviewDto : "+reviewDto.toString());

            int check = this.reviewDAO.insertReview(reviewDto);
            if (check > 0) {
                out.println("<script>alert('후기글이 성공적으로 등록되었습니다.'); location.href='" + request.getContextPath() + "/user_review_list'; </script>");
            } else {
                out.println("<script>alert('후기글 등록을 실패했습니다.'); history.back(); </script>");
            }
        }
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_UPDATE
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/user_review_update")
    public String user_review_update(@RequestParam("animal_no") int animal_no, @RequestParam("review_no") int review_no, Model model) {
        ReviewDTO reviewContent = this.reviewDAO.contentReview(review_no);
        
        // animal_name
        Map<String, Object> animal_info = this.animalDAO.animalName(animal_no);
        model.addAttribute("animal_info", animal_info);
        model.addAttribute("animal_no", animal_no);
        model.addAttribute("reviewContent", reviewContent);
        
        return "user/review/review_update";
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_UPDATE_OK
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/user_review_update_ok", method = RequestMethod.POST)
    public void user_review_update_ok(ReviewDTO reviewDto, BindingResult result, HttpServletResponse response,
            HttpServletRequest request) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        // 유효성 검사
        int check = this.reviewDAO.updateReview(reviewDto);
        if (check > 0) {
            out.println("<script>alert('후기글이 성공적으로 수정되었습니다.'); location.href='" + request.getContextPath() + "/user_review_list'; </script>");
        } else {
            out.println("<script>alert('후기글 수정을 실패했습니다.'); history.back(); </script>");
        }
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_DELETE
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/user_review_delete")
    public void user_review_delete(@RequestParam("review_no") int review_no, HttpServletResponse response,
            HttpServletRequest request) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        int check = this.reviewDAO.deleteReview(review_no);
        if (check > 0) {
            out.println("<script>alert('후기글이 성공적으로 삭제되었습니다.'); location.href='" + request.getContextPath() + "/user_review_list'; </script>");
        } else {
            out.println("<script>alert('후기글 삭제에 실패했습니다.'); history.back(); </script>");
        }
    }

}
