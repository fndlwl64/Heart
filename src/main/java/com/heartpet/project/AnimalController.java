package com.heartpet.project;

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
public class AnimalController {

	@Autowired
	private AnimalDAO animalDAO;
	@Autowired
	private HttpServletRequest request;
	//USER

	@RequestMapping(value = "/user_dog_list" , method = RequestMethod.GET)
	public String user_dog_list(Model model) {
		model.addAttribute("dogList", animalDAO.listTag("dog"));
		return "user/animal/dog/user_dog_list";
	}

	@RequestMapping(value = "/user_dog_content", method = RequestMethod.GET)
	public String user_dog_content(@RequestParam("no") int no, Model model) {
		model.addAttribute("dto", animalDAO.content(no));
		return "user/animal/dog/user_dog_content";
	}

	@RequestMapping(value = "/user_animal_insert", method = RequestMethod.GET)
	public String user_dog_insert() {
		return "user/animal/user_animal_insert";
	}

	@RequestMapping(value = "/user_animal_insert", method = RequestMethod.POST)
	public String user_dog_insert_ok(@RequestParam("files") List<MultipartFile> files, AnimalDTO animalDTO)
			throws IllegalStateException, IOException {
		System.out.println(animalDTO.toString());
		FileUploadImage upload = new FileUploadImage();
		String[] images = upload.uploadAnimalImg(request, files);
		animalDTO.setAnimal_img1(images[0]);
		animalDTO.setAnimal_img2(images[1]);
		animalDTO.setAnimal_img3(images[2]);
		
		animalDTO.setAnimal_status("입양 신청");
		
		animalDAO.insert(animalDTO);

		return "redirect:/";
	}
	
	@RequestMapping("/pathtest")
	public String pathtest() {
		System.out.println("===============================");
		System.out.println(FileSystemView.getFileSystemView().getDefaultDirectory().getPath());
		System.out.println(FileSystemView.getFileSystemView().getRoots().toString());
		return "redirect:/";
	}
	
}
