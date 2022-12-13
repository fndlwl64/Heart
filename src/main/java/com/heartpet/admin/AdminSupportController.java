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
import com.heartpet.model.SupportDTO;

@Controller
public class AdminSupportController {

	@Autowired
	private SupportDAO supportdao;
	
	//후원리스트출력
	@RequestMapping("/support_list")
	public String admin_support_list(Model model) {
		List<SupportDTO> support_list = supportdao.Support();
		model.addAttribute("sList", support_list);
		return "admin/support_list";
	}
	
	//후원등록하는 페이지로 이동
	@RequestMapping("/support_insert")
    public String support_insert() {
        return "admin/support_insert";
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
		return "admin/support_update";
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
		int check = this.supportdao.deleteSupport(no);
		
		request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=utf-8");
    	
    	PrintWriter out = response.getWriter();
    	
    	if(check > 0) {
			this.supportdao.updateSequence(no);
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
