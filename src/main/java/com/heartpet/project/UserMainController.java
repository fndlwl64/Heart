package com.heartpet.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.heartpet.action.AnimalDAO;
import com.heartpet.action.ReviewDAO;
import com.heartpet.model.AnimalDTO;
import com.heartpet.model.ReviewDTO;

@Controller
public class UserMainController {

    @Autowired
    private ReviewDAO reviewDAO;

    @Autowired
    private AnimalDAO animalDAO;
    

    @RequestMapping("/main")
    public String main(Model model) {             
       
        List<AnimalDTO> dogList = this.animalDAO.mainAnimal("dog");
        List<AnimalDTO> catList = this.animalDAO.mainAnimal("cat");
        List<ReviewDTO> dogReviewList = this.reviewDAO.mainReview("dog"); 
        List<ReviewDTO> catReviewList = this.reviewDAO.mainReview("cat");

        model.addAttribute("dogList", dogList);
        model.addAttribute("catList", catList);

        model.addAttribute("dogReviewList", dogReviewList);
        model.addAttribute("catReviewList", catReviewList);

        return "main";
    }
    

}
