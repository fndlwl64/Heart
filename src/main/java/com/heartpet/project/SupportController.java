package com.heartpet.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SupportController {

	@RequestMapping("/user_support")
    public String user_support() {
        return "user/support/support";
    }
	
	@RequestMapping("/user_support_insert")
	public String user_support_insert() {
		return "user/support/support_insert";
	}
}
