package com.heartpet.action;

import com.heartpet.model.NoticeDTO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO{

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<NoticeDTO> getNoticeList() {
		
		return this.sqlSession.selectList("notice_list");
	}


}
