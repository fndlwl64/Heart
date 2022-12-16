package com.heartpet.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heartpet.model.UserDTO;
import com.heartpet.model.WishDTO;

@Repository
public class WishDAOImpl implements WishDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<WishDTO> list() {
		return null;
	}

	@Override
	public WishDTO content(int userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WishDTO check(WishDTO wishDTO) {
		return sqlSession.selectOne("wish_check",wishDTO);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(WishDTO dto) {
		return sqlSession.insert("");
	}

	@Override
	public int update(int wish_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int wish_no) {
		// TODO Auto-generated method stub
		return 0;
	}
}
