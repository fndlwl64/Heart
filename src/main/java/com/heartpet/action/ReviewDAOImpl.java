package com.heartpet.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heartpet.model.QnaCommentDTO;
import com.heartpet.model.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    /////////////////////////////////////////////////
    // 전체 list
    /////////////////////////////////////////////////
    @Override
    public List<ReviewDTO> listReview(int startNo, int endNo, String field, String keyword) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("startNo", startNo);
        map.put("endNo", endNo);
        map.put("field", field);
        map.put("keyword", keyword);
        return this.sqlSession.selectList("review_list", map);
    }

    @Override
    public int listReviewCount(String field, String keyword) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("field", field);
        map.put("keyword", keyword);
        return this.sqlSession.selectOne("review_count", map);
    }

    @Override
    public int insertReview(ReviewDTO dto) {
        return this.sqlSession.insert("review_insert", dto);
    }

    @Override
    public ReviewDTO contentReview(int review_no) {
        return this.sqlSession.selectOne("review_content", review_no);
    }

    @Override
    public int hitReview(int review_no) {
        return this.sqlSession.update("review_hit", review_no);
    }

    @Override
    public int updateReview(ReviewDTO dto) {
        return this.sqlSession.update("review_update", dto);
    }

    @Override
    public int deleteReview(int review_no) {
        return this.sqlSession.delete("review_delete", review_no);
    }

    @Override
    public List<Integer> animalId(String session_id) {
        return this.sqlSession.selectList("animal_id", session_id);
    }
    
    //===========================================================
    // animal_tag : dog/cat 선택에 따른 List 출력
    //===========================================================
    @Override
    public List<ReviewDTO> listReview(int startNo, int endNo, String animal_tag) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("startNo", startNo);
        map.put("endNo", endNo);
        map.put("animal_tag", animal_tag);
        return this.sqlSession.selectList("review_animal_option", map);
    }

    @Override
    public int listReviewCount(String animal_tag) {
        return this.sqlSession.selectOne("review_animal_count", animal_tag);
    }

    @Override
    public List<ReviewDTO> listReview(String animal_tag) {
        return this.sqlSession.selectList("review_total_list", animal_tag);
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

    ///////////////////////////////////////////////////////
    // myPage 사용
    ///////////////////////////////////////////////////////
	@Override
	public Map<String, Object> mypageReviewCount(int animal_id) {
		return this.sqlSession.selectOne("review_animal_no_count", animal_id);
	}

}
