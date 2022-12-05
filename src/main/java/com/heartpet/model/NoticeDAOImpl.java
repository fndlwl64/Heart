package com.heartpet.project.action;

import com.heartpet.project.model.NoticeDTO;
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
