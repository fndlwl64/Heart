package com.heartpet.action;

import java.util.List;
import java.util.Map;

import com.heartpet.model.ReviewDTO;

public interface ReviewDAO {
	
    public List<ReviewDTO> listReview(int startNo, int endNo, String field, String keyword);
    public int listReviewCount(String field, String keyword);
    public int insertReview(ReviewDTO dto);
    public ReviewDTO contentReview(int review_no);
    public int hitReview(int review_no);
    public int updateReview(ReviewDTO dto);
    public int deleteReview(int review_no);

}
