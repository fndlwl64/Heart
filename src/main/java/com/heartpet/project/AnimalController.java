package com.heartpet.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.heartpet.action.AnimalDAO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Controller
public class AnimalController {
    
	@Autowired
    private AnimalDAO animalDAO;

    @RequestMapping("/jsptest")
    public String jsptest(Model model){
        model.addAttribute("list",animalDAO.list());

        return "jsptest";
    }
    
    @RequestMapping("/user_dog_list")
    public String dog_list() { return "animal/dog/user_dog_list"; }

    @RequestMapping("/user_dog_content")
    public String dog_content() { return "animal/dog/user_dog_content"; }

    @RequestMapping ("/user_animal_insert")
    public String dog_insert() { return "animal/user_animal_insert"; }


    
}
