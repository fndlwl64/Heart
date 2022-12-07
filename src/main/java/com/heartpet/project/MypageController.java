package com.heartpet.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.heartpet.action.MypageDAO;
import com.heartpet.model.Mypage_SupportDTO;
import com.heartpet.model.UserDTO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageDAO mypagedao;

    @RequestMapping("/user_mypage_wish_list")
    public String mypage_wish_list(Model model) {
    	int sum = mypagedao.SumSupport();
    	model.addAttribute("Sum", sum);
        return "user/mypage/mypage_wish_list";
    }
    @RequestMapping("/user_mypage_adoptreg_list")
    public String mypage_adoptreg_list(Model model) {
    	int sum = mypagedao.SumSupport();
    	model.addAttribute("Sum", sum);
        return "user/mypage/mypage_adopt_reg_list";
    }
    @RequestMapping("/user_mypage_adoptcomplet_list")
    public String mypage_adoptcomplet_list(Model model) {
    	int sum = mypagedao.SumSupport();
    	model.addAttribute("Sum", sum);
        return "user/mypage/mypage_adopt_complet_list";
    }
    @RequestMapping("/user_mypage_user_update")
    public String mypage_user_update(Model model) {
    	int sum = mypagedao.SumSupport();
    	model.addAttribute("Sum", sum);
        return "user/mypage/mypage_user_update";
    }
    @RequestMapping("/user_mypage_user_delete")
    public String mypage_user_delete(Model model) {
    	int sum = mypagedao.SumSupport();
    	model.addAttribute("Sum", sum);
        return "user/mypage/mypage_user_delete";
    }
    
    //마이페이지에서 자신이 후원한 내역 보는 메서드
    @RequestMapping("/user_mypage_support_list")
    public String mypage_support_list(Model model) {
    	List<Mypage_SupportDTO> list = mypagedao.getSupportList();
    	int sum = mypagedao.SumSupport();
    	List<UserDTO> user_list = mypagedao.UserInfo();
    	model.addAttribute("List", list);
    	model.addAttribute("Sum", sum);
    	model.addAttribute("uList", user_list);
        return "user/mypage/mypage_support_list";
    }
    
    @RequestMapping("/user_mypage_grade_list")
    public String mypage_grade_list() {
        return "user/mypage/mypage_grade_list";
    }
}
