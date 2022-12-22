package com.heartpet.action;

import com.heartpet.model.NoticeDTO;
import com.heartpet.model.SupportDTO;

import java.util.List;


public interface NoticeDAO {
    
    //상세
    public NoticeDTO getNotice(int no);
    
    //조회수
    public int readCount(int no);
    
    //등록
    public int noticeinsert(NoticeDTO dto);
    
    //수정
    public int noticeupdate(NoticeDTO dto);
    
    //삭제
    public int noticedelete(int no);
    
    //후원하기 페이징
    public List<NoticeDTO> listNotice(int startNo, int endNo, String search_title, String search_cont, String search_date_start, String search_date_end, String order);

    //후원하기 페이징 전체 개수
    public int listNoticeCount(String search_title, String search_cont, String search_date_start, String search_date_end);
}
