package com.heartpet.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.heartpet.action.NoticeDAO;
import com.heartpet.model.NoticeDTO;
import com.heartpet.model.PageDTO;

@Controller
public class NoticeController {

	@Autowired
    private NoticeDAO noticedao;
	
	// 한 페이지당 보여질 게시물의 수
    private final int rowsize = 10;

    // 전체 게시물의 수
    private int totalRecord = 0;
	
	@RequestMapping("/user_notice")
    public String notice(@RequestParam(value = "search_title", required = false) String search_title,
    		@RequestParam(value = "search_cont", required = false) String search_cont,
			@RequestParam(value = "search_date_start", required = false) String search_date_start,
			@RequestParam(value = "search_date_end", required = false) String search_date_end,
			@RequestParam(value = "order", required = false) String order,
			@RequestParam(value = "page", defaultValue = "1") int page,Model model) {
		
		// 페이징
		if (search_title == null) { search_title = ""; }
        if (search_cont == null) { search_cont = ""; }
        if (search_date_start == null) { search_date_start = ""; }
        if (search_date_end == null) { search_date_end = ""; }
        if (order == null) {
            order = "";
        }
        
        int currentPage = 1; // 현재 페이지 변수
        if (page != 1) {
            currentPage = page;
        }
        
        List<NoticeDTO> noticeList = null;
        PageDTO paging= null;
		
        totalRecord = this.noticedao.listNoticeCount(search_title, search_cont, search_date_start, search_date_end);
        paging = new PageDTO(currentPage, rowsize, totalRecord);
        noticeList = this.noticedao.listNotice(paging.getStartNo(), paging.getEndNo(), search_title, search_cont, search_date_start, search_date_end, order);
		
        model.addAttribute("List", noticeList);
        model.addAttribute("total", totalRecord);
        model.addAttribute("paging", paging);
        model.addAttribute("search_title", search_title);
        model.addAttribute("search_cont", search_cont);
        model.addAttribute("search_date_start", search_date_start);
        model.addAttribute("search_date_end", search_date_end);
        model.addAttribute("order", order);

        return "user/notice/notice_list";
    }

	@RequestMapping("/user_notice_content")
    public String notice_content(@RequestParam("no") int no, Model model) {
    	NoticeDTO dto = this.noticedao.getNotice(no);
    	model.addAttribute("Cont", dto);
    	noticedao.readCount(no);
    	return "user/notice/notice_content";
    }
}
