package com.heartpet.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class QnaDTO {

    private int board_no;
    private String board_category;
    private String board_id;
    private int board_hit;
    
    @NotBlank(message = "title")
    private String board_title;
    
    @NotBlank(message = "content")
    private String board_content;
    private String board_secret;

    @NotBlank(message = "password")
    @Pattern(regexp="/^[A-Za-z0-9]{6,10}$/", message = "regexp")
    private String board_pwd;
    
    private String board_regdate;
    private String board_update;
    private String board_img1;
    private String board_img2;

}
