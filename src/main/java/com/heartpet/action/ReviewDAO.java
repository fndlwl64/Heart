package com.heartpet.action;

import java.util.List;
import java.util.Map;

import com.heartpet.model.ReviewCommentDTO;
import com.heartpet.model.ReviewDTO;

public interface ReviewDAO {
    
    ////////////////////////////////////////////////////////////
    // Review
    ////////////////////////////////////////////////////////////
    public List<ReviewDTO> listReview(int startNo, int endNo, String field, String keyword, String order);
    public List<ReviewDTO> listReview(int startNo, int endNo, String animal_tag, String order);
    public List<ReviewDTO> listReview(int startNo, int endNo, 
            String search_animal, String search_id, String search_content, String order);
    public int listReviewCount(String search_animal, String search_id, String search_content);
    public List<ReviewDTO> listReview(String animal_tag);
    public List<ReviewDTO> mainReview(String animal_tag);
    public int listReviewCount(String field, String keyword);
    public int listReviewCount(String animal_tag);
    public int insertReview(ReviewDTO dto);
    public ReviewDTO contentReview(int review_no);
    public int hitReview(int review_no);
    public int updateReview(ReviewDTO dto);
    public int deleteReview(int review_no);
    public List<Integer> animalId(String session_id);
    
    ////////////////////////////////////////////////////////////
    // Comment
    ////////////////////////////////////////////////////////////
    public int insertComment(ReviewCommentDTO dto);
    public List<ReviewCommentDTO> listComment(int review_no);
    public int countComment(int review_no);
    public int deleteComment(int comment_commentno);
    public int deleteAllComment(int review_no);
    
    ////////////////////////////////////////////////////////////
    // Mypage
    ////////////////////////////////////////////////////////////    
    public Map<String, Object> mypageReviewCount(int animal_id);

}
