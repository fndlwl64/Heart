package com.heartpet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.heartpet.action.SupportDAO;
import com.heartpet.model.PageDTO;
import com.heartpet.model.SupportDTO;

@Controller
public class AdminSupportController {

	@Autowired
	private SupportDAO supportdao;
	
	// 한 페이지당 보여질 게시물의 수
    private final int rowsize = 10;

    // 전체 게시물의 수
    private int totalRecord = 0;
	
	//후원리스트출력
	@RequestMapping("/support_list")
	public String admin_support_list(@RequestParam(value = "search_id", required = false) String search_id,
			@RequestParam(value = "search_price", required = false) String search_price,
			@RequestParam(value = "search_date_start", required = false) String search_date_start,
			@RequestParam(value = "search_date_end", required = false) String search_date_end,
			@RequestParam(value = "order", required = false) String order,
			@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		// 페이징
		if (search_id == null) { search_id = ""; }
        if (search_price == null) { search_price = ""; }
        if (search_date_start == null) { search_date_start = ""; }
        if (search_date_end == null) { search_date_end = ""; }
        if (order == null) {
            order = "";
        }
        
		int currentPage = 1; // 현재 페이지 변수
        if (page != 1) {
            currentPage = page;
        }
        
        List<SupportDTO> supportList = null;
        PageDTO paging= null;
        
		totalRecord = this.supportdao.listSupportCount(search_id, search_price, search_date_start, search_date_end);
        paging = new PageDTO(currentPage, rowsize, totalRecord);
        supportList = this.supportdao.listSupport(paging.getStartNo(), paging.getEndNo(), search_id, search_price, search_date_start, search_date_end, order);

        model.addAttribute("supportList", supportList);
        model.addAttribute("total", totalRecord);
        model.addAttribute("paging", paging);
        model.addAttribute("search_id", search_id);
        model.addAttribute("search_price", search_price);
        model.addAttribute("search_date_start", search_date_start);
        model.addAttribute("search_date_end", search_date_end);
        model.addAttribute("order", order);
        
		return "admin/support/support_list";
	}
	
	//후원등록하는 페이지로 이동
	@RequestMapping("/support_insert")
    public String support_insert() {
        return "admin/support/support_insert";
    }
	
	//후원등록하기
	@RequestMapping("/support_insert_ok")
	public void support_insert_ok(SupportDTO dto, HttpServletResponse response, HttpServletRequest request) throws IOException {
		int check = supportdao.Support_insert(dto);
		
		request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=utf-8");
    	
    	PrintWriter out = response.getWriter();
    	
    	if(check > 0) {
			out.println("<script>");
			out.println("alert('후원 등록 성공!')");
			out.println("location.href='"+request.getContextPath()+"/support_list'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('후원 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("/support_update")
    public String support_update(@RequestParam("no") int no, Model model) {
        SupportDTO dto = this.supportdao.supportCont(no);
        
        model.addAttribute("Modify", dto);
		return "admin/support/support_update";
    }
	
	@RequestMapping("/support_update_ok")
    public void support_update_ok(SupportDTO dto, HttpServletRequest request, HttpServletResponse response) throws IOException {
        
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int check = this.supportdao.updateSupport(dto);
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('수정 성공!')");
			out.println("location.href='"+request.getContextPath()+"/support_update?no="+dto.getSupport_no()+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
 
    }
	
	@RequestMapping("/support_delete")
    public void support_delete(@RequestParam("no") int no, HttpServletResponse response, HttpServletRequest request) throws IOException {
		int check = this.supportdao.updateSupport(no);
		
		request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=utf-8");
    	
    	PrintWriter out = response.getWriter();
    	
    	if(check > 0) {
			/* this.supportdao.updateSequence(no); */
			out.println("<script>");
			out.println("alert('삭제 성공!')");
			out.println("location.href='"+request.getContextPath()+"/support_list'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
    }
}
