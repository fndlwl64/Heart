package com.heartpet.project;

import java.io.IOException;

import java.io.PrintWriter;
import javax.mail.PasswordAuthentication;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.heartpet.action.AnimalDAO;
import com.heartpet.action.MypageDAO;
import com.heartpet.action.ReviewDAO;
import com.heartpet.model.Mypage_SupportDTO;
import com.heartpet.model.UserDTO;
import com.heartpet.model.WishVO;

//메일보내기위해서 구글 이메일 등록해놓는 클래스
class MyAuthentication extends Authenticator {
	
    
    PasswordAuthentication pa;
    
 
    public MyAuthentication(){
         
        String id = "soopwe12@gmail.com";       // 구글 ID
        String pw = "lgezfcfzoabqkbrg";          // 구글 비밀번호
 
        // ID와 비밀번호를 입력한다.
        pa = new PasswordAuthentication(id, pw);
      
}
    	// 시스템에서 사용하는 인증정보
	    public PasswordAuthentication getPasswordAuthentication() {
	        return pa;
	    }
}

@Controller
public class MypageController {
	
	@Autowired
	private MypageDAO mypagedao;
	
	@Autowired
	private ReviewDAO reviewDAO;

    @RequestMapping("/user_mypage_wish_list")
    public String mypage_wish_list(Model model, HttpServletRequest request) {
    	//세션정보가져오기
    	HttpSession session = request.getSession();
    	String user_id = (String)session.getAttribute("session_id");
    	
    	int sum = mypagedao.SumSupport(user_id);
    	UserDTO user_list = mypagedao.UserInfo(user_id);
    	int regcount = mypagedao.AnimalRegCount(user_id);
    	int review_count = mypagedao.ReviewCount(user_id);
    	List<WishVO> wish_list = mypagedao.getWishList(user_id);
    	model.addAttribute("Sum", sum);
    	model.addAttribute("uList", user_list);
    	model.addAttribute("Count", regcount);
    	model.addAttribute("review_Count", review_count);
    	model.addAttribute("wList", wish_list);
        return "user/mypage/mypage_wish_list";
    }
    
    @RequestMapping("/user_mypage_adoptreg_list")
    public String mypage_adoptreg_list(Model model, HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	String user_id = (String)session.getAttribute("session_id");
    	
    	int sum = mypagedao.SumSupport(user_id);
    	UserDTO user_list = mypagedao.UserInfo(user_id);
    	int regcount = mypagedao.AnimalRegCount(user_id);
    	int review_count = mypagedao.ReviewCount(user_id);
    	List<WishVO> wish_list = mypagedao.getAdoptList(user_id);
    	List<Integer> animal_no = new ArrayList<Integer>();
    	List<Integer> doubleCheck  = new ArrayList<Integer>();
    	
    	for(int i=0; i<wish_list.size(); i++) {
    		animal_no.add(wish_list.get(i).getAnimal_no());
    		//
    		doubleCheck.add(reviewDAO.mypageReviewCount(animal_no.get(i)));
    	}
    		
    	
    	
    	model.addAttribute("Sum", sum);
    	model.addAttribute("uList", user_list);
    	model.addAttribute("Count", regcount);
    	model.addAttribute("review_Count", review_count);
    	model.addAttribute("aList", wish_list);
    	model.addAttribute("doubleCheck", doubleCheck);
        return "user/mypage/mypage_adopt_reg_list";
    }
    
    @RequestMapping("/user_mypage_adoptcomplet_list")
    public String mypage_adoptcomplet_list(Model model, HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	String user_id = (String)session.getAttribute("session_id");
    	
    	int sum = mypagedao.SumSupport(user_id);
    	UserDTO user_list = mypagedao.UserInfo(user_id);
    	int regcount = mypagedao.AnimalRegCount(user_id);
    	int review_count = mypagedao.ReviewCount(user_id);
    	List<WishVO> wish_list = mypagedao.getAdoptComList(user_id);
    	
    	model.addAttribute("Sum", sum);
    	model.addAttribute("uList", user_list);
    	model.addAttribute("Count", regcount);
    	model.addAttribute("review_Count", review_count);
    	model.addAttribute("aList", wish_list);
        return "user/mypage/mypage_adopt_complet_list";
    }
    
    @RequestMapping("/user_mypage_user_update")
    public String mypage_user_update(Model model, HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	String user_id = (String)session.getAttribute("session_id");

    	int sum = mypagedao.SumSupport(user_id);
    	UserDTO user_list = mypagedao.UserInfo(user_id);
    	int regcount = mypagedao.AnimalRegCount(user_id);
    	int review_count = mypagedao.ReviewCount(user_id);
    	model.addAttribute("Sum", sum);
    	model.addAttribute("uList", user_list);
    	model.addAttribute("Count", regcount);
    	model.addAttribute("review_Count", review_count);
        return "user/mypage/mypage_user_update";
    }
    @RequestMapping("/user_mypage_user_update2")
    public void user_update(UserDTO dto, HttpServletResponse response) throws IOException {
    	int check = this.mypagedao.UserUpdate(dto);
    	response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('수정성공!')");
			out.println("location.href='user_mypage_user_update'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('수정실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
    }
    
    @RequestMapping("/user_mypage_support_list")
    public String mypage_support_list(Model model, HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	String user_id = (String)session.getAttribute("session_id");
    	
    	List<Mypage_SupportDTO> list = mypagedao.getSupportList(user_id);
    	int sum = mypagedao.SumSupport(user_id);
    	UserDTO user_list = mypagedao.UserInfo(user_id);
    	int reg_count = mypagedao.AnimalRegCount(user_id);
    	int review_count = mypagedao.ReviewCount(user_id);
    	model.addAttribute("List", list);
    	model.addAttribute("Sum", sum);
    	model.addAttribute("uList", user_list);
    	model.addAttribute("Count", reg_count);
    	model.addAttribute("review_Count", review_count);
        return "user/mypage/mypage_support_list";
    }
    
    @RequestMapping("/user_mypage_grade_list")
    public String mypage_grade_list(Model model, HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	String user_id = (String)session.getAttribute("session_id");
    	
    	int sum = mypagedao.SumSupport(user_id);
    	UserDTO user_list = mypagedao.UserInfo(user_id);
    	int regcount = mypagedao.AnimalRegCount(user_id);
    	int review_count = mypagedao.ReviewCount(user_id);
    	model.addAttribute("Sum", sum);
    	model.addAttribute("uList", user_list);
    	model.addAttribute("Count", regcount);
    	model.addAttribute("review_Count", review_count);
        return "user/mypage/mypage_grade_list";
    }
    
    // 마이페이지에서 회원탈퇴 눌렀을때 나오는 매핑
    @RequestMapping("/user_mypage_user_delete")
    public String mypage_user_delete(Model model, HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	String user_id = (String)session.getAttribute("session_id");
    	
    	int sum = mypagedao.SumSupport(user_id);
    	UserDTO user_list = mypagedao.UserInfo(user_id);
    	int regcount = mypagedao.AnimalRegCount(user_id);
    	int review_count = mypagedao.ReviewCount(user_id);
    	model.addAttribute("Sum", sum);
    	model.addAttribute("uList", user_list);
    	model.addAttribute("Count", regcount);
    	model.addAttribute("review_Count", review_count);
        return "user/mypage/mypage_user_delete";
    }
    
    // 회원탈퇴 시 인증번호를 받고 인증하는 사이트로 넘기는 매핑
    @RequestMapping("/user_mypage_user_deleteCheck")
    public String user_mypage_user_deleteCheck(Model model, HttpServletRequest request) {
    	HttpSession session2 = request.getSession();
    	String user_id = (String)session2.getAttribute("session_id");
    	
    	int sum = mypagedao.SumSupport(user_id);
    	UserDTO user_list = mypagedao.UserInfo(user_id);
    	int regcount = mypagedao.AnimalRegCount(user_id);
    	int review_count = mypagedao.ReviewCount(user_id);
    	model.addAttribute("Sum", sum);
    	model.addAttribute("uList", user_list);
    	model.addAttribute("Count", regcount);
    	model.addAttribute("review_Count", review_count);
    	Properties props = System.getProperties();
        props.put("mail.smtp.user", "soopwe12@gmail.com"); // 서버 아이디만 쓰기
		props.put("mail.smtp.host", "smtp.gmail.com"); // 구글 SMTP
		props.put("mail.smtp.port", "587"); //465
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.debug", "true");
		props.put("mail.smtp.socketFactory.port", "587"); //465
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		Authenticator auth = new MyAuthentication();
		
		//session 생성 및  MimeMessage생성
        Session session = Session.getDefaultInstance(props, auth);
        MimeMessage msg = new MimeMessage(session);
        
        try{
            //편지보낸시간
            msg.setSentDate(new Date());           
            InternetAddress from = new InternetAddress();             
            // 이메일 발신자
            msg.setFrom(from);           
            // 이메일 수신자
            String email = request.getParameter("receiver"); //사용자가 입력한 이메일 받아오기
            InternetAddress to = new InternetAddress(email);         
            msg.setRecipient(Message.RecipientType.TO, to);
            // 이메일 제목
            msg.setSubject("HeartPet 탈퇴 인증번호", "UTF-8");
            // 이메일 내용 
            String code = request.getParameter("code_check"); //인증번호 값 받기
            request.setAttribute("code", code);
            msg.setText(code, "UTF-8");
            // 이메일 헤더 
            msg.setHeader("content-Type", "text/html");
            //메일보내기
            javax.mail.Transport.send(msg);
	        }catch (AddressException addr_e) {
	            addr_e.printStackTrace();
	        }catch (MessagingException msg_e) {
	            msg_e.printStackTrace();
	        }
    	return "user/mypage/mypage_user_deleteCheck";
    }
    
    // 인증번호맞게 입력했을 때 회원 탈퇴되면서 로그아웃 되는 매핑
    @RequestMapping("/user_logout_delete")
    public void logout(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
    	session = request.getSession();
    	String user_id = (String)session.getAttribute("session_id");
    	mypagedao.UserDelete(user_id);
    	
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=utf-8");
    	
    	session.invalidate(); //세션의 모든 속성을 삭제
    	PrintWriter out = response.getWriter();
    	
    	out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"'");
		out.println("</script>");
    }
}


