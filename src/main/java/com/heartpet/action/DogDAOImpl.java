package com.heartpet.action;

import com.heartpet.model.DogDTO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DogDAOImpl implements DogDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
    
    @Override
    public int insert(DogDTO testDTO) {
        return 0;
    }

    @Override
    public int update(DogDTO testDTO) {
        return 0;
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public List<DogDTO> list() {
        return null;
    }

    @Override
    public DogDTO content(int id) {
        return null;
    }

    @Override
    public List<DogDTO> search() {
        return null;
    }
}
