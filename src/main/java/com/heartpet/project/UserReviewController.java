package com.heartpet.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		if(page != 1) { currentPage = page; }
		
		totalRecord = this.reviewDAO.listReviewCount(field, keyword);
    	PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);
    			
    	// animal name 추출
    	List<ReviewDTO> reviewList = this.reviewDAO.listReview(paging.getStartNo(), paging.getEndNo(), field, keyword);
    	int aniamlNo[] = new int[reviewList.size()];
    	
    	for(int i=0; i<reviewList.size(); i++) { 
    		aniamlNo[i] = reviewList.get(i).getReview_animal_id();
    	}
    	
    	this.reviewDAO.animalReview(aniamlNo);
    	
    	
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
    public String user_qna_content(@RequestParam("review_no") int review_no, HttpServletResponse response, HttpServletRequest request, Model model) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
    	HttpSession session = request.getSession();
    	PrintWriter out = response.getWriter();
    	
    	// 로그인 여부 체크
    	if(session.getAttribute("session_id") == null || session.getAttribute("session_id") == "" ) {
    		out.println("<script> alert('로그인이 필요합니다.'); location.href='"+request.getContextPath()+"/login'; </script>");
    	}
    	
    	ReviewDTO reviewContent = this.reviewDAO.contentReview(review_no);

    	this.reviewDAO.hitReview(review_no);
    	model.addAttribute("reviewContent", reviewContent);
    	return "user/review/review_content";
    }
    
    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_INSERT
    ////////////////////////////////////////////////////////////////////////////////////	
    @RequestMapping("/user_review_insert")
    public String user_review_insert(HttpServletResponse response, HttpServletRequest request) throws IOException { 
		response.setContentType("text/html; charset=UTF-8");
    	HttpSession session = request.getSession();
    	PrintWriter out = response.getWriter();
    	
    	// 로그인 여부 체크
    	if(session.getAttribute("session_id") == null || session.getAttribute("session_id") == "" ) {
    		out.println("<script> alert('로그인이 필요합니다.'); location.href='"+request.getContextPath()+"/'; </script>");
    		out.flush();
    	}    	    	
    	return "user/review/review_insert";       	
    }  
    
    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_INSERT_OK
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/user_review_insert_ok", method = RequestMethod.POST)
    public void user_qna_insert_ok(@Valid ReviewDTO reviewDto, BindingResult result, HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
    	if(result.hasErrors()) { // 에러를 List로 저장
			List<ObjectError> errors = result.getAllErrors();
			for(ObjectError error : errors) {
				if(error.getDefaultMessage().equals("title")) { out.println("<script>alert('글 제목이 없습니다.'); history.back(); </script>"); break; }
				else if(error.getDefaultMessage().equals("content")) { out.println("<script>alert('글 내용이 없습니다.'); history.back(); </script>"); break; }
				else if(error.getDefaultMessage().equals("password")) { out.println("<script>alert('글 비밀번호를 입력해주세요.'); history.back(); </script>"); break; }
				else if(error.getDefaultMessage().equals("regexp")) { out.println("<script>alert('비밀번호는 6자 이상 10자 이하의 숫자 및 영문자로 구성되어야 합니다. 다시 입력해주세요.'); history.back(); </script>"); break; }
			}
    	}else {
        	int check = this.reviewDAO.insertReview(reviewDto);
    		if(check > 0) {
    			out.println("<script>alert('글이 성공적으로 등록되었습니다.'); location.href='"+request.getContextPath()+"/user_review_list'; </script>");
    		}else {
    			out.println("<script>alert('글 등록을 실패했습니다.'); history.back(); </script>");
    		}
    	}
    }
    
    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_UPDATE
    ////////////////////////////////////////////////////////////////////////////////////
    //@RequestMapping("/user_qna_update")
    @RequestMapping("/user_review_update")
    public String user_qna_update(@RequestParam("review_no") int review_no, Model model) {
    	ReviewDTO reviewContent = this.reviewDAO.contentReview(review_no);
    	model.addAttribute("reviewContent", reviewContent);
    	return "user/review/review_update"; 
    }
    
    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_UPDATE_OK
    ////////////////////////////////////////////////////////////////////////////////////    
    //@RequestMapping(value = "/user_qna_update_ok", method = RequestMethod.POST)
    @RequestMapping(value = "/user_review_update_ok", method = RequestMethod.POST)
    public void user_review_update_ok(ReviewDTO reviewDto, BindingResult result, HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

    	// 유효성 검사		
    	int check = this.reviewDAO.updateReview(reviewDto);     
		if(check > 0) { 
			out.println("<script>alert('글이 성공적으로 수정되었습니다.'); location.href='"+request.getContextPath()+"/user_review_list'; </script>"); 
		}else { 
			out.println("<script>alert('글 수정을 실패했습니다.'); history.back(); </script>"); 
		}
    }   
    
    ////////////////////////////////////////////////////////////////////////////////////
    // REVIEW_DELETE
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/user_review_delete")
    public void user_qna_delete(@RequestParam("review_no") int review_no, HttpServletResponse response, HttpServletRequest request) throws IOException { 
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
    	
    	int check = this.reviewDAO.deleteReview(review_no);
    	if(check > 0) { out.println("<script>alert('글이 성공적으로 삭제되었습니다.'); location.href='"+request.getContextPath()+"/user_review_list'; </script>"); }
		else { out.println("<script>alert('글 삭제 실패!'); history.back(); </script>"); }
    }

}
