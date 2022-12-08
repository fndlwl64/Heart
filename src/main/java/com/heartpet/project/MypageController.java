package com.heartpet.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.heartpet.action.MypageDAO;
import com.heartpet.model.Mypage_SupportDTO;
import com.heartpet.model.UserDTO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageDAO mypagedao;

    @RequestMapping("/user_mypage_wish_list")
    public String mypage_wish_list(Model model, HttpServletRequest request) {
    	//세션정보가져오기
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
    	model.addAttribute("Sum", sum);
    	model.addAttribute("uList", user_list);
    	model.addAttribute("Count", regcount);
    	model.addAttribute("review_Count", review_count);
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
    	model.addAttribute("Sum", sum);
    	model.addAttribute("uList", user_list);
    	model.addAttribute("Count", regcount);
    	model.addAttribute("review_Count", review_count);
        return "user/mypage/mypage_adopt_complet_list";
    }
    
    @RequestMapping("/user_mypage_user_update")
    public String mypage_user_update(Model model, HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	String user_id = (String)session.getAttribute("session_id");
    	
    	int sum = mypagedao.SumSupport(user_id);
    	UserDTO dto = mypagedao.UserInfo(user_id);
    	int regcount = mypagedao.AnimalRegCount(user_id);
    	int review_count = mypagedao.ReviewCount(user_id);
    	model.addAttribute("Sum", sum);
    	model.addAttribute("uList", dto);
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
    public String mypage_grade_list() {
        return "user/mypage/mypage_grade_list";
    }
}
