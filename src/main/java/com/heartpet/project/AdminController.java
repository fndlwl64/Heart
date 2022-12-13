package com.heartpet.project;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.heartpet.model.UserDTO;

@Controller
public class AdminController {
	
	@Autowired
	private UserDAO userDAO;

    /*관리자 상단바에서 페이지 이동*/
	@RequestMapping("/admin_main")
	public String admin_main(Model model) {
		
		List<UserDTO> list = userDAO.getUserList();
		int total =userDAO.totalUser();
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		
		return "admin/user/user_list";
	}
	
    @RequestMapping("/user_list")
    public String user_list(Model model) {
    	List<UserDTO> list = userDAO.getUserList();
    	int total =userDAO.totalUser();
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		    	
        return "admin/user/user_list";
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
        return "admin/review/review_list";
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
    		System.out.println("회원 정보 수정 ㄱ");
    		out.println("<script>");
    		out.println("alert('회원 정보 수정 완료');");
    		out.println("location.href='"+request.getContextPath()+"/user_view?user_id="+dto.getUser_id()+"'");
    		out.println("</script>");
    		out.flush();
    	}else {
    		System.out.println("회원 정보 수정 실패");
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
    
    @RequestMapping("/user_inserted")
    public void user_inserted(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	response.setContentType("text/html; charset=utf-8");
    	
    	PrintWriter out = response.getWriter();
    	    	
    }

    /*관리자 리스트에서 상세정보보기*/
    
    @RequestMapping("/notice_view")
    public String notice_view() {
        return "admin/notice_view";
    }
    @RequestMapping("/user_view")
    public String user_view(@RequestParam("user_id")String id, Model model) {
    	
    	UserDTO dto =userDAO.getUserInfo(id);
    	
    	model.addAttribute("cont", dto);
    	
        return "admin/user/user_view";
    }
    
    // 관리자 리스트에서 삭제하기
    @RequestMapping("/user_delete")
    public void user_delete(@RequestParam("id")String id, @RequestParam("no") int no, HttpServletResponse response, HttpServletRequest request) throws IOException {
    	response.setContentType("text/html; charset=utf-8");
    	PrintWriter out = response.getWriter();
    	int delete = userDAO.deleteuser(id);
    	
    	if(delete>0) {
    		userDAO.update_num(no);
    		
    		System.out.println("회원 정보 삭제 ㄱ");
    		out.println("<script>");
    		out.println("alert('회원 정보 삭제 완료');");
    		out.println("location.href='"+request.getContextPath()+"/user_list'");
    		out.println("</script>");
    		out.flush();
    	}else {
    		out.println("<script>");
    		out.println("alert('회원 정보 삭제 실패');");
    		out.println("history.back()");
    		out.println("</script>");
    		out.flush();
    	}
    	
    }
}
