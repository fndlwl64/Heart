package com.heartpet.action;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heartpet.model.AnimalDTO;
import com.heartpet.model.DogDTO;

@Repository
public class AnimalDAOImpl implements AnimalDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert(AnimalDTO dto) {
		return sqlSession.insert("insert", dto);
	}

	@Override
	public int update(AnimalDTO dto) {
		return sqlSession.update("update", dto);
	}

	@Override
	public void delete(int id) {
		sqlSession.delete("delete", id);
		
	}

	@Override
	public List<AnimalDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("list");
	}

	@Override
	public List<AnimalDTO> listTag(String animal_tag) {
		return sqlSession.selectList("listTag", animal_tag);
	}

	@Override
	public AnimalDTO content(int id) {
		return sqlSession.selectOne("content", id);
	}

	@Override
	public List<AnimalDTO> search() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
