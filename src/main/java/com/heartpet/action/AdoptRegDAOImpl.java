package com.heartpet.action;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.heartpet.model.AdoptRegDTO;
import com.heartpet.model.AnimalDTO;

@Repository
public class AdoptRegDAOImpl implements AdoptRegDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert(AdoptRegDTO dto) {
		return sqlSession.insert("insert",dto);
	}

	@Override
	public int update(AdoptRegDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<AdoptRegDTO> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AdoptRegDTO content(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AdoptRegDTO> search() {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
