package com.heartpet.model;

import lombok.Data;

@Data
public class WishVO {

	private int animal_no;
	private String animal_name;
	private String animal_species;
	private String animal_gender;
	private int animal_age;
	private String animal_img1;
	private String adopt_reg_duedate;
	private String adopt_reg_adoptdate;
	private String animal_status;
	
}
