package com.heartpet.project;

import com.heartpet.action.NoticeDAO;

import com.heartpet.model.AnimalDTO;
import com.heartpet.model.NoticeDTO;
import com.heartpet.model.PageDTO;
import com.heartpet.action.AnimalDAO;
import com.heartpet.action.DogDAO;
import com.heartpet.action.QnaDAO;
import com.heartpet.action.UserDAO;
import com.heartpet.model.QnaDTO;
import com.heartpet.model.UserDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;

    @Autowired
    private QnaDAO qnaDAO;

    @Autowired
    private NoticeDAO noticedao;
    
    // 한 페이지당 보여질 게시물의 수
    private final int rowsize = 3;

    // 전체 게시물의 수
    private int totalRecord = 0;

    @RequestMapping("/user_support")
    public String user_support() {
        return "user/support/support";
    }

    // 검색 기능 구현 중
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
    
    @RequestMapping("/user_qna_insert")
    public String user_qna_insert() { 
    	return "user/qna/qna_insert";
    }
    
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

    @RequestMapping("/user_qna_update")
    public String user_qna_update(@RequestParam("board_no") int board_no, Model model) {
    	QnaDTO qnaContent = this.qnaDAO.contentQna(board_no);
    	model.addAttribute("qnaContent", qnaContent);
    	return "user/qna/qna_update"; 
    }
    
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

    @RequestMapping("/user_qna_content")
    public String user_qna_content(@RequestParam("board_no") int board_no, Model model) { 
    	this.qnaDAO.hitQna(board_no);
    	QnaDTO qnaContent = this.qnaDAO.contentQna(board_no);
    	model.addAttribute("qnaContent", qnaContent);
    	return "user/qna/qna_content"; 
    }

    @RequestMapping("/user_fnq_list")
    public String user_fnq_list() { return "qna/fnq_list"; }

    @RequestMapping("/user_notice")
    public String notice(Model model) {
        List<NoticeDTO> list = noticedao.getNoticeList();    
        model.addAttribute("List", list);
        return "user/notice/notice_list";
    }

    @RequestMapping("/user_review_list")
    public String user_review_list() { return "user/review/review_list"; }

    @RequestMapping("/user_review_insert")
    public String user_review_insert() { return "user/review/review_insert"; }

    @RequestMapping("/user_review_content")
    public String user_review_content() { return "user/review/review_content"; }

    @RequestMapping("/user_review_update")
    public String review_update() { return "user/review/review_update"; }

    @RequestMapping("/user_mypage_wish_list")
    public String mypage_wish_list() {
        return "user/mypage/mypage_wish_list";
    }
    
    @RequestMapping("/login")
    public String login(@RequestParam("user_id")String id, @RequestParam("user_pwd")String pwd, HttpServletResponse response, HttpServletRequest request) throws IOException {
    	
    	response.setContentType("text/html; charset=utf-8");
    	request.setCharacterEncoding("utf-8");
    	
    	int check = userDAO.idCheck(id);
    	
    	String check_pwd = userDAO.login(id);
    	
    	PrintWriter out = response.getWriter();
    	
    	if(check == 1) {
    		    		
    		if(pwd.equals(check_pwd)) {
    			UserDTO dto = userDAO.getUserInfo(id);
    			
	    		String user_number = dto.getUser_no();
	    		    		
	    		HttpSession session = request.getSession();
	    		
	    		session.setAttribute("session_id", id);
	    		session.setAttribute("session_no", user_number);
	    			    		
	    		out.println("<script>");
				out.println("alert('로그인 되었습니다!');");
				out.println("location.href='"+request.getContextPath()+"'");
				out.println("</script>");
				
				System.out.println("세션id: "+id+", 세션no: "+user_number);
	    	}else {
	    		out.println("<script>");
				out.println("alert('비밀번호가 틀렸습니다!!');");
				out.println("history.back();");
				out.println("</script>");
	    	}
    	}else {
    		out.println("<script>");
			out.println("alert('가입되지 않은 아이디입니다.');");
			out.println("location.href='"+request.getContextPath()+"'");
			out.println("</script>");
    	}
    	return "main";
    }
    
    @RequestMapping("/kakao_login")
    public void login(@RequestParam("paramId")String id, @RequestParam("paramName")String name, HttpServletRequest request, HttpServletResponse response) throws IOException{
    	
    	PrintWriter out = response.getWriter();
    	int check = userDAO.idCheck(id);
    	
    	if(check == 1) {
    		
    		UserDTO dto = userDAO.getUserInfo(id);
    		String user_no = dto.getUser_no();
    		
			HttpSession session = request.getSession();
			session.setAttribute("session_id", id);
			session.setAttribute("session_no", user_no);
			
			out.println("<script>");
			out.println("alert('로그인 되었습니다!');");
			out.println("location.href='"+request.getContextPath()+"'");
			out.println("</script>");
			
			System.out.println("아이디 존재 => 카카오 로그인 성공");
			System.out.println("세션id: "+id+", 세션no: "+user_no);
    	}else {
    		
    		Map<String, Object> map = new HashMap<String, Object>();
    		map.put("id", id);
    		map.put("name", name);
    		
    		int res = userDAO.kakaoInsert(map);
    		
    		if(res>0) {
    			UserDTO dto = userDAO.getUserInfo(id);
        		String user_no = dto.getUser_no();
        		
    			HttpSession session = request.getSession();
        		session.setAttribute("session_id", id);    
        		session.setAttribute("session_no", user_no);
        		
        		out.println("<script>");
				out.println("alert('로그인 되었습니다!');");
				out.println("location.href='"+request.getContextPath()+"'");
				out.println("</script>");
        		
        		System.out.println("아이디 없음 => 카카오 계정 가입 성공");
        		System.out.println("세션id: "+id+", 세션no: "+user_no);
    		}else {
    			out.println("<script>");
    			out.println("alert('가입 실패ㅠ');");
    			out.println("history.back()");
    			out.println("</script>");
    		}
    	}
    }
    
    @RequestMapping("/user_logout")
    public void logout(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
    	
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=utf-8");
    	
    	session.invalidate(); //세션의 모든 속성을 삭제
    	PrintWriter out = response.getWriter();
    	
    	out.println("<script>");
		out.println("alert('로그아웃 되었습니다!');");
		out.println("location.href='"+request.getContextPath()+"'");
		out.println("</script>");
		
		System.out.println("로그아웃 완료");
		 
    }
    
    @RequestMapping("/join")
    public String join() {
        return "user/user/join";
    }
    
    @RequestMapping(value="/joinOk")
    public void joinOk(UserDTO dto, HttpServletRequest request,HttpServletResponse response) throws IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=utf-8");
    	    	    	
    	//System.out.println("값 확인 : "+dto.getUser_grade()+", "+dto.getUser_dogexp()+", "+(ad1+ad3+ad2));
    	//System.out.println("값 확인 : "+dto.getUser_id()+", "+dto.getUser_pwd()+", "+dto.getUser_email());
    	//System.out.println("값 확인 : "+dto.getUser_name()+", "+dto.getUser_phone()+", "+dto.getUser_addr());
    	
    	int res = userDAO.join(dto);
    	
    	PrintWriter out = response.getWriter();
    	
    	if(res>0) {
    		out.println("<script>");
    		out.println("alert('회원가입이 완료되었습니다!');");
    		out.println("location.href='"+request.getContextPath()+"'");
    		out.println("</script>");
    		System.out.println("회원가입 완료");
    	}else {
    		out.println("<script>");
    		out.println("alert('회원가입에 실패했습니다');");
    		out.println("history.back()");
    		out.println("</script>");
    		System.out.println("회원가입 실패");
    	}
    }

    @RequestMapping("/user_mypage_adoptreg_list")
    public String mypage_adoptreg_list() {
        return "user/mypage/mypage_adopt_reg_list";
    }
    @RequestMapping("/user_mypage_adoptcomplet_list")
    public String mypage_adoptcomplet_list() {
        return "user/mypage/mypage_adopt_complet_list";
    }
    @RequestMapping("/user_mypage_user_update")
    public String mypage_user_update() {
        return "user/mypage/mypage_user_update";
    }
    @RequestMapping("/user_mypage_user_delete")
    public String mypage_user_delete() {
        return "user/mypage/mypage_user_delete";
    }
    @RequestMapping("/user_mypage_support_list")
    public String mypage_support_list() {
        return "user/mypage/mypage_support_list";
    }
    @RequestMapping("/user_mypage_grade_list")
    public String mypage_grade_list() {
        return "user/mypage/mypage_grade_list";
    }
  
    @RequestMapping("/user_notice_content")
    public String notice_content(@RequestParam("no") int no, Model model) {
    	NoticeDTO dto = this.noticedao.getNotice(no);
    	model.addAttribute("Cont", dto);
    	noticedao.readCount(no);
    	return "user/notice/notice_content";
    }
}
