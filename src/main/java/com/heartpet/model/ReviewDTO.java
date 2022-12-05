package com.heartpet.model;

import lombok.Data;

@Data
public class ReviewDTO {

    private int review_no;
    private String review_id;
    private String review_dog_id;
    private int review_hit;
    private String review_title;
    private String review_content;
    private String review_regdate;
    private String review_img1;
    private String review_img2;
    private String review_img3;
    private String review_video;

}
