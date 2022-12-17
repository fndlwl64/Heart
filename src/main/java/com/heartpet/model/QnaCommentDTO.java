package com.heartpet.model;

import lombok.Data;

@Data
public class QnaCommentDTO {

    private int board_comment_commentno;
    private int board_comment_boardno;
    private String board_comment_id;
    private String board_comment_content;
    private String board_comment_pwd;
    private String board_comment_regdate;

}
