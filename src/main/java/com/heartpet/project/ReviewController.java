package com.heartpet.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	
    // 한 페이지당 보여질 게시물의 수
    private final int rowsize = 3;

    // 전체 게시물의 수
    private int totalRecord = 0;
	
    @RequestMapping("/user_review_list")
    public String user_review_list() { return "user/review/review_list"; }

    @RequestMapping("/user_review_insert")
    public String user_review_insert() { return "user/review/review_insert"; }

    @RequestMapping("/user_review_content")
    public String user_review_content() { return "user/review/review_content"; }

    @RequestMapping("/user_review_update")
    public String review_update() { return "user/review/review_update"; }

}
