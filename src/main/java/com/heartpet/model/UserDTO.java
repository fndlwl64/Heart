package com.heartpet.model;

import lombok.Data;

@Data
public class UserDTO {
    private String user_no;
    private String user_id;
    private String user_pwd;
    private String user_name;
    private String user_regno;
    private String user_grade;
    private String user_email;
    private String user_phone;
    private String user_addr;
    private int user_totalprice;
    private String user_dogexp;
}
