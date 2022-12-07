package com.heartpet.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

    @RequestMapping("/user_mypage_wish_list")
    public String mypage_wish_list() {
        return "user/mypage/mypage_wish_list";
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
}
