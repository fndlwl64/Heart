package com.heartpet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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

import com.heartpet.action.QnaDAO;
import com.heartpet.model.FnqDTO;
import com.heartpet.model.PageDTO;
import com.heartpet.model.QnaDTO;

@Controller
public class AdminQnaController {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	@Autowired
	private HttpServletRequest request;
	
    // 한 페이지당 보여질 게시물의 수
    private final int rowsize = 10;

    // 전체 게시물의 수
    private int totalRecord = 0;
    
    ///////////////////////////////////////////////////////////////////
    // QNA_LIST
    ///////////////////////////////////////////////////////////////////        
    @RequestMapping("/admin_qna_list")
    public String admin_qna_list(@RequestParam(value = "field", required = false) String field, 
    		@RequestParam(value = "keyword", required = false) String keyword, 
    		@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
    	
    	if(field == null) { field = ""; }
       	if(keyword == null) { keyword = ""; }
    	
		int currentPage = 1;	// 현재 페이지 변수
		if(page != 1) { currentPage = page; }
    	
    	totalRecord = this.qnaDAO.listQnaCount(field, keyword);
    	PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);
    	
        List<QnaDTO> qnaList = this.qnaDAO.listQna(paging.getStartNo(), paging.getEndNo(), field, keyword);
        
        model.addAttribute("qnaList", qnaList);
        model.addAttribute("total", totalRecord);
        model.addAttribute("paging", paging);		
		model.addAttribute("field", field); 
		model.addAttribute("keyword", keyword);	
		
        return "admin/qna/qna_list";
    }
    
    ///////////////////////////////////////////////////////////////////
    // QNA_CONTENT
    ///////////////////////////////////////////////////////////////////    
    @RequestMapping("/admin_qna_content")
    public String admin_qna_content(@RequestParam("board_no") int board_no, Model model) {
        QnaDTO qnaContent = this.qnaDAO.contentQna(board_no);
        model.addAttribute("qnaContent", qnaContent);
        return "admin/qna/qna_content";
    }
	
    ///////////////////////////////////////////////////////////////////
    // QNA_REPLY_INSERT
    ///////////////////////////////////////////////////////////////////
    @RequestMapping("/admin_qna_reply_insert")
    public String admin_qna_reply_insert(@RequestParam(value = "board_parentNo", defaultValue = "0") int board_parentNo,
    			Model model, HttpServletResponse response) throws IOException {    	
		
    	response.setContentType("text/html; charset=UTF-8");
    	HttpSession session = request.getSession();
    	PrintWriter out = response.getWriter();
    	
    	// 관리자 로그인 여부 체크
    	if(session.getAttribute("session_admin_id") == null || session.getAttribute("session_admin_id") == "" ) {
    		out.println("<script> alert('관리자 로그인이 필요합니다.'); location.href='"+request.getContextPath()+"/'; </script>");
    		out.flush();
    	}
    	
    	QnaDTO qnaContent = this.qnaDAO.contentQna(board_parentNo);
    	model.addAttribute("qnaContent", qnaContent);
    	return "admin/qna/qna_reply_insert";
    }
    
    ///////////////////////////////////////////////////////////////////
    // QNA_REPLY_INSERT_OK
    ///////////////////////////////////////////////////////////////////    
    @RequestMapping(value = "/admin_qna_reply_insert_ok", method = RequestMethod.POST)
    public void admin_qna_reply_insert_ok(@Valid QnaDTO qnaDto, BindingResult result, HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
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
    		if(check > 0) {
    			out.println("<script>alert('성공적으로 답변글이 등록되었습니다.'); location.href='"+request.getContextPath()+"/admin_qna_list'; </script>");
    		}else {
    			out.println("<script>alert('답변글 등록을 실패했습니다.'); history.back(); </script>");
    		}
    	}
    }
    
    ///////////////////////////////////////////////////////////////////
    // QNA_REPLY_UPDATE
    ///////////////////////////////////////////////////////////////////	
    @RequestMapping("/admin_qna_reply_update")
    public String admin_qna_reply_update(@RequestParam(value = "board_parentNo", defaultValue = "0") int board_parentNo,
			Model model, HttpServletResponse response) throws IOException {
    	response.setContentType("text/html; charset=UTF-8");
    	HttpSession session = request.getSession();
    	PrintWriter out = response.getWriter();
    	
    	// 관리자 로그인 여부 체크
    	if(session.getAttribute("session_admin_id") == null || session.getAttribute("session_admin_id") == "" ) {
    		out.println("<script> alert('관리자 로그인이 필요합니다.'); location.href='"+request.getContextPath()+"/'; </script>");
    		out.flush();
    	}
    	
    	QnaDTO qnaContent = this.qnaDAO.contentQna(board_parentNo);
    	model.addAttribute("qnaContent", qnaContent);
    	return "admin/qna/qna_reply_update";    	
    }
    
    ///////////////////////////////////////////////////////////////////
    // QNA_REPLY_UPDATE_OK
    ///////////////////////////////////////////////////////////////////    	
    @RequestMapping("/admin_qna_reply_update_ok")
    public void admin_qna_reply_update_ok(@Valid QnaDTO qnaDto, BindingResult result, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
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
    		if(check > 0) {
    			out.println("<script>alert('성공적으로 답변글이 수정되었습니다.'); location.href='"+request.getContextPath()+"/admin_qna_list'; </script>");
    		}else {
    			out.println("<script>alert('답변글 수정을 실패했습니다.'); history.back(); </script>");
    		}
    	}    	
    }
	
    ////////////////////////////////////////////////////////////////////////////////////
    // QNA_DELETE
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/admin_qna_delete")
    public void admin_qna_reply_delete(@RequestParam("board_no") int board_no, HttpServletResponse response) throws IOException { 
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
    	int check = this.qnaDAO.deleteQna(board_no);
    	if(check > 0) { out.println("<script>alert('성공적으로 글이 삭제되었습니다.'); location.href='"+request.getContextPath()+"/admin_qna_list'; </script>"); }
		else { out.println("<script>alert('글 삭제 실패!'); history.back(); </script>"); }
    }
    
    ////////////////////////////////////////////////////////////////////////////////////
    // ================================== FNQ ================================== 
    ////////////////////////////////////////////////////////////////////////////////////
    // FNQ_LIST
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/admin_fnq_list")
    public String admin_fnq_list(@RequestParam(required = false) String field, @RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int page, Model model) { 
    	
    	if(field == null) { field = ""; }
       	if(keyword == null) { keyword = ""; }
    	
		int currentPage = 1;	// 현재 페이지 변수
		if(page != 0) { currentPage = page; }
    	
    	totalRecord = this.qnaDAO.listFnqCount(field, keyword);
    	PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);
    	
        List<FnqDTO> fnqList = this.qnaDAO.listFnq(paging.getStartNo(), paging.getEndNo(), field, keyword);
        
        model.addAttribute("fnqList", fnqList);
        model.addAttribute("total", totalRecord);
        model.addAttribute("paging", paging);		
		model.addAttribute("field", field); 
		model.addAttribute("keyword", keyword);	
        
    	return "admin/fnq/fnq_list"; 
    }
    
    ////////////////////////////////////////////////////////////////////////////////////
    // FNQ_CONTENT
    ////////////////////////////////////////////////////////////////////////////////////  
    @RequestMapping("/admin_fnq_content")
    public String admin_fnq_content(@RequestParam("fnq_no") int fnq_no, Model model) {
        FnqDTO fnqContent = this.qnaDAO.contentFnq(fnq_no);
        model.addAttribute("fnqContent", fnqContent);
        return "admin/fnq/fnq_content";
    }
	
    
    ////////////////////////////////////////////////////////////////////////////////////  
    // FNQ_INSERT
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/admin_fnq_insert")
    public String admin_fnq_insert(HttpServletResponse response, HttpServletRequest request) throws IOException { 
		response.setContentType("text/html; charset=UTF-8");
    	HttpSession session = request.getSession();
    	PrintWriter out = response.getWriter();
    	
    	// 로그인 여부 체크
    	if(session.getAttribute("session_admin_id") == null || session.getAttribute("session_admin_id") == "" ) {
    		out.println("<script> alert('로그인이 필요합니다.'); location.href='"+request.getContextPath()+"/'; </script>");
    		out.flush();
    	} 
    	return "admin/fnq/fnq_insert";
    }  
    
    ////////////////////////////////////////////////////////////////////////////////////
    // FNQ_INSERT_OK
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/admin_fnq_insert_ok")
    public void admin_fnq_insert_ok(@Valid FnqDTO fnqDTO, BindingResult result, HttpServletResponse response, HttpServletRequest request) throws IOException { 
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
    	if(result.hasErrors()) { // 에러를 List로 저장
			List<ObjectError> errors = result.getAllErrors();
			for(ObjectError error : errors) {
				if(error.getDefaultMessage().equals("question")) { out.println("<script>alert('질문 내용이 없습니다.'); history.back(); </script>"); break; }
				else if(error.getDefaultMessage().equals("answer")) { out.println("<script>alert('답변 내용이 없습니다.'); history.back(); </script>"); break; }
			}
    	}else {
        	int check = this.qnaDAO.insertFnq(fnqDTO);
    		if(check > 0) {
    			out.println("<script>alert('성공적으로 글이 등록되었습니다.'); location.href='"+request.getContextPath()+"/admin_fnq_list'; </script>");
    		}else {
    			out.println("<script>alert('글 등록을 실패했습니다.'); history.back(); </script>");
    		}
    	}
    }  
    
    ////////////////////////////////////////////////////////////////////////////////////
    // FNQ_UPDATE
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/admin_fnq_update")
    public String admin_fnq_update(@RequestParam("fnq_no") int fnq_no, Model model) {
    	FnqDTO fnqContent = this.qnaDAO.contentFnq(fnq_no);
    	model.addAttribute("fnqContent", fnqContent);
    	return "admin/fnq/fnq_update"; 
    }
    
    ////////////////////////////////////////////////////////////////////////////////////
    // FNQ_UPDATE_OK
    ////////////////////////////////////////////////////////////////////////////////////    
    @RequestMapping(value = "/admin_fnq_update_ok", method = RequestMethod.POST)
    public void admin_fnq_update_ok(@Valid FnqDTO fnqDto, BindingResult result, HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// 유효성 검사		
    	if(result.hasErrors()) { // 에러를 List로 저장
			List<ObjectError> errors = result.getAllErrors();
			for(ObjectError error : errors) {
				if(error.getDefaultMessage().equals("question")) { out.println("<script>alert('질문 내용이 없습니다.'); history.back(); </script>"); break; }
				else if(error.getDefaultMessage().equals("answer")) { out.println("<script>alert('답변 내용이 없습니다.'); history.back(); </script>"); break; }
			}
    	}else {		
	    	int check = this.qnaDAO.updateFnq(fnqDto);     
			if(check > 0) { 
				out.println("<script>alert('성공적으로 글이 수정되었습니다.'); location.href='"+request.getContextPath()+"/admin_fnq_list'; </script>"); 
			}else { 
				out.println("<script>alert('글 수정을 실패했습니다.'); history.back(); </script>"); 
			}
    	}
    }   
    
    ////////////////////////////////////////////////////////////////////////////////////
    // FNQ_DELETE
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/admin_fnq_delete")
    public void admin_fnq_delete(@RequestParam("fnq_no") int fnq_no, HttpServletResponse response, HttpServletRequest request) throws IOException { 
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
    	
    	int check = this.qnaDAO.deleteFnq(fnq_no);
    	if(check > 0) { out.println("<script>alert('성공적으로 글이 삭제되었습니다.'); location.href='"+request.getContextPath()+"/admin_fnq_list'; </script>"); }
		else { out.println("<script>alert('글 삭제 실패!'); history.back(); </script>"); }
    }
}
