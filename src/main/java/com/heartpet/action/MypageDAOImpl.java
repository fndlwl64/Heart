package com.heartpet.action;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heartpet.model.Mypage_SupportDTO;
import com.heartpet.model.UserDTO;
import com.heartpet.model.WishVO;

@Repository
public class MypageDAOImpl implements MypageDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Mypage_SupportDTO> getSupportList(String id) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("support_list", id);
	}

	@Override
	public int SumSupport(String id) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("support_sum", id);
	}

	@Override
	public UserDTO UserInfo(String id) {
		
		return this.sqlSession.selectOne("user_info", id);
	}

	@Override
	public int AnimalRegCount(String id) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("reg_count", id);
	}

	@Override
	public int ReviewCount(String id) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("mypage_review_count", id);
	}

	@Override
	public int UserUpdate(UserDTO dto) {
		// TODO Auto-generated method stub
		return this.sqlSession.update("user_update", dto);
	}

	@Override
	public List<WishVO> getWishList(String id) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("wish_list", id);
	}

	@Override
	public List<WishVO> getAdoptList(String id) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("adopt_list", id);
	}

	@Override
	public List<WishVO> getAdoptComList(String id) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("adopt_com_list", id);
	}
	
	
	


}
