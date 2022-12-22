package com.heartpet.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.swing.filechooser.FileSystemView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.heartpet.action.AdoptRegDAO;
import com.heartpet.action.AnimalDAO;
import com.heartpet.action.QnaDAO;
import com.heartpet.model.AdoptRegDTO;
import com.heartpet.model.AnimalDTO;
import com.heartpet.model.PageDTO;
import com.heartpet.util.FileUploadImage;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Transactional
@Controller
public class AdminAnimalController {
	@Autowired
	private AnimalDAO animalDAO;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private AdoptRegDAO adoptRegDAO;

	// 한 페이지당 보여질 게시물의 수
	private final int rowsize = 3;
	// 전체 게시물의 수
	private int totalRecord = 0;

	// ADMIN
	@RequestMapping("/dog_list")
	public String admin_dog_list(@RequestParam(value = "page", defaultValue = "1") int page, Model model,
			AnimalDTO animalDTO, @RequestParam(value = "sort", required = false) String sort) {
		// 강아지, 삭제 포함
		animalDTO.setAnimal_tag("dog");
		animalDTO.setAnimal_state(0);

		// 페이징
		String field = "";
		String keyword = "";

		int currentPage = 1; // 현재 페이지 변수
		if (page != 1) {
			currentPage = page;
		}

		totalRecord = animalDAO.countPaging(animalDTO, keyword);
		PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);

		model.addAttribute("total", totalRecord);
		model.addAttribute("paging", paging);
		model.addAttribute("sort",sort);
		model.addAttribute("animalList", animalDAO.listPaging(paging.getStartNo(), paging.getEndNo(), animalDTO, keyword,sort));
		model.addAttribute("animalDTO", animalDTO);

		return "admin/animal/animal_list";
	}

// @RequestParam(value = "adopt_tag" , required = false) String adopt_tag 
	@RequestMapping("/cat_list")
	public String cat_list(@RequestParam(value = "page", defaultValue = "1") int page, Model model,
			AnimalDTO animalDTO, @RequestParam(value = "sort", required = false) String sort) {
		// 고양이, 삭제 포함
		animalDTO.setAnimal_tag("cat");
		animalDTO.setAnimal_state(0);

		// 페이징
		String field = "";
		String keyword = "";

		int currentPage = 1; // 현재 페이지 변수
		if (page != 1) {
			currentPage = page;
		}

		totalRecord = animalDAO.countPaging(animalDTO, keyword);
		PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);

		model.addAttribute("total", totalRecord);
		model.addAttribute("paging", paging);
		model.addAttribute("sort",sort);
		model.addAttribute("animalList", animalDAO.listPaging(paging.getStartNo(), paging.getEndNo(), animalDTO, keyword,sort));
		model.addAttribute("animalDTO", animalDTO);

		return "admin/animal/animal_list";
	}

	@RequestMapping(value = "/animal_update", method = RequestMethod.GET)
	public String animal_update(@RequestParam("no") int no, Model model) {
		model.addAttribute("content", animalDAO.content(no));
		return "admin/animal/animal_update";
	}

	@RequestMapping(value = "/animal_update", method = RequestMethod.POST)
	public String animal_update_ok(@RequestParam("files") List<MultipartFile> files, AnimalDTO animalDTO) {
		
		FileUploadImage upload = new FileUploadImage();
		animalDTO = upload.uploadAnimalImg(request, files, "animal", animalDTO);
		animalDAO.update(animalDTO);
		return "redirect:/admin_main";
	}

	@RequestMapping(value = "/animal_insert", method = RequestMethod.GET)
	public String animal_insert(@RequestParam("tag") String tag, Model model) {
		model.addAttribute("tag", tag);
		System.out.println("===========================");
		System.out.println("===========================");
		System.out.println("===========================");
		
		System.out.println(tag);
		return "admin/animal/animal_insert";
	}

	@RequestMapping(value = "/animal_insert", method = RequestMethod.POST)
	public String animal_insert_ok(@RequestParam("files") List<MultipartFile> files, AnimalDTO animalDTO)
			throws IllegalStateException, IOException {

		// Adoptreg 추가
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());

		AdoptRegDTO adoptRegDTO = new AdoptRegDTO();
		adoptRegDTO.setAdopt_reg_animalno(animalDAO.count(null) + 1);
		adoptRegDTO.setAdopt_reg_userid("admin");
		adoptRegDTO.setAdopt_reg_appdate(strDate);

		adoptRegDAO.insert(adoptRegDTO);

		// 동물 입소 신청하자마자 입양 가능 상태
		// 이미지 업로드 및 animal 데이터 추가
		FileUploadImage upload = new FileUploadImage();

		String[] images = upload.uploadAnimalImg(request, files,"animal");
		animalDTO.setAnimal_img1(images[0]);
		animalDTO.setAnimal_img2(images[1]);
		animalDTO.setAnimal_img3(images[2]);

		animalDTO.setAnimal_status("입양 가능");

		animalDAO.insert(animalDTO);

		return "redirect:/admin_main";
	}

	@RequestMapping("/animal_delete")
	public String animal_delete(@RequestParam("no") int no, @RequestParam("animal_tag") String animal_tag) {
		AnimalDTO animalDTO = animalDAO.content(no);
		FileUploadImage upload = new FileUploadImage();
		upload.deleteAnimalImg(request, animalDTO);

		animalDAO.delete(no);

		return "redirect:/"+animal_tag+"_list";
	}
	
	@RequestMapping(value="/animal_content",method = RequestMethod.GET)
	public String animal_contet(@RequestParam("no") int no,Model model) {
		model.addAttribute("content",animalDAO.content(no));
		return "admin/animal/animal_content";
	}


	// 입양관리
	@RequestMapping("/adoptreg_list")
	public String adoptreg_list(@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate,
			@RequestParam(value = "adopt_tag", required = false) String adopt_tag,
			@RequestParam(value = "page", defaultValue = "1") int page, Model model,
			@RequestParam(value = "animal_status", required = false) String animal_status,
			@RequestParam(value = "sort",required = false) String sort) {
		// 페이징
		String field = "";
		String keyword = "";
//		if (startDate == null) {
//			startDate = "";
//		}
//		if (endDate == null) {
//			endDate = "";
//		}
//		if (adopt_tag == null) {
//			adopt_tag = "";
//		}

		int currentPage = 1; // 현재 페이지 변수
		if (page != 1) {
			currentPage = page;
		}
		//animal_status 조건으로 검색하기 위해 필요한 데이터(adopt_reg_animalno)
		List<Integer> status_no = null;
		if(animal_status != null && !animal_status.equals("")) {
			status_no = animalDAO.joinStatus(animal_status);
			if(status_no.size() == 0) {
				status_no = null;
			}
		}
		// 페이지
		totalRecord = adoptRegDAO.countTag(startDate, endDate, adopt_tag, status_no);
		PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);

		// 해시맵으로 조인 유사하게 구현
		List<AnimalDTO> animalList = animalDAO.list();
		Map<Integer, ArrayList<String>> maps = new HashMap();
		for (AnimalDTO dto : animalList) {
			ArrayList<String> aList = new ArrayList();
			aList.add(dto.getAnimal_name());
			aList.add(dto.getAnimal_status());
			maps.put(dto.getAnimal_no(), aList);
		}

		List<AdoptRegDTO> list = adoptRegDAO.listPaging(paging.getStartNo(), paging.getEndNo(), startDate, endDate,adopt_tag,
				status_no,sort);
//		

		model.addAttribute("total", totalRecord);
		model.addAttribute("paging", paging);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("tag", adopt_tag);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("animal_status",animal_status);
		model.addAttribute("sort",sort);

		model.addAttribute("adoptRegList", list);
		model.addAttribute("animalMap", maps);

		return "admin/adoptreg/adoptreg_list";
	}

	/* 관리자 리스트에서 수정하기 */
	@RequestMapping(value = "/adoptreg_update", method = RequestMethod.GET)
	public String adoptreg_update(@RequestParam("adopt_reg_regno") int adopt_reg_regno, Model model) {

		AdoptRegDTO adoptRegDTO = adoptRegDAO.content(adopt_reg_regno);
		AnimalDTO animalDTO = animalDAO.content(adoptRegDTO.getAdopt_reg_animalno());

		model.addAttribute("content", adoptRegDTO);
		model.addAttribute("foreign", animalDTO);
		return "admin/adoptreg/adoptreg_update";
	}

	@RequestMapping(value = "/adoptreg_update", method = RequestMethod.POST)
	public String adoptreg_update(AdoptRegDTO adoptRegDTO) {
		if (adoptRegDTO.getAdopt_reg_duedate() != null) {// 입양 예정일 등록
			String reg_duedate = adoptRegDTO.getAdopt_reg_duedate().replace("T", " ");
			adoptRegDTO.setAdopt_reg_duedate(reg_duedate);
			adoptRegDAO.update(adoptRegDTO);
		}
		if (adoptRegDTO.getAdopt_reg_adoptdate() != null) {// 입양 완료일 등록
			adoptRegDTO.setAdopt_reg_duedate(null);
			String reg_adoptdate = adoptRegDTO.getAdopt_reg_adoptdate().replace("T", " ");
			adoptRegDTO.setAdopt_reg_adoptdate(reg_adoptdate);
			System.out.println("============================");
			System.out.println(reg_adoptdate);
			
			AnimalDTO animalDTO = new AnimalDTO();
			animalDTO.setAnimal_status("입양 완료");
			animalDTO.setAnimal_no(adoptRegDTO.getAdopt_reg_animalno());
			animalDAO.updateStatus(animalDTO);
			adoptRegDAO.update(adoptRegDTO);
		}
		return "redirect:/adoptreg_list";
	}

	@RequestMapping("/adoptreg_admission")
	public String adoptreg_admission(@RequestParam("animal_no") int animal_no, @RequestParam("animal_status") String animal_status) {
		AnimalDTO animalDTO = new AnimalDTO();
		animalDTO.setAnimal_no(animal_no);
		AdoptRegDTO adoptRegDTO = new AdoptRegDTO();
		//현재 시간
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());
		
		//수정
		if(animal_status.equals("입소 신청")) {
			animalDTO.setAnimal_status("입양 가능");
		}else if(animal_status.equals("입양 가능")) {
			animalDTO.setAnimal_status("입소 신청");
		}else if(animal_status.equals("입양 완료")) {
			animalDTO.setAnimal_status("입양 대기");
			adoptRegDTO.setAdopt_reg_animalno(animal_no);
			adoptRegDTO.setAdopt_reg_adoptdate("");
			adoptRegDAO.update(adoptRegDTO);
		}
		animalDAO.updateStatus(animalDTO);
		return "redirect:/adoptreg_list";
	}
	
	@RequestMapping("/csstest")
	public String test() {
		return "user/animal/csstest";
	}
}
