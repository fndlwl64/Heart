package com.heartpet.model;

import lombok.Data;

@Data
public class QnaCommentDTO {

    private int comment_commentno;
    private int comment_boardno;
    private String comment_id;
    private String comment_content;
    private String comment_regdate;

}
