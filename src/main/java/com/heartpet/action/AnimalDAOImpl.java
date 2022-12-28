package com.heartpet.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.heartpet.model.AnimalDTO;

@Repository
public class AnimalDAOImpl implements AnimalDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert(AnimalDTO dto) {
		return sqlSession.insert("animal_insert", dto);
	}

	@Override
	public int update(AnimalDTO dto) {
		return sqlSession.update("animal_update", dto);
	}

	@Override
	public int updateStatus(AnimalDTO dto) {
		return sqlSession.update("animal_updateStatus", dto);
	}

	@Override
	public void delete(int id) {
		sqlSession.delete("animal_delete", id);
	}

	@Override
	public List<Integer> joinStatus(String animal_status,String animal_name) {
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("animal_status", animal_status);
		maps.put("animal_name", animal_name);
		return sqlSession.selectList("animal_join_status",maps);
	}

	@Override
	public List<AnimalDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("animal_list");
	}

	@Override
	public List<AnimalDTO> listTag(String animal_tag) {
		return sqlSession.selectList("animal_listTag", animal_tag);
	}

	@Override
	public List<AnimalDTO> listTagUser(String animal_tag) {
		return sqlSession.selectList("animal_listTagUser", animal_tag);
	}

	@Override

	public List<AnimalDTO> listPaging(int startNO, int endNo, AnimalDTO animalDTO, String keyword,String sort,int startWeight, int endWeight) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNo", startNO);
		map.put("endNo", endNo);
		map.put("animalDTO", animalDTO);
		map.put("keyword", keyword);
		map.put("sort", sort);
		map.put("startWeight", startWeight);
		map.put("endWeight", endWeight);
		return sqlSession.selectList("animal_listTagPaging", map);
	}

	@Override
	public AnimalDTO content(int id) {
		return sqlSession.selectOne("animal_content", id);
	}

	@Override
	public List<AnimalDTO> search() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count(String animal_tag) {
		return sqlSession.selectOne("animal_count", animal_tag);
	}

	//////////////////////////////////////////////////////
	// Review에서 사용 @남윤지
	//////////////////////////////////////////////////////
	@Override
	public Map<String, Object> animalName(int animal_no) {
		return this.sqlSession.selectOne("animal_name", animal_no);
	}
	
	//////////////////////////////////////////////////////
    // Main에서 사용 @남윤지
    //////////////////////////////////////////////////////
	
    @Override
    public List<AnimalDTO> mainAnimal(String animal_tag) {
        return this.sqlSession.selectList("animal_main_list", animal_tag);
    }
	
	//////////////////////////////////////////////////////

	@Override
	public int countPaging(AnimalDTO dto, String keyword,int startWeight, int endWeight) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("animalDTO", dto);
		map.put("keyword", keyword);
		map.put("startWeight", startWeight);
		map.put("endWeight", endWeight);
		return sqlSession.selectOne("animal_countPaging", map);
	}

}
