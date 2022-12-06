package com.heartpet.action;

import com.heartpet.model.QnaDTO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAOImpl implements QnaDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

    @Override
    public List<QnaDTO> listQna() {
        return this.sqlSession.selectList("qna_list");
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
    public List<QnaDTO> searchQna(String field, String keyword) {
        return null;
    }
}
