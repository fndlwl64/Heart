package com.heartpet.project.action;

import com.heartpet.project.model.NoticeDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeDAO {

    public List<NoticeDTO> getNoticeList();
}
