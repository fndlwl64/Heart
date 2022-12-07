package com.heartpet.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.swing.filechooser.FileSystemView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.heartpet.action.AnimalDAO;
import com.heartpet.model.AnimalDTO;
import com.heartpet.model.FileUploadImage;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Controller
public class AdminAnimalController {

	@Autowired
	private AnimalDAO animalDAO;
	@Autowired
	private HttpServletRequest request;

	// ADMIN
	@RequestMapping("/admin_dog_list")
	public String admin_dog_list(Model model) {
		model.addAttribute("dogList", animalDAO.listTag("dog"));
		return "admin/animal/dog/admin_dog_list";
	}

	@RequestMapping("/cat_list")
	public String cat_list() {
		return "admin/cat_list";
	}

	@RequestMapping("/pet_update")
	public String pet_update() {
		return "admin/pet_update";
	}

	@RequestMapping("/pet_insert")
	public String pet_insert() {
		return "admin/animal/pet_insert";
	}
	
	@RequestMapping("/cat_view")
    public String cat_view() {
        return "admin/cat_view";
    }
    @RequestMapping("/dog_view")
    public String dog_view() {
        return "admin/dog_view";
    }
}
