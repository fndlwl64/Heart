package com.heartpet.action;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.heartpet.model.AnimalDTO;

@Repository
public class AnimalDAOImpl implements AnimalDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	@Transactional
	public int insert(AnimalDTO dto) {
		return sqlSession.insert("insert", dto);
	}

	@Override
	@Transactional
	public int update(AnimalDTO dto) {
		return sqlSession.update("update", dto);
	}

	@Override
	@Transactional
	public void delete(int id) {
		sqlSession.delete("delete", id);
		
	}

	@Override
	@Transactional
	public List<AnimalDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("list");
	}

	@Override
	@Transactional
	public List<AnimalDTO> listTag(String animal_tag) {
		return sqlSession.selectList("listTag", animal_tag);
	}

	@Override
	@Transactional
	public AnimalDTO content(int id) {
		return sqlSession.selectOne("content", id);
	}

	@Override
	@Transactional
	public List<AnimalDTO> search() {
		// TODO Auto-generated method stub
		return null;
	}
	
	//////////////////////////////////////////////////////
	// Review에서 사용 @남윤지
	//////////////////////////////////////////////////////
	@Override
	public List<String> animalName(List<Integer> animal_no) {
		return this.sqlSession.selectOne("animal_name", animal_no);
	}	
	
}
