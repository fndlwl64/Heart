package com.heartpet.project;

import java.util.Date;


import java.util.HashMap;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.heartpet.action.MypageDAO;
import com.heartpet.action.SupportDAO;
import com.heartpet.model.UserDTO;

@Controller
public class SupportController {
	
	@Autowired
	private MypageDAO mypagedao;
	@Autowired
	private SupportDAO supportdao;
	

	@RequestMapping("/user_support")
    public String user_support() {
		
        return "user/support/support";
    }
	
	@RequestMapping("/user_support_insert")
	public String user_support_insert(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
    	String user_id = (String)session.getAttribute("session_id");
    
    	if(user_id == null) {
    		int no = supportdao.SupportMaxNo();
    		model.addAttribute("No", no);
    		return "user/support/support_insert2";
    	}else {
    		UserDTO user_list = mypagedao.UserInfo(user_id); 
        	int no = supportdao.SupportMaxNo();
    		model.addAttribute("uList", user_list); 
        	model.addAttribute("No", no);
    		return "user/support/support_insert";
    	}
	}
	
	//회원이 후원했을때 db에 등록
	@RequestMapping("/support_pay")
	public void support_pay(@RequestParam("paramAmount") int amount, HttpServletRequest request) {
		HttpSession session = request.getSession();
    	String user_id = (String)session.getAttribute("session_id");
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	
		map.put("amount", amount);
		map.put("userid", user_id);
		
		supportdao.insertSupportPay(map);
		supportdao.updateUserPrice(map);
		
	}
	//비회원이 후원했을때 db에 등록
	@RequestMapping("/support_pay2")
	public void support_pay2(@RequestParam("paramEmail") String email, @RequestParam("paramAmount") int amount, HttpServletRequest request) {
		HttpSession session = request.getSession();
    	String user_id = (String)session.getAttribute("session_id");
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	
		map.put("amount", amount);
		map.put("userid", email);
		
		supportdao.insertSupportPay(map);
		
	}
	
	@RequestMapping("/support_emailcheck")
	public @ResponseBody void support_emailcheck(@RequestParam("paramEmail") String receiver, @RequestParam("paramCode_check") String code, HttpServletRequest request) {
		
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
			/* String email = request.getParameter("receiver"); */ //사용자가 입력한 이메일 받아오기
            InternetAddress to = new InternetAddress(receiver);         
            msg.setRecipient(Message.RecipientType.TO, to);
            // 이메일 제목
            msg.setSubject("HeartPet 후원 인증번호", "UTF-8");
            // 이메일 내용 
			/* String code = request.getParameter("code_check"); */ //인증번호 값 받기
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
	}
	
	@RequestMapping("/user_support_finish")
    public String user_support_finish(@RequestParam("name") String name, @RequestParam("amount") String amount, Model model) {
		
		model.addAttribute("name", name); 
    	model.addAttribute("amount", amount);
		
        return "user/support/support_finish";
    }
	
}
