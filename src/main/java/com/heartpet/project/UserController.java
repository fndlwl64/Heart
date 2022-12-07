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
    private DogDAO dogDAO;
	
	@Autowired
	private UserDAO userDAO;

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

    @RequestMapping("/user_notice")
    public String notice(Model model) {
        List<NoticeDTO> list = noticedao.getNoticeList();    
        model.addAttribute("List", list);
        return "user/notice/notice_list";
    }

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
        return "mypage/mypage_support_list";
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
