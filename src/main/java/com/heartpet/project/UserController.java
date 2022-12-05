package com.heartpet.project.controller;

import com.heartpet.project.action.NoticeDAO;
import com.heartpet.project.model.NoticeDTO;
import com.heartpet.project.model.AnimalDTO;
import com.heartpet.project.action.DogDAO;
import com.heartpet.project.model.DogDTO;
import com.heartpet.project.action.QnaDAO;
import com.heartpet.project.model.QnaDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class UserController {
    //DOG
    private DogDAO dogDAO;
    @Autowired
    public void setDogDAO(DogDAO dogDAO){
        this.dogDAO = dogDAO;
    }

    @GetMapping("/jsptest")
    public String jsptest(Model model){
        model.addAttribute("list",dogDAO.list());
        return "jsptest";
    }

    private QnaDAO qnaDAO;

    @Autowired
    public void setQnaDAO(QnaDAO qnaDAO) {
        this.qnaDAO = qnaDAO;
    }

    @Autowired
    NoticeDAO noticedao;


    @GetMapping("/user_dog_list")
    public String dog_list() { return "animal/dog/user_dog_list"; }

    @RequestMapping("/user_dog_content")
    public String dog_content() { return "animal/dog/user_dog_content"; }

    @GetMapping ("/user_animal_insert")
    public String dog_insert() { return "animal/user_animal_insert"; }

    //파일 업로드 테스트
    @PostMapping("/user_animal_insert")
    public String dog_insert_ok(@RequestPart List<MultipartFile> files, AnimalDTO dto,
                                @RequestParam(value = "tag") String tag, HttpServletRequest request) throws IOException {

        //path 설정 및 폴더 생성
        String rootPath = System.getProperty("user.dir");
        String uploadPath = "\\src\\main\\resources\\static\\upload";
        String path = rootPath + uploadPath;

        File folder = new File(path);

        List<DogDTO> list = dogDAO.list();
        for(DogDTO d : list){
            System.out.println(d.toString());
        }

        if(!folder.exists()){ // 폴더 생성
            folder.mkdir();
        }
        //tag에 따라서 강아지 또는 고양이 insert 문 사용

        for (MultipartFile file : files) {
            File toFile = new File(path+"\\"+file.getOriginalFilename());
            file.transferTo(toFile);
        }
        return "redirect:/";
    }

    @GetMapping("/user_support")
    public String user_support() {
        return "support/support";
    }

    @GetMapping("/user_qna_list")
    public String user_qna_list(Model model) {
        List<QnaDTO> qnaList = this.qnaDAO.listQna();
        model.addAttribute("qnaList", qnaList);
        return "qna/qna_list";
    }

    @GetMapping("/user_qna_insert")
    public String user_qna_insert() { return "qna/qna_insert"; }

    @GetMapping("/user_qna_insert_ok")
    public String user_qna_insert_ok() {

        return "qna/qna_list";
    }

    @GetMapping("/user_qna_update")
    public String user_qna_update() { return "qna/qna_update"; }

    @GetMapping("/user_qna_content")
    public String user_qna_content() { return "qna/qna_content"; }

    @GetMapping("/user_fnq_list")
    public String user_fnq_list() { return "qna/fnq_list"; }

    @GetMapping("/user_notice")
    public String notice(Model model) {
        List<NoticeDTO> list = noticedao.getNoticeList();
        model.addAttribute("List", list);
        return "notice/notice_list";
    }

    @GetMapping("/user_review_list")
    public String user_review_list() { return "review/review_list"; }

    @GetMapping("/user_review_insert")
    public String user_review_insert() { return "review/review_insert"; }

    @GetMapping("/user_review_content")
    public String user_review_content() { return "review/review_content"; }

    @GetMapping("/user_review_update")
    public String review_update() { return "review/review_update"; }

    @GetMapping("/user_mypage_wish_list")
    public String mypage_wish_list() {
        return "mypage/mypage_wish_list";
    }

    @GetMapping("/login")
    public void login(@RequestParam("paramId")String id, @RequestParam("paramName")String name, @RequestParam("paramEmail")String email){

    }

    @GetMapping("/user_mypage_adoptreg_list")
    public String mypage_adoptreg_list() {
        return "mypage/mypage_adopt_reg_list";
    }
    @GetMapping("/user_mypage_adoptcomplet_list")
    public String mypage_adoptcomplet_list() {
        return "mypage/mypage_adopt_complet_list";
    }
    @GetMapping("/user_mypage_user_update")
    public String mypage_user_update() {
        return "mypage/mypage_user_update";
    }
    @GetMapping("/user_mypage_user_delete")
    public String mypage_user_delete() {
        return "mypage/mypage_user_delete";
    }
    @GetMapping("/user_mypage_support_list")
    public String mypage_support_list() {
        return "mypage/mypage_support_list";
    }
    @GetMapping("/user_mypage_grade_list")
    public String mypage_grade_list() {
        return "mypage/mypage_grade_list";
    }

}
