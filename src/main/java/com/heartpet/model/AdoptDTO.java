package com.heartpet.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data @ToString 
public class AdoptDTO {
    private int adopt_reg_regno;
    private String adopt_reg_userid;
    private int adopt_reg_animalno;
	private String adopt_reg_regdate;
	private String adopt_reg_duedate;
	private String adopt_reg_adoptdate;
	private String adopt_reg_appdate;
	
}
