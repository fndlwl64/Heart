package com.heartpet.model;

import lombok.Data;

@Data
public class ReviewCommentDTO {
    
    private int comment_commentno;
    private int comment_reviewno;
    private String comment_id;
    private String comment_content;
    private String comment_regdate;

}
