package com.heartpet.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class DogDTO {
    private int dog_no;
    private String dog_name;
    private String dog_species;
    private String dog_gender;
    private String dog_neutered;
    private String dog_vaccination;
    private int dog_age;
    private String dog_place;
    private String dog_size;
    private int dog_weight;
    private String dog_caution;
    private String dog_img1;
    private String dog_img2;
    private String dog_img3;
    private String dog_status;


    @Override
    public String toString() {
        return "DogDTO{" +
                "dog_no=" + dog_no +
                ", dog_name='" + dog_name + '\'' +
                ", dog_species='" + dog_species + '\'' +
                ", dog_gender='" + dog_gender + '\'' +
                ", dog_neutered='" + dog_neutered + '\'' +
                ", dog_vaccination='" + dog_vaccination + '\'' +
                ", dog_age=" + dog_age +
                ", dog_place='" + dog_place + '\'' +
                ", dog_size=" + dog_size +
                ", dog_weight=" + dog_weight +
                ", dog_caution='" + dog_caution + '\'' +
                ", dog_img1='" + dog_img1 + '\'' +
                ", dog_img2='" + dog_img2 + '\'' +
                ", dog_img3='" + dog_img3 + '\'' +
                ", dog_stauts='" + dog_status + '\'' +
                '}';
    }
}
