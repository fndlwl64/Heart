package com.heartpet.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heartpet.model.ReviewCommentDTO;
import com.heartpet.model.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    /////////////////////////////////////////////////
    // 전체 list
    /////////////////////////////////////////////////
    @Override
    public List<ReviewDTO> listReview(int startNo, int endNo, String field, String keyword, String order) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("startNo", startNo);
        map.put("endNo", endNo);
        map.put("field", field);
        map.put("keyword", keyword);
        map.put("order", order);
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
    public List<ReviewDTO> listReview(int startNo, int endNo, String animal_tag, String order) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("startNo", startNo);
        map.put("endNo", endNo);
        map.put("animal_tag", animal_tag);
        map.put("order", order);
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
    
    // Main에 띄울 메서드
    @Override
    public List<ReviewDTO> mainReview(String animal_tag) {
        return this.sqlSession.selectList("review_main_list", animal_tag);
    }
    
    //===========================================================
    // Admin : List 출력
    //===========================================================    
    @Override
    public List<ReviewDTO> listReview(int startNo, int endNo, String search_animal, String search_id,
            String search_content, String order) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("startNo", startNo);
        map.put("endNo", endNo);
        map.put("search_animal", search_animal);
        map.put("search_id", search_id);
        map.put("search_content", search_content);
        map.put("order", order);
        return this.sqlSession.selectList("review_admin_list", map);
    }

    @Override
    public int listReviewCount(String search_animal, String search_id, String search_content) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("search_animal", search_animal);
        map.put("search_id", search_id);
        map.put("search_content", search_content);
        return this.sqlSession.selectOne("review_admin_count", map);
    }

    ////////////////////////////////////////////////////////////
    // Comment
    ////////////////////////////////////////////////////////////
    @Override
    public int insertComment(ReviewCommentDTO dto) {
        return this.sqlSession.insert("review_comment_insert", dto);
    }
    
    @Override
    public List<ReviewCommentDTO> listComment(int review_no) {
        return this.sqlSession.selectList("review_comment_list", review_no);
    }
    
    @Override
    public int countComment(int review_no) {
        return this.sqlSession.selectOne("review_comment_count", review_no);
    }

    @Override
    public int deleteComment(int comment_commentno) {
        return this.sqlSession.delete("review_comment_delete", comment_commentno);
    }
    
    @Override
    public int deleteAllComment(int review_no) {
        return this.sqlSession.delete("review_comment_deleteAll", review_no);
    }

    ///////////////////////////////////////////////////////
    // myPage 사용
    ///////////////////////////////////////////////////////
	@Override
	public Map<String, Object> mypageReviewCount(int animal_id) {
		return this.sqlSession.selectOne("review_animal_no_count", animal_id);
	}

}
