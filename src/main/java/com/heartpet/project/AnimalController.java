package com.heartpet.project;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.heartpet.action.AnimalDAO;
import com.heartpet.model.FileUploadImage;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Controller
public class AnimalController {

	@Autowired
	private AnimalDAO animalDAO;

	@RequestMapping("/jsptest")
	public String jsptest(Model model) {
		model.addAttribute("list", animalDAO.list());

		return "jsptest";
	}

	@RequestMapping("/user_dog_list")
	public String dog_list() {
		return "animal/dog/user_dog_list";
	}

	@RequestMapping("/user_dog_content")
	public String dog_content() {
		return "animal/dog/user_dog_content";
	}

	@RequestMapping(value = "/user_animal_insert", method = RequestMethod.GET)
	public String dog_insert() {
		return "animal/user_animal_insert";
	}

	@RequestMapping(value = "/user_animal_insert", method = RequestMethod.POST)
	public String dog_insert_ok(@RequestParam("files") List<MultipartFile> files, HttpServletRequest request)
			throws IllegalStateException, IOException {

		FileUploadImage upload = new FileUploadImage();
		upload.upload(request, files);

		return "redirect:/";
	}

}
