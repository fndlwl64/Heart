package com.heartpet.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    @GetMapping("/join")
    public String join() {
        return "user/join";
    }

    /*관리자 상단바에서 페이지 이동*/
    @GetMapping("/user_list")
    public String user_list() {
        return "admin/user_list";
    }
    @GetMapping("/dog_list")
    public String dog_list() {
        return "admin/dog_list";
    }
    @GetMapping("/cat_list")
    public String cat_list() {
        return "admin/cat_list";
    }
    @GetMapping("/adoptreg_list")
    public String adoptreg_list() {
        return "admin/adoptreg_list";
    }
    @GetMapping("/support_list")
    public String support_list() {
        return "admin/support_list";
    }
    @GetMapping("/notice_list")
    public String notice_list() {
        return "admin/notice_list";
    }
    @GetMapping("/board_list")
    public String board_list() {
        return "admin/board_list";
    }
    @GetMapping("/review_list")
    public String review_list() {
        return "admin/review_list";
    }

    /*관리자 리스트에서 수정하기*/
    @GetMapping("/adoptreg_update")
    public String adoptreg_update() {
        return "admin/adoptreg_update";
    }
    @GetMapping("/board_update")
    public String board_update() {
        return "admin/board_update";
    }
    @GetMapping("/pet_update")
    public String pet_update() {
        return "admin/pet_update";
    }
    @GetMapping("/notice_update")
    public String notice_update() {
        return "admin/notice_update";
    }
    @GetMapping("/review_update")
    public String review_update() {
        return "admin/review_update";
    }
    @GetMapping("/support_update")
    public String support_update() {
        return "admin/support_update";
    }
    @GetMapping("/user_update")
    public String user_update() {
        return "admin/user_update";
    }
    /*관리자 리스트에서 등록하기*/
    @GetMapping("/adoptreg_insert")
    public String adoptreg_insert() {
        return "admin/adoptreg_insert";
    }
    @GetMapping("/board_insert")
    public String board_insert() {
        return "admin/board_insert";
    }
    @GetMapping("/pet_insert")
    public String pet_insert() {
        return "admin/pet_insert";
    }
    @GetMapping("/notice_insert")
    public String notice_insert() {
        return "admin/notice_insert";
    }
    @GetMapping("/review_insert")
    public String review_insert() {
        return "admin/review_insert";
    }
    @GetMapping("/support_insert")
    public String support_insert() {
        return "admin/support_insert";
    }
    @GetMapping("/user_insert")
    public String user_insert() {
        return "admin/user_insert";
    }

    /*관리자 리스트에서 상세정보보기*/
    @GetMapping("/cat_view")
    public String cat_view() {
        return "admin/cat_view";
    }
    @GetMapping("/dog_view")
    public String dog_view() {
        return "admin/dog_view";
    }
    @GetMapping("/notice_view")
    public String notice_view() {
        return "admin/notice_view";
    }
    @GetMapping("/user_view")
    public String user_view() {
        return "admin/user_view";
    }
}
