package com.heartpet.action;

import com.heartpet.model.NoticeDTO;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class NoticeDAOImpl implements NoticeDAO{

    @Autowired
    NoticeDAO noticeDAO;


    @Override
    public List<NoticeDTO> getNoticeList() {
        return noticeDAO.getNoticeList();
    }
}
