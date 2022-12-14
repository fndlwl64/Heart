package com.heartpet.project;

import com.heartpet.action.NoticeDAO;

import com.heartpet.model.AnimalDTO;
import com.heartpet.model.NoticeDTO;
import com.heartpet.model.PageDTO;
import com.heartpet.action.AnimalDAO;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@EnableWebMvc
@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;


    // 한 페이지당 보여질 게시물의 수
    private final int rowsize = 3;

    // 전체 게시물의 수
    private int totalRecord = 0;


    
    @RequestMapping("/login")
    public String login(@RequestParam("user_id")String id, @RequestParam("user_pwd")String pwd, Model model,HttpServletResponse response, HttpServletRequest request) throws IOException {
    	response.setContentType("text/html; charset=utf-8");
    	
    	int check = userDAO.idCheck(id);
    	int admin_check = userDAO.adminCheck(id);
    	UserDTO cont = userDAO.getUserInfo(id);
    	String check_pwd = userDAO.login(id);
    	
    	System.out.println(check+"/"+admin_check+"/"+check_pwd);
    	
    	PrintWriter out = response.getWriter();
    	
    	if(check == 1) {
    		    		
    		System.out.println(admin_check+"관리자인지 체크 / id :"+id);
    		if(admin_check == 1) {
    			// 관리자 아이디 로그인 => 관리자 페이지로 이동
    			if(pwd.equals(check_pwd)) {
    				HttpSession session = request.getSession();
    				session.setAttribute("session_admin_id", id);
    				session.setAttribute("session_admin_name", cont.getUser_name());
    				    				    				
    				return "admin/admin_main";
    			}else {
    				out.println("<script>");
    				out.println("alert('비밀번호가 틀렸습니다!!');");
    				out.println("history.back();");
    				out.println("</script>");
    				out.flush();
    			}
    		// 회원 아이디 로그인	    			
    		}else {
    			if(pwd.equals(check_pwd)) {
        			UserDTO dto = userDAO.getUserInfo(id);
        			  		
    	    		HttpSession session = request.getSession();
    	    		
    	    		session.setAttribute("session_id", id);
    	    		session.setAttribute("session_name", cont.getUser_name());
    	    		session.setAttribute("session_grade", cont.getUser_grade());
    	    			    		
    	    		out.println("<script>");
    				out.println("alert('로그인 되었습니다!');");
    				out.println("location.href='"+request.getContextPath()+"'");
    				out.println("</script>");
    				out.flush();
    				
    				System.out.println("세션id: "+id);
    	    	}else {
    	    		out.println("<script>");
    				out.println("alert('비밀번호가 틀렸습니다!!');");
    				out.println("history.back();");
    				out.println("</script>");
    				out.flush();
    	    	}
			}    		    		
    		
    	}else {
    		out.println("<script>");
			out.println("alert('가입되지 않은 아이디입니다.');");
			out.println("location.href='"+request.getContextPath()+"'");
			out.println("</script>");
			out.flush();
    	}
    	return "main";
    }
    
    @RequestMapping("/id_check")
    public @ResponseBody int id_check(@RequestParam("paramId") String id) {
    	int check = userDAO.idCheck(id);
    	return check;
    }
    
    @RequestMapping("/kakao_login")
    public void kakao(@RequestParam("paramId")String id, @RequestParam("paramName")String name, HttpServletRequest request, HttpServletResponse response) throws IOException{
    	
    	PrintWriter out = response.getWriter();
    	int check = userDAO.idCheck(id);
    	
    	if(check == 1) {
    		UserDTO dto = userDAO.getUserInfo(id);
    		UserDTO cont = userDAO.getUserInfo(id);
    		
			HttpSession session = request.getSession();
			session.setAttribute("session_id", id);
			session.setAttribute("session_name", cont.getUser_name());
			session.setAttribute("session_grade", cont.getUser_grade());
			
			out.println("<script>");
			out.println("alert('로그인 되었습니다!');");
			out.println("location.href='"+request.getContextPath()+"'");
			out.println("</script>");
			out.flush();
			
			System.out.println("아이디 존재 => 카카오 로그인 성공");
			System.out.println("세션id: "+id);
    	}else {
    		
    		Map<String, Object> map = new HashMap<String, Object>();
    		map.put("id", id);
    		map.put("name", name);
    		
    		int res = userDAO.kakaoInsert(map);
    		
    		if(res>0) {
    			UserDTO dto = userDAO.getUserInfo(id);
        		
    			HttpSession session = request.getSession();
        		session.setAttribute("session_id", id);
        		session.setAttribute("session_name", dto.getUser_name());
        		session.setAttribute("session_grade", 3);
        		
        		out.println("<script>");
				out.println("alert('로그인 되었습니다!');");
				out.println("location.href='"+request.getContextPath()+"'");
				out.println("</script>");
				out.flush();
        		
        		System.out.println("아이디 없음 => 카카오 계정 가입 성공");
        		System.out.println("세션id: "+id);
    		}else {
    			out.println("<script>");
    			out.println("alert('가입 실패ㅠ');");
    			out.println("history.back()");
    			out.println("</script>");
    			out.flush();
    		}
    	}
    }
    
    @RequestMapping("/naver_logined")
    public void naver(@RequestParam("id")String id, @RequestParam("name")String name, @RequestParam("email")String email, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	System.out.println("/naver_logined : "+id+" /name : "+name+"/email : "+email);
    	PrintWriter out = response.getWriter();
    	int check = userDAO.idCheck(id);
    	
    	if(check == 1) {
    		UserDTO cont = userDAO.getUserInfo(id);
    		
			session = request.getSession();
			session.setAttribute("session_id", id);
			session.setAttribute("session_name", cont.getUser_name());
			session.setAttribute("session_grade", cont.getUser_grade());
			
			out.println("<script>");
			out.println("alert('로그인 되었습니다!');");
			out.println("location.href='"+request.getContextPath()+"'");
			out.println("</script>");
			out.flush();
			
			System.out.println("아이디 존재 => 네이버 로그인 성공");
			System.out.println("세션id: "+id);
    	}else {
    		
    		Map<String, Object> map = new HashMap<String, Object>();
    		map.put("id", id);
    		map.put("name", name);
    		map.put("email", email);
    		
    		int res = userDAO.naverInsert(map);
    		
    		if(res>0) {
    			UserDTO dto = userDAO.getUserInfo(id);
        		
    			session = request.getSession();
        		session.setAttribute("session_id", id);
        		session.setAttribute("session_name", dto.getUser_name());
        		session.setAttribute("session_grade", dto.getUser_grade());
        		
        		out.println("<script>");
				out.println("alert('로그인 되었습니다!');");
				out.println("location.href='"+request.getContextPath()+"'");
				out.println("</script>");
				out.flush();
        		
        		System.out.println("아이디 없음 => 네이버 계정 가입 성공");
        		System.out.println("세션id: "+id);
    		}else {
    			out.println("<script>");
    			out.println("alert('가입 실패ㅠ');");
    			out.println("history.back()");
    			out.println("</script>");
    			out.flush();
    		}
    	}
    }
    
    @RequestMapping("/naver_login")
    public String naver_login(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	
    	return "user/callback";
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
        return "user/join";
    }
    
    @RequestMapping(value="/joinOk")
    public void joinOk(UserDTO dto, HttpServletRequest request,HttpServletResponse response) throws IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=utf-8");
    	
    	int res = userDAO.join(dto);
    	
    	PrintWriter out = response.getWriter();
    	
    	if(res>0) {
    		out.println("<script>");
    		out.println("alert('회원가입이 완료되었습니다!');");
    		out.println("location.href='"+request.getContextPath()+"'");
    		out.println("</script>");
    		out.flush();
    		System.out.println("회원가입 완료");
    	}else {
    		out.println("<script>");
    		out.println("alert('회원가입에 실패했습니다');");
    		out.println("history.back()");
    		out.println("</script>");
    		out.flush();
    		System.out.println("회원가입 실패");
    	}
    }
    
    @RequestMapping("/email_check")
    public @ResponseBody int email_check(@RequestParam("email") String email) {
    	int check = userDAO.emailCheck(email);
    	return check;
    }
    
    @RequestMapping("/user_find_id")
    public @ResponseBody String findid(@RequestParam("user_name")String name, @RequestParam("user_email")String email) {
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("name", name);
    	map.put("email", email);
    	
    	String res = userDAO.findid(map);
    	return res;
    }

}
