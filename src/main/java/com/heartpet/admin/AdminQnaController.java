package com.heartpet.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.heartpet.action.QnaDAO;
import com.heartpet.model.PageDTO;
import com.heartpet.model.QnaDTO;

@Controller
public class AdminQnaController {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	@Autowired
	private HttpServletRequest request;
	
    // 한 페이지당 보여질 게시물의 수
    private final int rowsize = 3;

    // 전체 게시물의 수
    private int totalRecord = 0;
    
    @RequestMapping("/admin_qna_list")
    public String admin_qna_list(@RequestParam(value = "field", required = false) String field, 
    		@RequestParam(value = "keyword", required = false) String keyword, 
    		@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
    	
    	if(field == null) { field = ""; }
       	if(keyword == null) { keyword = ""; }
    	
		int currentPage = 1;	// 현재 페이지 변수
		if(page != 1) { currentPage = page; }
    	
    	totalRecord = this.qnaDAO.listQnaCount(field, keyword);
    	PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);
    	
        List<QnaDTO> qnaList = this.qnaDAO.listQna(paging.getStartNo(), paging.getEndNo(), field, keyword);
        
        model.addAttribute("qnaList", qnaList);
        model.addAttribute("total", totalRecord);
        model.addAttribute("paging", paging);		
		model.addAttribute("field", field); 
		model.addAttribute("keyword", keyword);	
		
        return "admin/qna/qna_list";
    }
    
    @RequestMapping("/admin_qna_content")
    public String admin_qna_content(@RequestParam("board_no") int board_no, Model model) {
        QnaDTO qnaContent = this.qnaDAO.contentQna(board_no);
        model.addAttribute("qnaContent", qnaContent);
        return "admin/qna/qna_content";
    }
	
    ///////////////////////////////////////////////////////////////////
    // QNA reply form
    ///////////////////////////////////////////////////////////////////
    @RequestMapping("/admin_qna_reply_insert")
    public String admin_qna_reply_insert(@RequestParam("qna_no") int qna_no) {
    	this.qnaDAO.replyInsert(qna_no);
    	return "admin/qna/qna_reply_insert";
    }
    
    @RequestMapping("/admin_qna_reply_insert_ok")
    public void admin_qna_reply_insert_ok() {
    	
    }
	
    @RequestMapping("/admin_qna_reply_update")
    public String admin_qna_reply_update() {
    	return "admin/qna/qna_reply_update";
    }
	
    @RequestMapping("/admin_qna_reply_update_ok")
    public void admin_qna_reply_update_ok() {
    	
    }
	

}
