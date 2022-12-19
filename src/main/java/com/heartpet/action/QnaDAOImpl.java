package com.heartpet.action;

import com.heartpet.model.FnqDTO;
import com.heartpet.model.QnaCommentDTO;
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

    ////////////////////////////////////////////////////////////
    // QNA
    ////////////////////////////////////////////////////////////
    @Override
    public List<QnaDTO> listQna(int startNo, int endNo, String field, String keyword, String order) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("startNo", startNo);
        map.put("endNo", endNo);
        map.put("field", field);
        map.put("keyword", keyword);
        map.put("order", order);
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
    
    ////////////////////////////////////////////////////////////
    // Comment
    ////////////////////////////////////////////////////////////
    @Override
    public int insertComment(QnaCommentDTO dto) {
        return this.sqlSession.insert("qna_comment_insert", dto);
    }
    
    @Override
    public List<QnaCommentDTO> listComment(int board_no) {
        return this.sqlSession.selectList("qna_comment_list", board_no);
    }
    
    @Override
    public int countComment(int board_no) {
        return this.sqlSession.selectOne("qna_comment_count", board_no);
    }

    @Override
    public int deleteComment(int comment_commentno) {
        return this.sqlSession.delete("qna_comment_delete", comment_commentno);
    }
    
    ////////////////////////////////////////////////////////////
    // FNQ
    ////////////////////////////////////////////////////////////
    @Override
    public List<FnqDTO> listFnq(int startNo, int endNo, String field, String keyword, String order) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("startNo", startNo);
        map.put("endNo", endNo);
        map.put("field", field);
        map.put("keyword", keyword);
        map.put("order", order);
        return this.sqlSession.selectList("fnq_list", map);
    }

    @Override
    public int listFnqCount(String field, String keyword) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("field", field);
        map.put("keyword", keyword);
        return this.sqlSession.selectOne("fnq_count", map);
    }

    @Override
    public int insertFnq(FnqDTO dto) {
        return this.sqlSession.insert("fnq_insert", dto);
    }

    @Override
    public int updateFnq(FnqDTO dto) {
        return this.sqlSession.update("fnq_update", dto);
    }

    @Override
    public int deleteFnq(int fnq_no) {
        return this.sqlSession.delete("fnq_delete", fnq_no);
    }

    @Override
    public FnqDTO contentFnq(int fnq_no) {
        return this.sqlSession.selectOne("fnq_content", fnq_no);
    }

}
