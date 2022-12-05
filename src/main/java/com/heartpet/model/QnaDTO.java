package com.heartpet.model;

import lombok.Data;

@Data
public class QnaDTO {

    private int board_no;
    private String board_category;
    private String board_id;
    private int board_hit;
    private String board_title;
    private String board_content;
    private String board_secret;
    private String board_regdate;
    private String board_update;
    private String board_img1;
    private String board_img2;

}
