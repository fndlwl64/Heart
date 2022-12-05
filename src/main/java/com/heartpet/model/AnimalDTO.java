package com.heartpet.model;

import lombok.Data;

@Data
public class AnimalDTO {
    private int animal_no;
    private String animal_name;
    private String animal_species;
    private String animal_gender;
    private String animal_neutered;
    private String animal_vaccination;
    private int animal_age;
    private String animal_place;
    private int animal_size;
    private int animal_weight;
    private String animal_caution;
    private String animal_img1;
    private String animal_img2;
    private String animal_img3;
    private String animal_stauts;

    @Override
    public String toString() {
        return "AnimalDTO{" +
                "animal_no=" + animal_no +
                ", animal_name='" + animal_name + '\'' +
                ", animal_species='" + animal_species + '\'' +
                ", animal_gender='" + animal_gender + '\'' +
                ", animal_neutered='" + animal_neutered + '\'' +
                ", animal_vaccination='" + animal_vaccination + '\'' +
                ", animal_age=" + animal_age +
                ", animal_place='" + animal_place + '\'' +
                ", animal_size=" + animal_size +
                ", animal_weight=" + animal_weight +
                ", animal_caution='" + animal_caution + '\'' +
                ", animal_img1='" + animal_img1 + '\'' +
                ", animal_img2='" + animal_img2 + '\'' +
                ", animal_img3='" + animal_img3 + '\'' +
                ", animal_stauts='" + animal_stauts + '\'' +
                '}';
    }
}
