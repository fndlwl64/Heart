package com.heartpet.action;

import com.heartpet.model.NoticeDTO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class NoticeDAOImpl implements NoticeDAO{

    @Autowired
    NoticeDAO noticeDAO;


    @Override
    public List<NoticeDTO> getNoticeList() {
        return noticeDAO.getNoticeList();
    }
}
