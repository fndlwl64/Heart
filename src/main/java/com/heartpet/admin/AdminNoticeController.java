package com.heartpet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.heartpet.action.NoticeDAO;
import com.heartpet.model.NoticeDTO;
import com.heartpet.model.PageDTO;

@Controller
public class AdminNoticeController {

	@Autowired
	private NoticeDAO noticedao;
	
	// 한 페이지당 보여질 게시물의 수
    private final int rowsize = 10;

    // 전체 게시물의 수
    private int totalRecord = 0;
	
	@RequestMapping("/notice_list")
    public String notice_list(@RequestParam(value = "field", required = false) String field,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "order", required = false) String order,
			@RequestParam(value = "page", defaultValue = "1") int page,Model model) {
		
		// 페이징
		if (field == null) {
            field = "";
        }
        if (keyword == null) {
            keyword = "";
        }
        if (order == null) {
            order = "";
        }
        
        int currentPage = 1; // 현재 페이지 변수
        if (page != 1) {
            currentPage = page;
        }
        
        List<NoticeDTO> noticeList = null;
        PageDTO paging= null;
		
        totalRecord = this.noticedao.listNoticeCount(field, keyword);
        paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);
        noticeList = this.noticedao.listNotice(paging.getStartNo(), paging.getEndNo(), field, keyword, order);
        
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("total", totalRecord);
        model.addAttribute("paging", paging);
        model.addAttribute("field", field);
        model.addAttribute("keyword", keyword);
        model.addAttribute("order", order);
        
        return "admin/notice_list";
    }
	
	@RequestMapping("/notice_insert")
    public String notice_insert() {
        return "admin/notice_insert";
    }
	
	@RequestMapping("/notice_insert_ok")
	public void notice_insert_ok(NoticeDTO dto, HttpServletResponse response, HttpServletRequest request) throws IOException {
		int check = noticedao.noticeinsert(dto);
		
		request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=utf-8");
    	
    	PrintWriter out = response.getWriter();
    	
    	if(check > 0) {
			out.println("<script>");
			out.println("alert('공지사항 등록 성공!')");
			out.println("location.href='"+request.getContextPath()+"/notice_list'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('공지사항 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("/notice_content")
    public String notice_content(@RequestParam("no") int no, Model model) {
		NoticeDTO dto = this.noticedao.getNotice(no);
		model.addAttribute("Cont", dto);
		
        return "admin/notice_content";
    }
	
	@RequestMapping("/notice_update")
    public String notice_update(@RequestParam("no") int no, Model model) {
		NoticeDTO dto = this.noticedao.getNotice(no);
		model.addAttribute("Cont", dto);
		
        return "admin/notice_update";
    }
	
	@RequestMapping("/notice_update_ok")
    public void notice_update_ok(NoticeDTO dto, HttpServletRequest request, HttpServletResponse response) throws IOException {
        
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int check = this.noticedao.noticeupdate(dto);
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('수정 성공!')");
			out.println("location.href='"+request.getContextPath()+"/notice_list'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
    }
	
	@RequestMapping("/notice_delete")
    public void notice_delete(@RequestParam("no") int no, HttpServletResponse response, HttpServletRequest request) throws IOException {
		int check = this.noticedao.noticedelete(no);
		
		request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=utf-8");
    	
    	PrintWriter out = response.getWriter();
    	
    	if(check > 0) {
			/* this.supportdao.updateSequence(no); */
			out.println("<script>");
			out.println("alert('삭제 성공!')");
			out.println("location.href='"+request.getContextPath()+"/notice_list'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
    }
}
