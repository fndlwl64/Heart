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
	@RequestMapping("/dog_list")
	public String admin_dog_list(Model model) {
		model.addAttribute("dogList", animalDAO.listTag("dog"));
		return "admin/animal/dog/dog_list";
	}

	@RequestMapping("/cat_list")
	public String cat_list() {
		return "admin/cat_list";
	}

	@RequestMapping(value = "/dog_update", method = RequestMethod.GET)
	public String pet_update(@RequestParam("no") int no,Model model) {
		model.addAttribute("content",animalDAO.content(no));
		return "admin/animal/dog/dog_update";
	}
	@RequestMapping(value = "/dog_update", method = RequestMethod.POST)
	public String pet_update_ok(AnimalDTO animalDTO) {
		animalDAO.update(animalDTO);
		return "redirect:/dog_list";
	}

	@RequestMapping(value = "/dog_insert", method = RequestMethod.GET)
	public String animal_insert() {
		return "admin/animal/dog/dog_insert";
	}
	@RequestMapping(value = "/dog_insert", method = RequestMethod.POST)
	public String user_dog_insert_ok(@RequestParam("files") List<MultipartFile> files, AnimalDTO animalDTO)
			throws IllegalStateException, IOException {
		System.out.println(animalDTO.toString());
		FileUploadImage upload = new FileUploadImage();
		String[] images = upload.uploadAnimalImg(request, files);
		animalDTO.setAnimal_img1(images[0]);
		animalDTO.setAnimal_img2(images[1]);
		animalDTO.setAnimal_img3(images[2]);
		
		animalDTO.setAnimal_status("입양 대기");
		
		animalDAO.insert(animalDTO);

		return "redirect:/dog_list";
	}
	
	@RequestMapping("/dog_delete")
	public String dog_delete(@RequestParam("no") int no) {
		animalDAO.delete(no);
		return "redirect:/dog_list";
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
