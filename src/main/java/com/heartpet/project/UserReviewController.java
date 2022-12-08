package com.heartpet.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.heartpet.action.ReviewDAO;
import com.heartpet.model.PageDTO;
import com.heartpet.model.ReviewDTO;

@Controller
public class UserReviewController {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
    // 한 페이지당 보여질 게시물의 수
    private final int rowsize = 4;

    // 전체 게시물의 수
    private int totalRecord = 0;
    
    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_LIST
    ////////////////////////////////////////////////////////////////////////////////////	
    @RequestMapping("/user_review_list")
    public String user_review_list(@RequestParam(value = "field", required = false) String field, 
    		@RequestParam(value = "keyword", required = false) String keyword, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {  
    	
      	if(field == null) { field = ""; }
       	if(keyword == null) { keyword = ""; }
    	
		int currentPage = 1;	// 현재 페이지 변수
		if(page != 0) { currentPage = page; }
		
		totalRecord = this.reviewDAO.listReviewCount(field, keyword);    	
    	PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);
    			
    	List<ReviewDTO> reviewList = this.reviewDAO.listReview(paging.getStartNo(), paging.getEndNo(), field, keyword);
    	
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
    public String user_review_content() { return "user/review/review_content"; }
    
    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_INSERT
    ////////////////////////////////////////////////////////////////////////////////////	
    @RequestMapping("/user_review_insert")
    public String user_review_insert() { return "user/review/review_insert"; }
    
    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_UPDATE
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/user_review_update")
    public String review_update() { return "user/review/review_update"; }

}
