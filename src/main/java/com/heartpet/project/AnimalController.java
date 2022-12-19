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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.heartpet.action.AdoptRegDAO;
import com.heartpet.action.AnimalDAO;
import com.heartpet.action.UserDAO;
import com.heartpet.action.WishDAO;
import com.heartpet.model.AdoptRegDTO;
import com.heartpet.model.AnimalDTO;
import com.heartpet.model.PageDTO;
import com.heartpet.model.WishDTO;
import com.heartpet.util.FileUploadImage;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Transactional
@Controller
public class AnimalController {

	@Autowired
	private AnimalDAO animalDAO;
	@Autowired
	private AdoptRegDAO adoptRegDAO;
	@Autowired
	private WishDAO wishDAO;
	@Autowired
	private HttpServletRequest request;
	

	// 한 페이지당 보여질 게시물의 수
    private final int rowsize = 3;
    // 전체 게시물의 수
    private int totalRecord = 0;

    @RequestMapping(value = "/user_dog_list")
	public String user_dog_list( @RequestParam(value = "page", defaultValue = "1") int page, Model model
    		, AnimalDTO animalDTO, @RequestParam(value = "keyword" , required = false) String keyword
    		,@RequestParam(value="sort" , required = false) String sort) {
    	//강아지 , 삭제되지 않은 데이터
    	animalDTO.setAnimal_tag("dog");
    	animalDTO.setAnimal_state(1);
    	System.out.println(animalDTO.getAnimal_status());
		//페이징
		String field = ""; 
		
		int currentPage = 1;	// 현재 페이지 변수
		if(page != 1) { currentPage = page; }

		totalRecord = animalDAO.countPaging(animalDTO, keyword);
		
    	PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);
		
    	model.addAttribute("total", totalRecord);
        model.addAttribute("paging", paging);		
 		model.addAttribute("field", field);
 		model.addAttribute("sort",sort);
		model.addAttribute("animalList", animalDAO.listPaging(paging.getStartNo(), paging.getEndNo(),animalDTO,keyword,sort));
		model.addAttribute("animalDTO",animalDTO);
		return "user/animal/user_animal_list";
	}

	@RequestMapping(value = "/user_cat_list")
	public String user_cat_list(@RequestParam(value = "page", defaultValue = "1") int page, Model model
    		, AnimalDTO animalDTO, @RequestParam(value = "keyword" , required = false) String keyword, @RequestParam(value = "sort", required = false) String sort) {
		//고양이 , 삭제되지 않은 데이터
    	animalDTO.setAnimal_tag("cat");
    	animalDTO.setAnimal_state(1);
    	
		//페이징
		String field = ""; 
		
		int currentPage = 1;	// 현재 페이지 변수
		if(page != 1) { currentPage = page; }

		totalRecord = animalDAO.countPaging(animalDTO, keyword);
		
    	PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);
		
    	model.addAttribute("total", totalRecord);
        model.addAttribute("paging", paging);		
 		model.addAttribute("field", field);
 		model.addAttribute("sort",sort);
		model.addAttribute("animalList", animalDAO.listPaging(paging.getStartNo(), paging.getEndNo(),animalDTO,keyword,sort));
		model.addAttribute("animalDTO",animalDTO);

		return "user/animal/user_animal_list";
	}

	@RequestMapping(value = "/user_animal_content", method = RequestMethod.GET)
	public String user_dog_content(@RequestParam("no") int no, Model model) {
		AnimalDTO animalDTO = animalDAO.content(no);
		model.addAttribute("dto", animalDTO);
		WishDTO wishDTO = new WishDTO();
		wishDTO.setWish_petno(animalDTO.getAnimal_no());
		wishDTO.setWish_userid((String)request.getSession().getAttribute("session_id"));
		model.addAttribute("wishCheck",wishDAO.check(wishDTO) );
		return "user/animal/user_animal_content";
	}

	// 입양 신청
	@RequestMapping("user_get_animal")
	public String user_get_animal(@RequestParam("animal_no") int animal_no) {
		// animal_status update
		AnimalDTO animalDTO = new AnimalDTO();
		animalDTO.setAnimal_no(animal_no);
		animalDTO.setAnimal_status("입양 대기");
		animalDAO.updateStatus(animalDTO);
		
		// Adoptreg 추가
		// user id 변경
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());
		AdoptRegDTO adoptRegDTO = new AdoptRegDTO();
		adoptRegDTO.setAdopt_reg_userid(request.getSession().getAttribute("session_id").toString());
		adoptRegDTO.setAdopt_reg_animalno(animal_no);
		adoptRegDTO.setAdopt_reg_regdate(strDate);
		adoptRegDAO.update(adoptRegDTO);
	
		return "redirect:/";
	}

	// 입소 신청
	@RequestMapping(value = "/user_animal_insert", method = RequestMethod.GET)
	public String user_animal_insert(Model model) {
		return "user/animal/user_animal_insert";
	}

	@RequestMapping(value = "/user_animal_insert", method = RequestMethod.POST)
	public String user_animal_insert_ok(@RequestParam("files") List<MultipartFile> files, AnimalDTO animalDTO,
			@RequestParam("user_id") String id) throws IllegalStateException, IOException {

		// Adoptreg 추가
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());

		AdoptRegDTO adoptRegDTO = new AdoptRegDTO();
		adoptRegDTO.setAdopt_reg_animalno(animalDAO.count(null) + 1);
		adoptRegDTO.setAdopt_reg_userid(id);
		adoptRegDTO.setAdopt_reg_appdate(strDate);

		adoptRegDAO.insert(adoptRegDTO);

		// 동물 입소 신청
		// 이미지 업로드 및 animal 데이터 추가
		FileUploadImage upload = new FileUploadImage();
		String[] images = upload.uploadAnimalImg(request, files,"animal");
		animalDTO.setAnimal_img1(images[0]);
		animalDTO.setAnimal_img2(images[1]);
		animalDTO.setAnimal_img3(images[2]);

		animalDTO.setAnimal_status("입소 신청");

		animalDAO.insert(animalDTO);

		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping("/wish")
	public int wish(@RequestBody WishDTO wishDTO) {
		System.out.println(wishDTO.getWish_petno());
		System.out.println(wishDTO.getWish_userid());
		int check = wishDAO.check(wishDTO);
		if(check > 0) {
			wishDAO.delete(wishDTO);
			return 0;
		}else {
			wishDAO.insert(wishDTO);
			return 1;
		}
	}
	
	@RequestMapping("/testtag")
	public String test() {
		String tag = "dog";
		List<AnimalDTO> list =  animalDAO.listTag(tag);
		for(AnimalDTO dto : list) {
			System.out.println(dto.toString());
		}
		return "redirect:/";
	}

}
