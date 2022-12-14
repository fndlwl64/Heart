package com.heartpet.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.heartpet.action.AnimalDAO;
import com.heartpet.action.ReviewDAO;
import com.heartpet.model.PageDTO;
import com.heartpet.model.ReviewDTO;

@Controller
public class AdminReviewController {
    
    @Autowired
    private ReviewDAO reviewDAO;

    @Autowired
    private AnimalDAO animalDAO;

    // 한 페이지당 보여질 게시물의 수
    private final int rowsize = 4;

    // 전체 게시물의 수
    private int totalRecord = 0;

    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_LIST - 고양이/강아지 선택 추가
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/admin_review_list")
    public String user_review_list(@RequestParam(value = "field", required = false) String field,
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
    public String user_review_content(@RequestParam("review_no") int review_no, Model model) {
        ReviewDTO reviewContent = this.reviewDAO.contentReview(review_no);
        this.reviewDAO.hitReview(review_no);
        model.addAttribute("reviewContent", reviewContent);
        System.out.println("here");
        return "admin/review/review_content";
    }

}
