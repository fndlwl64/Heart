package com.heartpet.project;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.filechooser.FileSystemView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.heartpet.action.AdoptRegDAO;
import com.heartpet.action.AnimalDAO;
import com.heartpet.action.UserDAO;
import com.heartpet.model.AdoptRegDTO;
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
	private UserDAO userDAO;
	@Autowired
	private AdoptRegDAO adoptRegDAO;
	@Autowired
	private HttpServletRequest request;

	@RequestMapping(value = "/user_animal_content", method = RequestMethod.GET)
	public String user_dog_content(@RequestParam("no") int no, Model model) {
		model.addAttribute("dto", animalDAO.content(no));
		return "user/animal/user_animal_content";
	}

	@RequestMapping(value = "/user_dog_list", method = RequestMethod.GET)
	public String user_dog_list(Model model) {
		model.addAttribute("animalList", animalDAO.listTag("dog"));
		return "user/animal/user_animal_list";
	}

	@RequestMapping(value = "/user_animal_insert", method = RequestMethod.GET)
	public String user_dog_insert(Model model) {

		return "user/animal/user_animal_insert";
	}

	@RequestMapping(value = "/user_animal_insert", method = RequestMethod.POST)
	public String user_dog_insert_ok(@RequestParam("files") List<MultipartFile> files, AnimalDTO animalDTO,
			@RequestParam("user_id") String id) throws IllegalStateException, IOException {

		// Adoptreg 추가
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());

		AdoptRegDTO adoptRegDTO = new AdoptRegDTO();
		adoptRegDTO.setAdopt_reg_animalno(animalDAO.count()+1);
		adoptRegDTO.setAdopt_reg_userid(id);
		adoptRegDTO.setAdopt_reg_appdate(strDate);

		adoptRegDAO.insert(adoptRegDTO);

		// 동물 입소 신청
		//이미지 업로드 및 animal 데이터 추가
		FileUploadImage upload = new FileUploadImage();
		String[] images = upload.uploadAnimalImg(request, files);
		animalDTO.setAnimal_img1(images[0]);
		animalDTO.setAnimal_img2(images[1]);
		animalDTO.setAnimal_img3(images[2]);

		animalDTO.setAnimal_status("입소 신청");

		animalDAO.insert(animalDTO);

		return "redirect:/";
	}

	@RequestMapping(value = "/user_cat_list", method = RequestMethod.GET)
	public String user_cat_list(Model model) {
		model.addAttribute("animalList", animalDAO.listTag("cat"));
		return "user/animal/user_animal_list";
	}
	
}
