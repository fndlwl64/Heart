package com.heartpet.project;

import com.heartpet.action.NoticeDAO;
import com.heartpet.model.NoticeDTO;
import com.heartpet.action.DogDAO;
import com.heartpet.action.QnaDAO;
import com.heartpet.action.UserDAO;
import com.heartpet.model.QnaDTO;
import com.heartpet.model.UserDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
    private DogDAO dogDAO;
	
	@Autowired
	private UserDAO userDAO;

    @RequestMapping("/jsptest")
    public String jsptest(Model model){
        model.addAttribute("list",dogDAO.list());
        return "jsptest";
    }
    
    @Autowired
    private QnaDAO qnaDAO;


    @Autowired
    private NoticeDAO noticedao;


    @RequestMapping("/user_dog_list")
    public String dog_list() { return "animal/dog/user_dog_list"; }

    @RequestMapping("/user_dog_content")
    public String dog_content() { return "animal/dog/user_dog_content"; }

    @RequestMapping ("/user_animal_insert")
    public String dog_insert() { return "animal/user_animal_insert"; }

    //파일 업로드 테스트
	/*
	 * @RequestMapping("/user_animal_insert") public String
	 * dog_insert_ok(@RequestPart List<MultipartFile> files, AnimalDTO dto,
	 * 
	 * @RequestParam(value = "tag") String tag, HttpServletRequest request) throws
	 * IOException {
	 * 
	 * //path 설정 및 폴더 생성 String rootPath = System.getProperty("user.dir"); String
	 * uploadPath = "\\src\\main\\resources\\static\\upload"; String path = rootPath
	 * + uploadPath;
	 * 
	 * File folder = new File(path);
	 * 
	 * List<DogDTO> list = dogDAO.list(); for(DogDTO d : list){
	 * System.out.println(d.toString()); }
	 * 
	 * if(!folder.exists()){ // 폴더 생성 folder.mkdir(); } //tag에 따라서 강아지 또는 고양이 insert
	 * 문 사용
	 * 
	 * for (MultipartFile file : files) { File toFile = new
	 * File(path+"\\"+file.getOriginalFilename()); file.transferTo(toFile); } return
	 * "redirect:/"; }
	 */

    @RequestMapping("/user_support")
    public String user_support() {
        return "support/support";
    }

    @RequestMapping("/user_qna_list")
    public String user_qna_list(Model model) {
        List<QnaDTO> qnaList = this.qnaDAO.listQna();
        model.addAttribute("qnaList", qnaList);
        return "qna/qna_list";
    }

    @RequestMapping("/user_qna_insert")
    public String user_qna_insert() { return "qna/qna_insert"; }

    @RequestMapping("/user_qna_insert_ok")
    public String user_qna_insert_ok() {

        return "qna/qna_list";
    }

    @RequestMapping("/user_qna_update")
    public String user_qna_update() { return "qna/qna_update"; }

    @RequestMapping("/user_qna_content")
    public String user_qna_content() { return "qna/qna_content"; }

    @RequestMapping("/user_fnq_list")
    public String user_fnq_list() { return "qna/fnq_list"; }

    @RequestMapping("/user_notice")
    public String notice(Model model) {
        List<NoticeDTO> list = noticedao.getNoticeList();
        model.addAttribute("List", list);
        return "notice/notice_list";
    }

    @RequestMapping("/user_review_list")
    public String user_review_list() { return "review/review_list"; }

    @RequestMapping("/user_review_insert")
    public String user_review_insert() { return "review/review_insert"; }

    @RequestMapping("/user_review_content")
    public String user_review_content() { return "review/review_content"; }

    @RequestMapping("/user_review_update")
    public String review_update() { return "review/review_update"; }

    @RequestMapping("/user_mypage_wish_list")
    public String mypage_wish_list() {
        return "mypage/mypage_wish_list";
    }
    
    @RequestMapping("/login")
    public String login(@RequestParam("user_id")String id, @RequestParam("user_pwd")String pwd, HttpServletResponse response, HttpServletRequest request) throws IOException {
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("id", id);
    	map.put("pwd", pwd);
    	
    	int check = userDAO.idCheck(id);
    	
    	PrintWriter out = response.getWriter();
    	
    	if(check == 1) {
    		String res = userDAO.login(map);
    		
    		map.values();
    		
    		HttpSession session = request.getSession();
    		
    		session.setAttribute("session_id", id);
    		
    		out.println("<script>");
			out.println("alert('로그인 되었습니다!');");
			out.println("location.href='"+request.getContextPath()+"'");
			out.println("</script>");
    	}else {
    		out.println("<script>");
			out.println("alert('가입되지 않은 아이디입니다ㅠ');");
			out.println("location.href='"+request.getContextPath()+"'");
			out.println("</script>");
    	}
    	
    	return "main";
    }
    
    @RequestMapping("/kakao_login")
    public void login(@RequestParam("paramId")String id, @RequestParam("paramName")String name, @RequestParam("paramEmail")String email, HttpServletRequest request, HttpServletResponse response) throws IOException{
    	
    	System.out.println("여기");
    	PrintWriter out = response.getWriter();
    	int check = userDAO.idCheck(id);
    	
    	if(check == 1) {
			
			 HttpSession session = request.getSession();
			 session.setAttribute("session_id", id);
			 System.out.println("아이디 존재 => 카카오 로그인 성공");
    		
    	}else {
    		
    		Map<String, Object> map = new HashMap<String, Object>();
    		map.put("id", id);
    		map.put("name", name);
    		map.put("email", email);
    		
    		int res = userDAO.kakaoInsert(map);
    		
    		if(res>0) {
    			HttpSession session = request.getSession();
        		session.setAttribute("session_id", id);    		
        		System.out.println("아이디 없음 => 카카오 계정 가입 성공");
    		}else {
    			out.println("<script>");
    			out.println("alert('가입 실패ㅠ');");
    			out.println("history.back()");
    			out.println("</script>");
    		}
    	}
    }
    
    @RequestMapping("/user_logout")
    public void logout(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
    	
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=utf-8");
    	
    	session.invalidate(); //세션의 모든 속성을 삭제
    	PrintWriter out = response.getWriter();
    	
    	out.println("<script>");
		out.println("alert('로그아웃 되었습니다!');");
		out.println("location.href='"+request.getContextPath()+"'");
		out.println("</script>");
		 
    }
    
    @RequestMapping("/join")
    public String join() {
        return "user/join";
    }
    
    @RequestMapping("/joinOk")
    public String joinOk(UserDTO dto, @RequestParam("addr1")String ad1, @RequestParam("addr2")String ad2, @RequestParam("addr2")String ad3) {
    	
    	
    	return "main";
    }

    @RequestMapping("/user_mypage_adoptreg_list")
    public String mypage_adoptreg_list() {
        return "mypage/mypage_adopt_reg_list";
    }
    @RequestMapping("/user_mypage_adoptcomplet_list")
    public String mypage_adoptcomplet_list() {
        return "mypage/mypage_adopt_complet_list";
    }
    @RequestMapping("/user_mypage_user_update")
    public String mypage_user_update() {
        return "mypage/mypage_user_update";
    }
    @RequestMapping("/user_mypage_user_delete")
    public String mypage_user_delete() {
        return "mypage/mypage_user_delete";
    }
    @RequestMapping("/user_mypage_support_list")
    public String mypage_support_list() {
        return "mypage/mypage_support_list";
    }
    @RequestMapping("/user_mypage_grade_list")
    public String mypage_grade_list() {
        return "mypage/mypage_grade_list";
    }

}
