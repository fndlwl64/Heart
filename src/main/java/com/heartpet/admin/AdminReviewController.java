package com.heartpet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.heartpet.action.ReviewDAO;
import com.heartpet.model.PageDTO;
import com.heartpet.model.ReviewDTO;

@Controller
public class AdminReviewController {
    
    @Autowired
    private ReviewDAO reviewDAO;

    // 한 페이지당 보여질 게시물의 수
    private final int rowsize = 4;

    // 전체 게시물의 수
    private int totalRecord = 0;

    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_LIST - 고양이/강아지 선택 추가
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/admin_review_list")
    public String admin_review_list(@RequestParam(value = "field", required = false) String field,
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "animal_tag", required = false) String animal_tag,
            @RequestParam(value = "page", defaultValue = "1") int page, Model model) {

        if (field == null) {
            field = "";
        }
        if (keyword == null) {
            keyword = "";
        }

        int currentPage = 1; // 현재 페이지 변수
        if (page != 1) {
            currentPage = page;
        }

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

        return "admin/review/review_list";
    }
    
    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_CONTENT
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/admin_review_content")
    public String admin_review_content(@RequestParam("review_no") int review_no, Model model) {
        ReviewDTO reviewContent = this.reviewDAO.contentReview(review_no);
        this.reviewDAO.hitReview(review_no);
        model.addAttribute("reviewContent", reviewContent);
        System.out.println("here");
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
    public void admin_review_update_ok(ReviewDTO reviewDto, BindingResult result, HttpServletResponse response,
            HttpServletRequest request) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
      
        int check = this.reviewDAO.updateReview(reviewDto);
        if (check > 0) {
            out.println("<script>alert('글이 성공적으로 수정됐습니다.'); location.href='" + request.getContextPath() + "/admin_review_list'; </script>");
        } else {
            out.println("<script>alert('글 수정을 실패했습니다.'); history.back(); </script>");
        }
    }
    
    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_DELETE
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/admin_review_delete", method = RequestMethod.POST)
    public void admin_review_delete(@RequestParam("review_no") int review_no, HttpServletResponse response,
            HttpServletRequest request) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
      
        int check = this.reviewDAO.deleteReview(review_no);
        if (check > 0) {
            out.println("<script>alert('글이 성공적으로 삭제됐습니다.'); location.href='" + request.getContextPath() + "/admin_review_list'; </script>");
        } else {
            out.println("<script>alert('글 삭제를 실패했습니다.'); history.back(); </script>");
        }
    }

}
