package com.heartpet.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.heartpet.action.NoticeDAO;
import com.heartpet.model.NoticeDTO;

@Controller
public class AdminNoticeController {

	@Autowired
	private NoticeDAO noticedao;
	
	@RequestMapping("/notice_list")
    public String notice_list(Model model) {
		List<NoticeDTO> notice_list = noticedao.getNoticeList();
		model.addAttribute("nList", notice_list);
        return "admin/notice_list";
    }
	
	@RequestMapping("/notice_insert")
    public String notice_insert() {
        return "admin/notice_insert";
    }
	
	@RequestMapping("/notice_view")
    public String notice_view() {
        return "admin/notice_view";
    }
	
	@RequestMapping("/notice_update")
    public String notice_update() {
        return "admin/notice_update";
    }
}
