package com.heartpet.action;

import com.heartpet.model.FnqDTO;
import com.heartpet.model.QnaDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAOImpl implements QnaDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

    @Override
    public List<QnaDTO> listQna(int startNo, int endNo, String field, String keyword) {
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("startNo", startNo);
    	map.put("endNo", endNo);
    	map.put("field", field);
    	map.put("keyword", keyword);
        return this.sqlSession.selectList("qna_list", map);
    }
    
	@Override
	public int listQnaCount(String field, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("field", field);
		map.put("keyword", keyword);		
		return this.sqlSession.selectOne("qna_count", map);
	}

    @Override
    public int insertQna(QnaDTO dto) {
        return this.sqlSession.insert("qna_insert", dto);
    }

    @Override
    public QnaDTO contentQna(int board_no) {
        return this.sqlSession.selectOne("qna_content", board_no);
    }
    
    @Override
    public int hitQna(int board_no) {
        return this.sqlSession.update("qna_hit", board_no);
	}

    @Override
    public int updateQna(QnaDTO dto) {
        return this.sqlSession.update("qna_update", dto);
    }

    @Override
    public int deleteQna(int board_no) {
        return this.sqlSession.delete("qna_delete", board_no);
    }
    
	@Override
	public String idQna(int board_no) {
		return this.sqlSession.selectOne("qna_id", board_no);
	}
	
	@Override
	public List<FnqDTO> listFnq(int startNo, int endNo, String field, String keyword) {
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("startNo", startNo);
    	map.put("endNo", endNo);
    	map.put("field", field);
    	map.put("keyword", keyword);
        return this.sqlSession.selectList("fnq_list", map);
    }

	@Override
	public int listFnqCount(String field, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("field", field);
		map.put("keyword", keyword);		
		return this.sqlSession.selectOne("fnq_count", map);
	}
	
	
}
