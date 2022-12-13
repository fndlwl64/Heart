package com.heartpet.action;

import java.util.List;

import com.heartpet.model.ReviewDTO;

public interface ReviewDAO {
	
    public List<ReviewDTO> listReview(int startNo, int endNo, String field, String keyword);
    public List<ReviewDTO> listReview(int startNo, int endNo, String animal_tag);
    public List<ReviewDTO> listReview(String animal_tag);
    public int listReviewCount(String field, String keyword);
	public int listReviewCount(String animal_tag);
    public int insertReview(ReviewDTO dto);
    public ReviewDTO contentReview(int review_no);
    public int hitReview(int review_no);
    public int updateReview(ReviewDTO dto);
    public int deleteReview(int review_no);
    public List<Integer> animalId(String session_id);

}
