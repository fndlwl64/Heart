package com.heartpet.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
    	
    	UserDTO user_list = mypagedao.UserInfo(user_id);
    	int no = supportdao.SupportMaxNo();
    	model.addAttribute("uList", user_list);
    	model.addAttribute("No", no);
		return "user/support/support_insert";
	}
}
