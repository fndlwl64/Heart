package com.heartpet.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class NoticeDTO {
    private int notice_no;
    private String notice_title;
    private String notice_content;
    private int notice_hit;
    private String notice_img1;
    private String notice_img2;
    private String notice_date;

}
