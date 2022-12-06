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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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
