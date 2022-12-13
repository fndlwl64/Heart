package com.heartpet.action;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SupportDAOImpl implements SupportDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 후원하기에서 마지막 후원번호 가져오는 메서드
	@Override
	public int SupportMaxNo() {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("support_no");
	}

	
	
}
