package com.heartpet.project;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	@RequestMapping("support_pay")
	public void support_pay(@RequestParam("paramAmount") int amount, HttpServletRequest request) {
		HttpSession session = request.getSession();
    	String user_id = (String)session.getAttribute("session_id");
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	
		map.put("amount", amount);
		map.put("userid", user_id);
		
		supportdao.insertSupportPay(map);
		
	}
	//비회원이 후원했을때 db에 등록
	@RequestMapping("support_pay2")
	public void support_pay2(@RequestParam("paramEmail") String email, @RequestParam("paramAmount") int amount, HttpServletRequest request) {
		HttpSession session = request.getSession();
    	String user_id = (String)session.getAttribute("session_id");
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	
		map.put("amount", amount);
		map.put("userid", email);
		
		supportdao.insertSupportPay(map);
		
	}
}
