package com.heartpet.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heartpet.model.WishDTO;
import com.heartpet.model.WishVO;

@Repository
public class WishDAOImpl implements WishDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/*
	 * @Override public List<WishDTO> list() { return null; }
	 */

	@Override
	public WishDTO content(int userid) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int check(WishDTO dto) {
		return sqlSession.selectOne("wish_check",dto);
	}

	@Override
	public int insert(WishDTO dto) {
		return sqlSession.insert("wish_insert",dto);
	}

	@Override
	public int delete(WishDTO dto) {
		return sqlSession.delete("wish_delete",dto);
	}

}
