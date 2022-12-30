package com.heartpet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.heartpet.action.UserDAO;
import com.heartpet.model.PageDTO;
import com.heartpet.model.UserDTO;

@Controller
public class AdminController {
	
	@Autowired
	private UserDAO userDAO;
	
	// 한 페이지당 보여질 게시물의 수
    private final int rowsize = 10;

    // 전체 게시물의 수
    private int totalRecord = 0;

    /*관리자 상단바에서 페이지 이동*/
	@RequestMapping("/admin_main")

	public String admin_main(@RequestParam(value = "user_id", required = false) String id, 
			@RequestParam(value = "user_name", required = false) String name,
        @RequestParam(value = "page", defaultValue = "1") int page, 
    		@RequestParam(value = "user_grade", required=false) String grade, 
        @RequestParam(value = "user_animalexp", required=false) String exp,
    		@RequestParam(value = "order", required=false) String order, Model model) {
		
       	if(id == null) { id = ""; }
       	if(name == null) { name = ""; }
       	if(grade == null) { grade = ""; }
       	if(exp == null) { exp = ""; }
       	if(order == null) { order = ""; }
    	
		int currentPage = 1;	// 현재 페이지 변수
		if(page != 1) { currentPage = page; }
		
		List<UserDTO> list = null;
		PageDTO paging = null;
		
    	totalRecord = this.userDAO.countUser(id, name, grade, exp);
    	paging = new PageDTO(currentPage, rowsize, totalRecord);
    	list = userDAO.userListPaging(paging.getStartNo(), paging.getEndNo(), id, name, grade, exp, order);
    	int total =userDAO.totalUser();
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("paging", paging);		
		model.addAttribute("user_id", id);	
		model.addAttribute("user_name", name);
		model.addAttribute("user_grade", grade);
		model.addAttribute("user_animalexp", exp);
		model.addAttribute("order", order);
		
		return "admin/user/user_list";
	}
	
    @RequestMapping("/user_list")
    public String user_list(@RequestParam(value = "user_id", required = false) String id, 
    		@RequestParam(value = "user_name", required = false) String name,
        @RequestParam(value = "page", defaultValue = "1") int page, 
    		@RequestParam(value = "user_grade", required=false) String grade, 
        @RequestParam(value = "user_animalexp", required=false) String exp,
    		@RequestParam(value = "order", required=false) String order, Model model) {
    	
    	if(id == null) { id = ""; }
    	if(name == null) { name = ""; }
       	if(grade == null) { grade = ""; }
       	if(exp == null) { exp = ""; }
       	if(order == null) { order = ""; }
    	
		int currentPage = 1;	// 현재 페이지 변수
		if(page != 1) { currentPage = page; }
		
		List<UserDTO> list = null;
		PageDTO paging = null;
    	
    	totalRecord = this.userDAO.countUser(id, name, grade, exp);
    	paging = new PageDTO(currentPage, rowsize, totalRecord);
    	list = userDAO.userListPaging(paging.getStartNo(), paging.getEndNo(), id, name, grade, exp, order);
    	int total =userDAO.totalUser();
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("paging", paging);		
		model.addAttribute("user_id", id);	
		model.addAttribute("user_name", name);
		model.addAttribute("user_grade", grade);
		model.addAttribute("user_animalexp", exp);
		model.addAttribute("order", order);
		    	
        return "admin/user/user_list";
    }
    
    
    
    @RequestMapping("/board_list")
    public String board_list() {
        return "admin/board_list";
    }
    @RequestMapping("/review_list")
    public String review_list() {
        return "admin/review/review_list";
    }

    
    @RequestMapping("/board_update")
    public String board_update() {
        return "admin/board_update";
    }
    
    @RequestMapping("/review_update")
    public String review_update() {
        return "admin/review_update";
    }
    
    
    @RequestMapping("/user_update")
    public String user_update(@RequestParam("user_id")String id, Model model) {
    	
    	UserDTO dto = userDAO.getUserInfo(id);
    	
    	model.addAttribute("cont", dto);
    	
    	return "admin/user/user_update";
    }
    
    @RequestMapping("/user_updated")
    public void user_updated(UserDTO dto, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	PrintWriter out =response.getWriter();
    	response.setContentType("text/html; charset=utf-8");
    	int res = userDAO.updateuser(dto);
    	
    	if(res>0) {
    		out.println("<script>");
    		out.println("alert('회원 정보 수정 완료');");
    		out.println("location.href='"+request.getContextPath()+"/user_content?user_id="+dto.getUser_id()+"'");
    		out.println("</script>");
    		out.flush();
    	}else {
    		out.println("<script>");
    		out.println("alert('회원 정보 수정 실패');");
    		out.println("history.back();");
    		out.println("</script>");
    		out.flush();
    	}
    	
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
    
    @RequestMapping("/review_insert")
    public String review_insert() {
        return "admin/review_insert";
    }
    
    @RequestMapping("/user_insert")
    public String user_insert() {
        return "admin/user/user_insert";
    }
    

    /*관리자 리스트에서 상세정보보기*/
    
    @RequestMapping("/user_content")
    public String user_view(@RequestParam("user_id")String id, Model model) {
    	
    	UserDTO dto =userDAO.getUserInfo(id);
    	
    	model.addAttribute("cont", dto);
    	
        return "admin/user/user_content";
    }
    
    // 관리자 리스트에서 삭제하기
    @RequestMapping("/user_delete")
    public void user_delete(@RequestParam("user_id") String id, HttpServletResponse response, HttpServletRequest request) throws IOException {
    	response.setContentType("text/html; charset=utf-8");
    	PrintWriter out = response.getWriter();
    	
    	int res = userDAO.deleteuser(id);
    	
    	if(res>0) {
    		out.println("<script>");
    		out.println("alert('회원 정보 수정 완료');");
    		out.println("location.href='"+request.getContextPath()+"/user_content?user_id="+id+"'");
    		out.println("</script>");
    		out.flush();
    	}else {
    		out.println("<script>");
    		out.println("alert('회원 정보 수정 실패');");
    		out.println("history.back()");
    		out.println("</script>");
    		out.flush();
    	}
    	
    }
}
