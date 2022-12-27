package com.heartpet.admin;

import java.io.File;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
import com.heartpet.action.UserDAO;
import com.heartpet.action.service.AnimalService;
import com.heartpet.model.AdoptRegDTO;
import com.heartpet.model.AnimalDTO;
import com.heartpet.model.PageDTO;
import com.heartpet.model.UserDTO;
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
	@Autowired
	private UserDAO userdao;
	@Autowired
	private AnimalService animalService;

	// 한 페이지당 보여질 게시물의 수
	private final int rowsize = 10;
	// 전체 게시물의 수
	private int totalRecord = 0;

	// ADMIN
	@RequestMapping("/dog_list")
	public String admin_dog_list(@RequestParam(value = "page", defaultValue = "1") int page, Model model,
			AnimalDTO animalDTO, @RequestParam(value = "sort", required = false) String sort) {
		// 강아지, 삭제 포함
		animalDTO.setAnimal_tag("dog");
		// 페이징
		String field = "";
		String keyword = "";

		int currentPage = 1; // 현재 페이지 변수
		if (page != 1) {
			currentPage = page;
		}


    	int startWeight = 0 ;
    	int endWeight = 0 ;
    	
    	//무게
    	if(animalDTO.getAnimal_size() != null && animalDTO.getAnimal_size().equals("소형")) {
    		startWeight = 1;
    		endWeight = 4;
    	}else if(animalDTO.getAnimal_size() != null && animalDTO.getAnimal_size().equals("중형")) {
    		startWeight = 4;
    		endWeight = 10;
    	}else if(animalDTO.getAnimal_size() != null && animalDTO.getAnimal_size().equals("대형")) {
    		startWeight = 10;
    		endWeight = 40;
    	}

		
		
		totalRecord = animalDAO.countPaging(animalDTO, keyword,startWeight,endWeight);
		PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);

		model.addAttribute("total", totalRecord);
		model.addAttribute("paging", paging);
		model.addAttribute("sort",sort);
		model.addAttribute("animalList", animalDAO.listPaging(paging.getStartNo(), paging.getEndNo(), animalDTO, keyword,sort,startWeight,endWeight));
		model.addAttribute("animalDTO", animalDTO);

		return "admin/animal/animal_list";
	}

// @RequestParam(value = "adopt_tag" , required = false) String adopt_tag 
	@RequestMapping("/cat_list")
	public String cat_list(@RequestParam(value = "page", defaultValue = "1") int page, Model model,
			AnimalDTO animalDTO, @RequestParam(value = "sort", required = false) String sort) {
		// 고양이, 삭제 포함
		animalDTO.setAnimal_tag("cat");

		// 페이징
		String field = "";
		String keyword = "";

		int currentPage = 1; // 현재 페이지 변수
		if (page != 1) {
			currentPage = page;
		}

    	int startWeight = 0 ;
    	int endWeight = 0 ;
    	
    	//무게
    	if(animalDTO.getAnimal_size() != null && animalDTO.getAnimal_size().equals("소형")) {
    		startWeight = 1;
    		endWeight = 4;
    	}else if(animalDTO.getAnimal_size() != null && animalDTO.getAnimal_size().equals("중형")) {
    		startWeight = 4;
    		endWeight = 10;
    	}else if(animalDTO.getAnimal_size() != null && animalDTO.getAnimal_size().equals("대형")) {
    		startWeight = 10;
    		endWeight = 40;
    	}

		
		
		totalRecord = animalDAO.countPaging(animalDTO, keyword,startWeight,endWeight);
		PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);

		model.addAttribute("total", totalRecord);
		model.addAttribute("paging", paging);
		model.addAttribute("sort",sort);
		model.addAttribute("animalList", animalDAO.listPaging(paging.getStartNo(), paging.getEndNo(), animalDTO, keyword,sort,startWeight,endWeight));
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
		System.out.println(files.size());
		List<String> originImgs = new ArrayList<String>();
		originImgs.add(animalDTO.getAnimal_img1());
		originImgs.add(animalDTO.getAnimal_img2());
		originImgs.add(animalDTO.getAnimal_img3());
		
		
		FileUploadImage upload = new FileUploadImage();
		//animalDTO = upload.uploadAnimalImg(request, files, "animal", animalDTO);
		
		try {
			List<String> newImgs = upload.updateFile(request, files, "animal", originImgs, 3);
			animalDTO.setAnimal_img1(newImgs.get(0));
			animalDTO.setAnimal_img2(newImgs.get(1));
			animalDTO.setAnimal_img3(newImgs.get(2));
			
			animalDAO.update(animalDTO);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "업데이트를 실패했습니다.");
			request.setAttribute("url", "back");
			return "alert";
		}
		String animal_tag = animalDTO.getAnimal_tag();
		return "redirect:/"+animal_tag+"_list";
	}

	@RequestMapping(value = "/animal_insert", method = RequestMethod.GET)
	public String animal_insert(@RequestParam("tag") String tag, Model model) {
		model.addAttribute("tag", tag);
		return "admin/animal/animal_insert";
	}

	@RequestMapping(value = "/animal_insert", method = RequestMethod.POST)
	public String animal_insert_ok(@RequestParam("files") List<MultipartFile> files, AnimalDTO animalDTO)
			throws IllegalStateException, IOException {

		// Adoptreg 추가
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());

		AdoptRegDTO adoptRegDTO = new AdoptRegDTO();
		adoptRegDTO.setAdopt_reg_animalno(animalDAO.count(null) + 1);
		adoptRegDTO.setAdopt_reg_userid("admin");
		adoptRegDTO.setAdopt_reg_appdate(strDate);

		

		// 동물 입소 신청하자마자 입양 가능 상태
		// 이미지 업로드 및 animal 데이터 추가
		FileUploadImage upload = new FileUploadImage();
		List<String> animalImgs =  upload.uploadFile(request, files, "animal", 3);
		
		animalDTO.setAnimal_img1(animalImgs.get(0));
		animalDTO.setAnimal_img2(animalImgs.get(1));
		animalDTO.setAnimal_img3(animalImgs.get(2));
		
		animalDTO.setAnimal_status("입양 가능");
		
		try {
			animalService.insert(animalDTO, adoptRegDTO);
		} catch (Exception e) {
			e.printStackTrace();
			upload.deleteFile(request, animalImgs);
			request.setAttribute("msg", "insert fail");
			request.setAttribute("url", "back");
			return "alert";
		}

		return "admin/admin_main";
	}

	@RequestMapping("/animal_delete")
	public String animal_delete(@RequestParam("no") int no, @RequestParam("animal_tag") String animal_tag) {
		AnimalDTO animalDTO = animalDAO.content(no);
		FileUploadImage upload = new FileUploadImage();
		try {
			upload.deleteAnimalImg(request, animalDTO);
			animalDAO.delete(no);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "delete fail");
			request.setAttribute("url", "back");
			return "alert";
		}
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

		int currentPage = 1; // 현재 페이지 변수
		if (page != 1) {
			currentPage = page;
		}
		//animal_status 조건으로 검색하기 위해 필요한 데이터(adopt_reg_animalno)
		List<Integer> status_no = null;
		if(animal_status != null && !animal_status.equals("")) {
			status_no = animalDAO.joinStatus(animal_status);
			if(status_no.size() == 0) {//조건을 만족하는 데이터가 없을 경우
				status_no.add(-1);
			}
		}
		// 페이지
		totalRecord = adoptRegDAO.countTag(startDate, endDate, adopt_tag, status_no);
		PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);

		// 해시맵으로 조인 유사하게 구현
		List<AnimalDTO> animalList = animalDAO.list();
		Map<Integer, ArrayList<Object>> maps = new HashMap();
		for (AnimalDTO dto : animalList) {
			ArrayList<Object> aList = new ArrayList();
			aList.add(dto.getAnimal_name());
			aList.add(dto.getAnimal_status());
			aList.add(dto.getAnimal_state());
			maps.put(dto.getAnimal_no(), aList);
		}

		List<AdoptRegDTO> list = adoptRegDAO.listPaging(paging.getStartNo(), paging.getEndNo(), startDate, endDate,adopt_tag,
				status_no,sort);	

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
		animalService.adoptRegUpdate(adoptRegDTO);
		return "redirect:/adoptreg_list";
	}

	@RequestMapping("/adoptreg_admission")
	public String adoptreg_admission(@RequestParam("animal_no") int animal_no, @RequestParam("animal_status") String animal_status) {
		AnimalDTO animalDTO = new AnimalDTO();
		animalDTO.setAnimal_no(animal_no);
		AdoptRegDTO adoptRegDTO = null;
		//현재 시간
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());
		
		//수정
		if(animal_status.equals("입소 신청")) {
			animalDTO.setAnimal_status("입양 가능");
		}else if(animal_status.equals("입양 가능")) {
			animalDTO.setAnimal_status("입소 신청");
		}else if(animal_status.equals("입양 완료")) {
			animalDTO.setAnimal_status("입양 대기");
			adoptRegDTO = new AdoptRegDTO();
			adoptRegDTO.setAdopt_reg_animalno(animal_no);
			adoptRegDTO.setAdopt_reg_adoptdate("");
			
		}
//		adoptRegDAO.update(adoptRegDTO);
//		animalDAO.updateStatus(animalDTO);
		try {
			animalService.update(animalDTO, adoptRegDTO);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "update fail");
			request.setAttribute("url", "back");
			return "alert";
		}
		return "redirect:/adoptreg_list";
	}
	
	@RequestMapping("/adoptreg_cancel")
	public String adoptreg_cancel(@RequestParam("animal_no") int animal_no,@RequestParam("adopt_reg_regno") int adopt_reg_regno,
			@RequestParam("user_id") String user_id, HttpServletRequest request) {
		AnimalDTO animalDTO = new AnimalDTO();
		animalDTO.setAnimal_no(animal_no);
		animalDTO.setAnimal_status("입양 가능");
		try {
			animalService.adoptRegCancel(animalDTO, adopt_reg_regno);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "cancel fail");
			request.setAttribute("url", "back");
			return "alert";
		}
		
		UserDTO userinfo = userdao.getUserInfo(user_id);
		
		String receiver = userinfo.getUser_email();
		
		Properties props = System.getProperties();
        props.put("mail.smtp.user", "soopwe12@gmail.com"); // 서버 아이디만 쓰기
		props.put("mail.smtp.host", "smtp.gmail.com"); // 구글 SMTP
		props.put("mail.smtp.port", "587"); //465
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.debug", "true");
		props.put("mail.smtp.socketFactory.port", "587"); //465
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		Authenticator auth = new MyAuthentication();

		//session 생성 및  MimeMessage생성
        Session session = Session.getDefaultInstance(props, auth);
        MimeMessage msg = new MimeMessage(session);
        
        try{
            //편지보낸시간
            msg.setSentDate(new Date());           
            InternetAddress from = new InternetAddress();             
            // 이메일 발신자
            msg.setFrom(from);           
            // 이메일 수신자
            InternetAddress to = new InternetAddress(receiver);         
            msg.setRecipient(Message.RecipientType.TO, to);
            // 이메일 제목
            msg.setSubject("HeartPet 입양신청이 취소되었습니다.", "UTF-8");
            // 이메일 내용 
            msg.setText("HeartPet 입양신청이 취소되었습니다. 자세한 사항은 문의하기로 문의 부탁드립니다.", "UTF-8");
            // 이메일 헤더 
            msg.setHeader("content-Type", "text/html");
            //메일보내기
            javax.mail.Transport.send(msg);
	        }catch (AddressException addr_e) {
	            addr_e.printStackTrace();
	        }catch (MessagingException msg_e) {
	            msg_e.printStackTrace();
	        }
		
		return "redirect:/adoptreg_list";
	}
	
	
	class MyAuthentication extends Authenticator {
	    PasswordAuthentication pa;
	    public MyAuthentication(){   
	        String aa = "soopwe12@gmail.com";
	        String zz = "lgezfcfzoabqkbrg";

	        pa = new PasswordAuthentication(aa, zz);
	}
	    	// 시스템에서 사용하는 인증정보
		    public PasswordAuthentication getPasswordAuthentication() {
		        return pa;
		    }
	}
}
