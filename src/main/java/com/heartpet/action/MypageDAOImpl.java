package com.heartpet.action;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.heartpet.model.Mypage_SupportDTO;

public class MypageDAOImpl implements MypageDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Mypage_SupportDTO> getNoticeList() {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("support_list");
	}

}
