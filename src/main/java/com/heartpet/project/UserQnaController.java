package com.heartpet.project;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.heartpet.action.QnaDAO;
import com.heartpet.model.FnqDTO;
import com.heartpet.model.PageDTO;
import com.heartpet.model.QnaDTO;

@Controller
public class UserQnaController {

    @Autowired
    private QnaDAO qnaDAO;

    // 한 페이지당 보여질 게시물의 수
    private final int rowsize = 10;

    // 전체 게시물의 수
    private int totalRecord = 0;

    ////////////////////////////////////////////////////////////////////////////////////
    // QNA_LIST
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/user_qna_list")
    public String user_qna_list(@RequestParam(value = "field", required = false) String field,
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "order", required = false) String order,
            @RequestParam(value = "page", defaultValue = "1") int page, Model model) {

        if (field == null) {
            field = "";
        }
        if (keyword == null) {
            keyword = "";
        }
        if (order == null) {
            order = "";
        }

        int currentPage = 1; // 현재 페이지 변수
        if (page != 1) {
            currentPage = page;
        }

        totalRecord = this.qnaDAO.listQnaCount(field, keyword);
        PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);

        List<QnaDTO> qnaList = this.qnaDAO.listQna(paging.getStartNo(), paging.getEndNo(), field, keyword, order);

        model.addAttribute("qnaList", qnaList);
        model.addAttribute("total", totalRecord);
        model.addAttribute("paging", paging);
        model.addAttribute("field", field);
        model.addAttribute("keyword", keyword);
        model.addAttribute("order", order);

        return "user/qna/qna_list";
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // QNA_CONTENT - 비밀글 기능 구현
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/user_qna_content")
    public String user_qna_content(@RequestParam("board_no") int board_no,
            @RequestParam("board_parentNo") int board_parentNo, HttpServletResponse response,
            HttpServletRequest request, Model model) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        // 로그인 여부 체크
        if ((session.getAttribute("session_id") == null || session.getAttribute("session_id") == "")
                && (session.getAttribute("session_admin_id") == null
                        || session.getAttribute("session_admin_id") == "")) {
            out.println("<script> alert('로그인이 필요합니다.'); location.href='" + request.getContextPath() + "/'; </script>");
        }

        // session_id
        String session_id = null;
        if (session.getAttribute("session_id") != null) {
            session_id = (String) session.getAttribute("session_id");
        } else {
            session_id = (String) session.getAttribute("session_admin_id");
        }

        QnaDTO qnaContent = this.qnaDAO.contentQna(board_no);

        // 비밀글 여부 체크
        // 비밀글 Y -> 아이디 체크
        // 비밀글 N -> 접근 O
        // 비밀글이거나 session_id = admin
        System.out.println("번호출력 " + qnaContent.getBoard_parentNo());
        System.out.println("번호 " + board_no);
        System.out.println("번호 " + board_parentNo);

        // 유저일 때
        if (!session_id.equals("admin")) { // 유저일 때
            if (qnaContent.getBoard_secret().equals("Y")) { // 비밀글이고
                if (qnaContent.getBoard_id().equals("admin")) { // 작성자 아이디가 admin인데
                    QnaDTO parentContent = this.qnaDAO.contentQna(board_parentNo);
                    System.out.println("부모글 작성자 : " + parentContent.getBoard_id());
                    System.out.println("session_id : " + session_id);
                    if (!parentContent.getBoard_id().equals(session_id)) { // 부모글의 작성자가 내가 아니면
                        out.println("<script> alert('비밀글입니다.'); history.back(); </script>");
                        out.flush();
                    }
                } else if (!qnaContent.getBoard_id().equals(session_id)) { // 작성자가 같지 않거나 작성자가 admin이 아니면
                    out.println("<script> alert('비밀글입니다.'); history.back(); </script>");
                    out.flush();
                }
            }
        }

        this.qnaDAO.hitQna(board_no);
        model.addAttribute("qnaContent", qnaContent);
        return "user/qna/qna_content";
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // QNA_INSERT
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/user_qna_insert")
    public String user_qna_insert(@RequestParam(value = "board_parentNo", defaultValue = "0") int board_parentNo,
            HttpServletResponse response, HttpServletRequest request, Model model) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        // 로그인 여부 체크
        if (session.getAttribute("session_id") == null || session.getAttribute("session_id") == "") {
            out.println("<script> alert('로그인이 필요합니다.'); location.href='" + request.getContextPath() + "/'; </script>");
            out.flush();
        }

        QnaDTO qnaContent = this.qnaDAO.contentQna(board_parentNo);
        model.addAttribute("qnaContent", qnaContent);

        return "user/qna/qna_insert";
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // QNA_INSERT_OK
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/user_qna_insert_ok", method = RequestMethod.POST)
    public void user_qna_insert_ok(@Valid QnaDTO qnaDto, BindingResult result,
            HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        /*
         * for (MultipartFile file : files) { long size = file.getSize(); String
         * fileName = file.getOriginalFilename(); System.out.println("fileName : " +
         * fileName); System.out.println("size : " + size);
         * 
         * // 파일 저장 경로 String savePath = "/resources/qna"; String realPath =
         * request.getSession().getServletContext().getRealPath(savePath);
         * 
         * // 업로드 폴더 체크 후 없으면 생성 File dirChk = new File(realPath); if (!dirChk.exists())
         * { dirChk.mkdir(); }
         * 
         * realPath += File.separator + fileName; File saveFile = new File(realPath);
         * file.transferTo(saveFile); }
         */

        if (result.hasErrors()) { // 에러를 List로 저장
            List<ObjectError> errors = result.getAllErrors();
            for (ObjectError error : errors) {
                if (error.getDefaultMessage().equals("title")) {
                    out.println("<script>alert('글 제목이 없습니다.'); history.back(); </script>");
                    break;
                } else if (error.getDefaultMessage().equals("content")) {
                    out.println("<script>alert('글 내용이 없습니다.'); history.back(); </script>");
                    break;
                } else if (error.getDefaultMessage().equals("password")) {
                    out.println("<script>alert('글 비밀번호를 입력해주세요.'); history.back(); </script>");
                    break;
                } else if (error.getDefaultMessage().equals("regexp")) {
                    out.println(
                            "<script>alert('비밀번호는 6자 이상 10자 이하의 숫자 및 영문자로 구성되어야 합니다. 다시 입력해주세요.'); history.back(); </script>");
                    break;
                }
            }
        } else {
            int check = this.qnaDAO.insertQna(qnaDto);
            if (check > 0) {
                out.println("<script>alert('성공적으로 글이 등록되었습니다.'); location.href='" + request.getContextPath() + "/user_qna_list'; </script>");
            } else {
                out.println("<script>alert('글 등록을 실패했습니다.'); history.back(); </script>");
            }
        }
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // QNA_UPDATE
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/user_qna_update")
    public String user_qna_update(@RequestParam("board_no") int board_no, Model model) {
        QnaDTO qnaContent = this.qnaDAO.contentQna(board_no);
        model.addAttribute("qnaContent", qnaContent);
        return "user/qna/qna_update";
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // QNA_UPDATE_OK
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/user_qna_update_ok", method = RequestMethod.POST)
    public void user_qna_update_ok(QnaDTO qnaDto, HttpServletResponse response, HttpServletRequest request)
            throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        QnaDTO qnaContent = this.qnaDAO.contentQna(qnaDto.getBoard_no());

        // 비번 check
        if (!qnaDto.getBoard_pwd().equals(qnaContent.getBoard_pwd())) {
            out.println("<script>alert('비밀번호를 다시 확인해주세요.'); history.back(); </script>");
        }

        // 유효성 검사
        int check = this.qnaDAO.updateQna(qnaDto);
        if (check > 0) {
            out.println("<script>alert('성공적으로 글이 수정되었습니다.'); location.href='" + request.getContextPath()
                    + "/user_qna_list'; </script>");
        } else {
            out.println("<script>alert('글 수정을 실패했습니다.'); history.back(); </script>");
        }
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // QNA_DELETE
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/user_qna_delete")
    public void user_qna_delete(@RequestParam("board_no") int board_no, @RequestParam("board_pwd") String board_pwd,
            HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        QnaDTO qnaContent = this.qnaDAO.contentQna(board_no);
        if (!qnaContent.getBoard_pwd().equals(board_pwd)) {
            out.println("<script>alert('비밀번호를 다시 확인해주세요.'); history.back(); </script>");
        }

        int check = this.qnaDAO.deleteQna(board_no);
        if (check > 0) {
            out.println("<script>alert('성공적으로 글이 삭제되었습니다.'); location.href='" + request.getContextPath()
                    + "/user_qna_list'; </script>");
        } else {
            out.println("<script>alert('글 삭제 실패!'); history.back(); </script>");
        }
    }

    ////////////////////////////////////////////////////////////////////////////////////
    // FNQ_LIST
    ////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/user_fnq_list")
    public String user_fnq_list(@RequestParam(value = "field", required = false) String field,
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "order", required = false) String order, @RequestParam(defaultValue = "0") int page,
            Model model) {

        if (field == null) {
            field = "";
        }
        if (keyword == null) {
            keyword = "";
        }
        if (order == null) {
            order = "";
        }

        int currentPage = 1; // 현재 페이지 변수
        if (page != 0) {
            currentPage = page;
        }

        totalRecord = this.qnaDAO.listFnqCount(field, keyword);
        PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);

        List<FnqDTO> fnqList = this.qnaDAO.listFnq(paging.getStartNo(), paging.getEndNo(), field, keyword, order);

        model.addAttribute("fnqList", fnqList);
        model.addAttribute("total", totalRecord);
        model.addAttribute("paging", paging);
        model.addAttribute("field", field);
        model.addAttribute("keyword", keyword);
        model.addAttribute("order", order);

        return "user/qna/fnq_list";
    }

}
