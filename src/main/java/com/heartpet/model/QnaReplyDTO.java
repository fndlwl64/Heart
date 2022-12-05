package com.heartpet.model;

import lombok.Data;

@Data
public class QnaReplyDTO {

    private int reply_board_replyno;
    private int reply_board_boardno;
    private String reply_board_category;
    private String reply_board_id;
    private int reply_board_hit;
    private String reply_board_title;
    private String reply_board_content;
    private String reply_board_secret;
    private String reply_board_regdate;
    private String reply_board_update;
    private String reply_board_img1;
    private String reply_board_img2;

}
