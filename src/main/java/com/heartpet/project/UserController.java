package com.heartpet.project;

import com.heartpet.action.NoticeDAO;
import com.heartpet.model.AnimalDTO;
import com.heartpet.model.NoticeDTO;
import com.heartpet.action.AnimalDAO;
import com.heartpet.action.DogDAO;
import com.heartpet.action.QnaDAO;
import com.heartpet.model.QnaDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller
public class UserController {
	
    @Autowired
    private QnaDAO qnaDAO;

    @Autowired
    private NoticeDAO noticedao;

   
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
    
    @RequestMapping("/user_qna_search")
    public String user_qna_search(Model model, String keyword, String field) {
    	List<QnaDTO> qnaList = this.qnaDAO.searchQna(field, keyword);
    	model.addAttribute("qnaList", qnaList);
    	return "qna/qna_list";
    }
    
    @RequestMapping("/user_qna_insert")
    public String user_qna_insert() { 
    	return "qna/qna_insert";
    }

    
    @RequestMapping(value = "/user_qna_insert_ok", method = RequestMethod.POST)
    // binding한 결과가 result에 담김
    public void user_qna_insert_ok(@Valid QnaDTO qnaDto, BindingResult result, HttpServletResponse response) throws IOException {
		// 에러가 있는지 검사
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
    	if(result.hasErrors()) {
    		// 에러를 List로 저장
            System.out.println(qnaDto.toString());
			List<ObjectError> errors = result.getAllErrors();
			for(ObjectError error : errors) {
				switch (error.getDefaultMessage()) {
				case "title": out.println("<script>alert('글 제목이 없습니다.'); history.back(); </script>"); break;
				case "content": out.println("<script>alert('글 내용이 없습니다.'); history.back(); </script>"); break;
				case "password": out.println("<script>alert('글 비밀번호를 입력해주세요.'); history.back(); </script>"); break;
				case "length": out.println("<script>alert('비밀번호는 6자 이상 10자 이하여야 합니다.'); history.back(); </script>"); break;
				case "regexp": out.println("<script>alert('비밀번호는 숫자 및 영문자로 구성되어야 합니다. 다시 입력해주세요.'); history.back(); </script>"); break;
				}
			}
    	}else {
        	int check = this.qnaDAO.insertQna(qnaDto);
    		if(check > 0) {
    			out.println("<script>alert('글이 성공적으로 등록되었습니다.'); location.href='/user_qna_content?board_no="+qnaDto.getBoard_no()+"'; </script>");
    		}else {
    			out.println("<script>alert('글 등록을 실패했습니다.'); history.back(); </script>");
    		}
    	}
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
    public void login(@RequestParam("paramId")String id, @RequestParam("paramName")String name, @RequestParam("paramEmail")String email){

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

    @RequestMapping("/user_notice_content")
    public String notice_content(@RequestParam("no") int no, Model model) {
    	NoticeDTO dto = this.noticedao.getNotice(no);
    	model.addAttribute("Cont", dto);
    	return "notice/notice_content";
    }
}
