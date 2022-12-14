package com.heartpet.action;

import com.heartpet.model.NoticeDTO;

import java.util.List;


public interface NoticeDAO {

	//리스트
    public List<NoticeDTO> getNoticeList();
    
    //상세
    public NoticeDTO getNotice(int no);
    
    //조회수
    public int readCount(int no);
}
