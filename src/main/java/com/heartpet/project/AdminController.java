package com.heartpet.project;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    /*관리자 상단바에서 페이지 이동*/
	@RequestMapping("/admin_main")
	public String admin_main() {
		return "admin/user/user_list";
	}
    @RequestMapping("/user_list")
    public String user_list() {
        return "admin/user/user_list";
    }
    @RequestMapping("/adoptreg_list")
    public String adoptreg_list() {
        return "admin/adoptreg_list";
    }
    @RequestMapping("/support_list")
    public String support_list() {
        return "admin/support_list";
    }
    @RequestMapping("/notice_list")
    public String notice_list() {
        return "admin/notice_list";
    }
    @RequestMapping("/board_list")
    public String board_list() {
        return "admin/board_list";
    }
    @RequestMapping("/review_list")
    public String review_list() {
        return "admin/review_list";
    }

    /*관리자 리스트에서 수정하기*/
    @RequestMapping("/adoptreg_update")
    public String adoptreg_update() {
        return "admin/adoptreg_update";
    }
    @RequestMapping("/board_update")
    public String board_update() {
        return "admin/board_update";
    }
    @RequestMapping("/notice_update")
    public String notice_update() {
        return "admin/notice_update";
    }
    @RequestMapping("/review_update")
    public String review_update() {
        return "admin/review_update";
    }
    @RequestMapping("/support_update")
    public String support_update() {
        return "admin/support_update";
    }
    @RequestMapping("/user_update")
    public String user_update() {
        return "admin/user/user_update";
    }
    /*관리자 리스트에서 등록하기*/
    @RequestMapping("/adoptreg_insert")
    public String adoptreg_insert() {
        return "admin/adoptreg_insert";
    }
    @RequestMapping("/board_insert")
    public String board_insert() {
        return "admin/board_insert";
    }
    @RequestMapping("/notice_insert")
    public String notice_insert() {
        return "admin/notice_insert";
    }
    @RequestMapping("/review_insert")
    public String review_insert() {
        return "admin/review_insert";
    }
    @RequestMapping("/support_insert")
    public String support_insert() {
        return "admin/support_insert";
    }
    @RequestMapping("/user_insert")
    public String user_insert() {
        return "admin/user/user_insert";
    }

    /*관리자 리스트에서 상세정보보기*/
    
    @RequestMapping("/notice_view")
    public String notice_view() {
        return "admin/notice_view";
    }
    @RequestMapping("/user_view")
    public String user_view() {
        return "admin/user/user_content";
    }
    
    // 관리자 리스트에서 삭제하기
    @RequestMapping("/user_delete")
    public void user_delete() {
    	
    }
}
