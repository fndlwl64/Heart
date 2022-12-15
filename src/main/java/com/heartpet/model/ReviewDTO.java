package com.heartpet.model;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class ReviewDTO {

    private int review_no;
    private String review_id;
    private int review_animal_id;
    private String review_animal_tag;
    private int review_hit;
    
    @NotBlank(message = "title")
    private String review_title;
    
    @NotBlank(message = "content")
    private String review_content;
    
    private String review_regdate;
    private String review_img1;
    private String review_img2;
    private String review_img3;
    private String review_video;
    private String animal_name;

}
