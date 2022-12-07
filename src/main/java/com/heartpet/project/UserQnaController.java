package com.heartpet.project;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.heartpet.action.QnaDAO;
import com.heartpet.model.PageDTO;
import com.heartpet.model.QnaDTO;

@Controller
public class UserQnaController {

    @Autowired
    private QnaDAO qnaDAO;
    
    // 한 페이지당 보여질 게시물의 수
    private final int rowsize = 3;

    // 전체 게시물의 수
    private int totalRecord = 0;
    
    ////////////////////////////////////////////////////////////////////////////////////
    // QNA_LIST
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/user_qna_list")
    public String user_qna_list(@RequestParam(required = false) String field, @RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int page, Model model) {
    	if(field == null) { field = ""; }
       	if(keyword == null) { keyword = ""; }
    	
		int currentPage = 1;	// 현재 페이지 변수
		if(page != 0) { currentPage = page; }
    	
    	totalRecord = this.qnaDAO.listQnaCount(field, keyword);
    	PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);
    	
        List<QnaDTO> qnaList = this.qnaDAO.listQna(paging.getStartNo(), paging.getEndNo(), field, keyword);
        
        model.addAttribute("qnaList", qnaList);
        model.addAttribute("total", totalRecord);
        model.addAttribute("paging", paging);		
		model.addAttribute("field", field); 
		model.addAttribute("keyword", keyword);	
		
        return "user/qna/qna_list";
    }
    
    ////////////////////////////////////////////////////////////////////////////////////
    // QNA_INSERT
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/user_qna_insert")
    public String user_qna_insert() { 
    	return "user/qna/qna_insert";
    }
    
    ////////////////////////////////////////////////////////////////////////////////////
    // QNA_INSERT_OK
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/user_qna_insert_ok", method = RequestMethod.POST)
    public void user_qna_insert_ok(@Valid QnaDTO qnaDto, BindingResult result, HttpServletResponse response, HttpServletRequest request) throws IOException {
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
        	int check = this.qnaDAO.insertQna(qnaDto);
    		if(check > 0) {
    			out.println("<script>alert('글이 성공적으로 등록되었습니다.'); location.href='"+request.getContextPath()+"/user_qna_list'; </script>");
    		}else {
    			out.println("<script>alert('글 등록을 실패했습니다.'); history.back(); </script>");
    		}
    	}
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // QNA_UPDATE
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/user_qna_update")
    public String user_qna_update(@RequestParam("board_no") int board_no, Model model) {
    	QnaDTO qnaContent = this.qnaDAO.contentQna(board_no);
    	model.addAttribute("qnaContent", qnaContent);
    	return "user/qna/qna_update"; 
    }
    
    ////////////////////////////////////////////////////////////////////////////////////
    // QNA_UPDATE_OK
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/user_qna_update_ok", method = RequestMethod.POST)
    public void user_qna_update_ok(@Valid QnaDTO qnaDto, BindingResult result, HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
    	QnaDTO qnaContent = this.qnaDAO.contentQna(qnaDto.getBoard_no());
    	
    	// 비번 check
    	if(!qnaDto.getBoard_pwd().equals(qnaContent.getBoard_pwd())) { out.println("<script>alert('비밀번호를 다시 확인해주세요.'); history.back(); </script>"); } 
    	
    	// 유효성 검사
    	if(result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();
			for(ObjectError error : errors) {
				if(error.getDefaultMessage().equals("title")) { out.println("<script>alert('글 제목이 없습니다.'); history.back(); </script>"); break; }
				else if(error.getDefaultMessage().equals("content")) { out.println("<script>alert('글 내용이 없습니다.'); history.back(); </script>"); break; }
				else if(error.getDefaultMessage().equals("password")) { out.println("<script>alert('글 비밀번호를 입력해주세요.'); history.back(); </script>"); break; }
				else if(error.getDefaultMessage().equals("regexp")) { out.println("<script>alert('비밀번호는 6자 이상 10자 이하의 숫자 및 영문자로 구성되어야 합니다. 다시 입력해주세요.'); history.back(); </script>"); break; }
			}
    	}else {   		        			
        	int check = this.qnaDAO.insertQna(qnaDto);        	
    		if(check > 0) { out.println("<script>alert('글이 성공적으로 수정되었습니다.'); location.href='"+request.getContextPath()+"/user_qna_list'; </script>"); }
    		else { out.println("<script>alert('글 수정을 실패했습니다.'); history.back(); </script>"); }
    	}    	
    }
    
    ////////////////////////////////////////////////////////////////////////////////////
    // QNA_CONTENT
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/user_qna_content")
    public String user_qna_content(@RequestParam("board_no") int board_no, Model model) { 
    	this.qnaDAO.hitQna(board_no);
    	QnaDTO qnaContent = this.qnaDAO.contentQna(board_no);
    	model.addAttribute("qnaContent", qnaContent);
    	return "user/qna/qna_content"; 
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // FNQ_LIST
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/user_fnq_list")
    public String user_fnq_list() { return "user/qna/fnq_list"; }


}
