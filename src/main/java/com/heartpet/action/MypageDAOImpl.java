package com.heartpet.action;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heartpet.model.Mypage_SupportDTO;
import com.heartpet.model.UserDTO;

@Repository
public class MypageDAOImpl implements MypageDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Mypage_SupportDTO> getSupportList() {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("support_list");
	}

	@Override
	public int SumSupport() {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("support_sum");
	}

	@Override
	public List<UserDTO> UserInfo() {
		
		return this.sqlSession.selectList("user_info");
	}


}
