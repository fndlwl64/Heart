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
        return 0;
    }

    @Override
    public QnaDTO contentQna(int board_no) {
        return null;
    }

    @Override
    public int updateQna(QnaDTO dto) {
        return 0;
    }

    @Override
    public int deleteQna(int board_no) {
        return 0;
    }

    @Override
    public List<QnaDTO> searchQna(String field, String keyword) {
        return null;
    }
}
