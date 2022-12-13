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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
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
import com.heartpet.action.QnaDAO;
import com.heartpet.model.AdoptRegDTO;
import com.heartpet.model.AnimalDTO;
import com.heartpet.model.FileUploadImage;
import com.heartpet.model.PageDTO;

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
	public String admin_dog_list(Model model) {
		model.addAttribute("dogList", animalDAO.listTag("dog"));
		return "admin/animal/dog/dog_list";
	}

	@RequestMapping("/cat_list")
	public String cat_list(Model model) {
		model.addAttribute("catList", animalDAO.listTag("cat"));
		return "admin/animal/cat/cat_list";
	}

	@RequestMapping(value = "/animal_update", method = RequestMethod.GET)
	public String animal_update(@RequestParam("no") int no, Model model) {
		model.addAttribute("content", animalDAO.content(no));
		return "admin/animal/animal_update";
	}

	@RequestMapping(value = "/animal_update", method = RequestMethod.POST)
	public String animal_update_ok(AnimalDTO animalDTO) {
		animalDAO.update(animalDTO);
		return "redirect:/admin_main";
	}

	@RequestMapping(value = "/animal_insert", method = RequestMethod.GET)
	public String animal_insert(@RequestParam("tag") String tag,Model model) {
		model.addAttribute("tag",tag);
		return "admin/animal/animal_insert";
	}

	@RequestMapping(value = "/animal_insert", method = RequestMethod.POST)
	public String animal_insert_ok(@RequestParam("files") List<MultipartFile> files, AnimalDTO animalDTO)
			throws IllegalStateException, IOException {

		// Adoptreg 추가
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());

		AdoptRegDTO adoptRegDTO = new AdoptRegDTO();
		adoptRegDTO.setAdopt_reg_animalno(animalDAO.count() + 1);
		adoptRegDTO.setAdopt_reg_userid("admin");
		adoptRegDTO.setAdopt_reg_appdate(strDate);

		adoptRegDAO.insert(adoptRegDTO);
		
		//동물 입소 신청하자마자 입양 가능 상태
		//이미지 업로드 및 animal 데이터 추가
		FileUploadImage upload = new FileUploadImage();
		String[] images = upload.uploadAnimalImg(request, files);
		animalDTO.setAnimal_img1(images[0]);
		animalDTO.setAnimal_img2(images[1]);
		animalDTO.setAnimal_img3(images[2]);

		animalDTO.setAnimal_status("입양 가능");

		animalDAO.insert(animalDTO);

		return "redirect:/admin_main";
	}

	@RequestMapping("/animal_delete")
	public String animal_delete(@RequestParam("no") int no) {
		AnimalDTO animalDTO = animalDAO.content(no);

		String rootPath = request.getSession().getServletContext().getRealPath("/resources/upload");

		File file = new File(rootPath + "/" + animalDTO.getAnimal_img1());
		file.delete();
		file = new File(rootPath + "/" + animalDTO.getAnimal_img2());
		file.delete();
		file = new File(rootPath + "/" + animalDTO.getAnimal_img3());
		file.delete();
		animalDAO.delete(no);

		return "redirect:/admin_main";
	}
	

	@RequestMapping("/cat_view")
	public String cat_view() {
		return "admin/cat_view";
	}

	@RequestMapping("/dog_view")
	public String dog_view() {
		return "admin/dog_content";
	}

	// 입양관리
	@RequestMapping("/adoptreg_list")
	public String adoptreg_list(@RequestParam(value = "startDate", required = false) String startDate, 
    		@RequestParam(value = "endDate", required = false) String endDate
    		, @RequestParam(value = "adopt_tag" , required = false) String adopt_tag 
    		, @RequestParam(value = "page", defaultValue = "1") int page,Model model) {
		//페이징
		String field = ""; 
		String keyword = "";
		if(startDate == null) {startDate="";}
		if(endDate == null) {endDate="";}
		if(adopt_tag == null) {adopt_tag="";}

		int currentPage = 1;	// 현재 페이지 변수
		if(page != 1) { currentPage = page; }
		
    	totalRecord = adoptRegDAO.countTag(startDate, endDate,adopt_tag);
    	PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);
		
//    	System.out.println("======================");
//		System.out.println(adopt_tag);
//		System.out.println(startDate);
//		System.out.println(endDate);
		// 해시맵으로 조인 유사하게 구현
		List<AnimalDTO> animalList = animalDAO.list();
		Map<Integer, ArrayList<String>> maps = new HashMap();
		for (AnimalDTO dto : animalList) {
			ArrayList<String> aList = new ArrayList();
			aList.add(dto.getAnimal_name());
			aList.add(dto.getAnimal_status());
			maps.put(dto.getAnimal_no(), aList);
		}
		
		List<AdoptRegDTO> list = adoptRegDAO.listPaging(paging.getStartNo(), paging.getEndNo(), startDate, endDate,adopt_tag);
//		System.out.println("================");
//		for(AdoptRegDTO dto : list) {
//			System.out.println(dto.toString());
//		}
	
	    model.addAttribute("total", totalRecord);
        model.addAttribute("paging", paging);		
		model.addAttribute("field", field); 
		model.addAttribute("keyword", keyword);
		model.addAttribute("tag",adopt_tag);
	
		model.addAttribute("adoptRegList", list);
		model.addAttribute("animalMap", maps);

		return "admin/adoptreg_list";
	}
	/*관리자 리스트에서 수정하기*/
    @RequestMapping(value = "/adoptreg_update", method = RequestMethod.GET)
    public String adoptreg_update(@RequestParam("adopt_reg_regno")int adopt_reg_regno, Model model) {

    	AdoptRegDTO adoptRegDTO = adoptRegDAO.content(adopt_reg_regno);
    	AnimalDTO animalDTO = animalDAO.content(adoptRegDTO.getAdopt_reg_animalno());
    	
    	model.addAttribute("content",adoptRegDTO);
    	model.addAttribute("foreign",animalDTO);
        return "admin/adoptreg_update";
    }
    
    @RequestMapping(value = "/adoptreg_update", method = RequestMethod.POST)
    public String adoptreg_update(AdoptRegDTO adoptRegDTO) {
    	
    	if(adoptRegDTO.getAdopt_reg_duedate() != null) {//입양 예정일 등록
    		String reg_duedate = adoptRegDTO.getAdopt_reg_duedate().replace("T", " ");
    		adoptRegDTO.setAdopt_reg_duedate(reg_duedate);
    		adoptRegDAO.update(adoptRegDTO);
    	}
    	else if(adoptRegDTO.getAdopt_reg_adoptdate() != null) {//입양 완료일 등록
    		String reg_adoptdate = adoptRegDTO.getAdopt_reg_adoptdate().replace("T", " ");
    		adoptRegDTO.setAdopt_reg_adoptdate(reg_adoptdate);
    		adoptRegDAO.update(adoptRegDTO);
    		
    		AnimalDTO animalDTO = new AnimalDTO();
    		animalDTO.setAnimal_status("입양 완료");
    		animalDTO.setAnimal_no(adoptRegDTO.getAdopt_reg_animalno());
    		animalDAO.updateStatus(animalDTO);
    	}
    	return "redirect:/adoptreg_list";
    }
    
    @RequestMapping("/adoptreg_admission")
    public String adoptreg_admission(@RequestParam("animal_no") int animal_no) {
    	AnimalDTO animalDTO = new AnimalDTO();
    	animalDTO.setAnimal_no(animal_no);
    	animalDTO.setAnimal_status("입양 가능");
    	animalDAO.updateStatus(animalDTO);
    	return "redirect:/adoptreg_list";
    }
}
