package com.heartpet.model;

import lombok.Data;

@Data
public class NoticeDTO {
    private int notice_no;
    private String notice_title;
    private String notice_content;
    private int notice_hit;
    private String notice_img1;
    private String notice_img2;
    private String notice_date;
    
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getNotice_hit() {
		return notice_hit;
	}
	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}
	public String getNotice_img1() {
		return notice_img1;
	}
	public void setNotice_img1(String notice_img1) {
		this.notice_img1 = notice_img1;
	}
	public String getNotice_img2() {
		return notice_img2;
	}
	public void setNotice_img2(String notice_img2) {
		this.notice_img2 = notice_img2;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}

    
    
}
