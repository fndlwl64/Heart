package com.heartpet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.heartpet.action.NoticeDAO;
import com.heartpet.model.NoticeDTO;
import com.heartpet.model.PageDTO;
import com.heartpet.util.FileUploadImage;

@Controller
public class AdminNoticeController {

	@Autowired
	private NoticeDAO noticedao;
	
	// 한 페이지당 보여질 게시물의 수
    private final int rowsize = 10;

    // 전체 게시물의 수
    private int totalRecord = 0;
	
	@RequestMapping("/notice_list")
    public String notice_list(@RequestParam(value = "search_title", required = false) String search_title,
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
        if (order == null) { order = ""; }
        
        int currentPage = 1; // 현재 페이지 변수
        if (page != 1) {
            currentPage = page;
        }
        
        List<NoticeDTO> noticeList = null;
        PageDTO paging= null;
		
        totalRecord = this.noticedao.listNoticeCount(search_title, search_cont, search_date_start, search_date_end);
        paging = new PageDTO(currentPage, rowsize, totalRecord);
        noticeList = this.noticedao.listNotice(paging.getStartNo(), paging.getEndNo(), search_title, search_cont, search_date_start, search_date_end, order);
        
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("total", totalRecord);
        model.addAttribute("paging", paging);
        model.addAttribute("search_title", search_title);
        model.addAttribute("search_cont", search_cont);
        model.addAttribute("search_date_start", search_date_start);
        model.addAttribute("search_date_end", search_date_end);
        model.addAttribute("order", order);
        
        return "admin/notice/notice_list";
    }
	
	@RequestMapping("/notice_insert")
    public String notice_insert() {
        return "admin/notice/notice_insert";
    }
	
	@RequestMapping("/notice_insert_ok")
	public void notice_insert_ok(@RequestParam("files") List<MultipartFile> files, NoticeDTO dto, HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		FileUploadImage upload = new FileUploadImage();
		String[] images = upload.uploadNoticeImg(request, files,"notice");
		dto.setNotice_img1(images[0]);
		dto.setNotice_img2(images[1]);
		
		/*
		 * noticedao.noticeinsert(dto); return "redirect:/admin/notice_list";
		 */
		
		
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
		
        return "admin/notice/notice_content";
    }
	
	@RequestMapping("/notice_update")
    public String notice_update(@RequestParam("no") int no, Model model) {
		NoticeDTO dto = this.noticedao.getNotice(no);
		model.addAttribute("Cont", dto);
		
        return "admin/notice/notice_update";
    }
	
	@RequestMapping("/notice_update_ok")
    public void notice_update_ok(@RequestParam("files") List<MultipartFile> notice_img, 
    		@RequestParam(value = "notice_image1_delete", required = false, defaultValue = "") String notice_image1_delete, 
            @RequestParam(value = "notice_image2_delete", required = false, defaultValue = "") String notice_image2_delete,
    		@Valid NoticeDTO dto, HttpServletRequest request, HttpServletResponse response) throws IOException {
        
		//FileUploadImage upload = new FileUploadImage();
		//dto = upload.uploadNoticeImg(request, files, "notice", dto);
		
		int totalFileCount = 2;
		NoticeDTO noticeContent = this.noticedao.getNotice(dto.getNotice_no());
		
		// 기존 사진 삭제 checkbox 클릭 시 
        List<String> only_delete = new ArrayList<String>();
        if(notice_image1_delete.equals("Y")) { 
            only_delete.add(noticeContent.getNotice_img1()); 
            noticeContent.setNotice_img1("");
        }
        if(notice_image2_delete.equals("Y")) { 
            only_delete.add(noticeContent.getNotice_img2()); 
            noticeContent.setNotice_img2("");
        }         
        
     // 기존 이미지 이름   
        List<String> origin_names = new ArrayList<String>();
        origin_names.add(noticeContent.getNotice_img1());
        origin_names.add(noticeContent.getNotice_img2());
        
     // 파일 업데이트
        FileUploadImage upload = new FileUploadImage(); 
        List<String> updateFile = upload.updateFile(request, notice_img, "notice", origin_names, totalFileCount);
		
        dto.setNotice_img1(updateFile.get(0));
        dto.setNotice_img2(updateFile.get(1));
        
        int check = this.noticedao.noticeupdate(dto);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
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
