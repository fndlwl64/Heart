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
	public UserDTO UserInfo() {
		
		return this.sqlSession.selectOne("user_info");
	}

	@Override
	public int AnimalRegCount() {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("reg_count");
	}

	@Override
	public int ReviewCount() {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("review_count");
	}
	


}
