package com.heartpet.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data @ToString 
public class AnimalDTO {
    private int animal_no;
    private String animal_name;
    private String animal_species;
    private String animal_gender;
    private String animal_neutered;
    private String animal_vaccination;
    private int animal_age;
    private String animal_place;
    private String animal_size;
    private int animal_weight;
    private String animal_caution;
    private String animal_img1;
    private String animal_img2;
    private String animal_img3;
    private String animal_status;
    private String animal_tag;	
    private String animal_regdate;
    private String animal_update;
    
    
}
