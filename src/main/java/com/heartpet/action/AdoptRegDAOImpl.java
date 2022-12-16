package com.heartpet.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return sqlSession.insert("adoptreg_insert",dto);
	}

	@Override
	public int update(AdoptRegDTO dto) {
		return sqlSession.update("adoptreg_update",dto);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	//public List<Map<String, Object>> list() {
	public List<AdoptRegDTO> list() {
		return sqlSession.selectList("adoptreg_list");
	}

	@Override
	public List<AdoptRegDTO> listPaging(int startNo, int endNo, String startDate, String endDate,String tag,String sort) {
		Map<String, Object> map = new HashMap<String, Object>();
    	map.put("tag", tag);
    	map.put("startDate", startDate);
    	map.put("endDate", endDate);
    	map.put("startNo", startNo);
    	map.put("endNo", endNo);
    	map.put("sort", sort);
    	return this.sqlSession.selectList("adoptreg_list_paging", map);
	}

	@Override
	public AdoptRegDTO content(int id) {
		return sqlSession.selectOne("adoptreg_content",id);
	}

	@Override
	public List<AdoptRegDTO> search() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count() {
		return sqlSession.selectOne("adoptreg_count");
	}

	@Override
	public int countTag(String startDate, String endDate, String tag) {
		Map<String, Object> map = new HashMap<String, Object>();
    	map.put("tag", tag);
    	map.put("startDate", startDate);
    	map.put("endDate", endDate);
		return sqlSession.selectOne("adoptreg_countTag",map);
	}

}
