package com.heartpet.admin;

import java.io.File;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
import javax.servlet.http.HttpServletResponse;
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

	// ??? ???????????? ????????? ???????????? ???
	private final int rowsize = 10;
	// ?????? ???????????? ???
	private int totalRecord = 0;

	// ADMIN
	@RequestMapping("/dog_list")
	public String admin_dog_list(@RequestParam(value = "page", defaultValue = "1") int page, Model model,
			AnimalDTO animalDTO, @RequestParam(value = "sort", required = false) String sort) {
		// ?????????, ?????? ??????
		animalDTO.setAnimal_tag("dog");
		// ?????????
		String field = "";
		String keyword = "";

		int currentPage = 1; // ?????? ????????? ??????
		if (page != 1) {
			currentPage = page;
		}
    	int startWeight = 0 ;
    	int endWeight = 0 ;
    	
    	//??????
    	if(animalDTO.getAnimal_size() != null && animalDTO.getAnimal_size().equals("??????")) {
    		startWeight = 1;
    		endWeight = 4;
    	}else if(animalDTO.getAnimal_size() != null && animalDTO.getAnimal_size().equals("??????")) {
    		startWeight = 4;
    		endWeight = 10;
    	}else if(animalDTO.getAnimal_size() != null && animalDTO.getAnimal_size().equals("??????")) {
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

	@RequestMapping("/cat_list")
	public String cat_list(@RequestParam(value = "page", defaultValue = "1") int page, Model model,
			AnimalDTO animalDTO, @RequestParam(value = "sort", required = false) String sort) {
		// ?????????, ?????? ??????
		animalDTO.setAnimal_tag("cat");

		// ?????????
		String field = "";
		String keyword = "";

		int currentPage = 1; // ?????? ????????? ??????
		if (page != 1) {
			currentPage = page;
		}

    	int startWeight = 0 ;
    	int endWeight = 0 ;
    	
    	//??????
    	if(animalDTO.getAnimal_size() != null && animalDTO.getAnimal_size().equals("??????")) {
    		startWeight = 1;
    		endWeight = 4;
    	}else if(animalDTO.getAnimal_size() != null && animalDTO.getAnimal_size().equals("??????")) {
    		startWeight = 4;
    		endWeight = 10;
    	}else if(animalDTO.getAnimal_size() != null && animalDTO.getAnimal_size().equals("??????")) {
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
	public String animal_update_ok(@RequestParam("files") List<MultipartFile> files,
			@RequestParam(value = "img2_delete",required = false) String img2_delete, 
			@RequestParam(value = "img3_delete",required = false) String img3_delete, 
			AnimalDTO animalDTO) {

		//?????? ?????? ??????
		if(img2_delete != null && img2_delete.equals("Y")) {
			animalDTO.setAnimal_img2("");
		}
		if(img2_delete != null && img2_delete.equals("Y")) {
			animalDTO.setAnimal_img3("");
		}
		
		List<String> originImgs = new ArrayList<String>();
		originImgs.add(animalDTO.getAnimal_img1());
		originImgs.add(animalDTO.getAnimal_img2());
		originImgs.add(animalDTO.getAnimal_img3());
		
		
		FileUploadImage upload = new FileUploadImage();
		try {
			List<String> newImgs = upload.updateFile(request, files, "animal", originImgs, 3);
			animalDTO.setAnimal_img1(newImgs.get(0));
			animalDTO.setAnimal_img2(newImgs.get(1));
			animalDTO.setAnimal_img3(newImgs.get(2));
			
			animalDAO.update(animalDTO);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "??????????????? ??????????????????.");
			request.setAttribute("url", "back");
			return "include/alert";
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
		// Adoptreg ??????
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());

		AdoptRegDTO adoptRegDTO = new AdoptRegDTO();
		adoptRegDTO.setAdopt_reg_animalno(animalDAO.count(null) + 1);
		adoptRegDTO.setAdopt_reg_userid("admin");
		adoptRegDTO.setAdopt_reg_appdate(strDate);

		

		// ?????? ?????? ?????????????????? ?????? ?????? ??????
		// ????????? ????????? ??? animal ????????? ??????
		FileUploadImage upload = new FileUploadImage();
		List<String> animalImgs =  upload.uploadFile(request, files, "animal", 3);
		
		animalDTO.setAnimal_img1(animalImgs.get(0));
		animalDTO.setAnimal_img2(animalImgs.get(1));
		animalDTO.setAnimal_img3(animalImgs.get(2));
		
		animalDTO.setAnimal_status("?????? ??????");
		
		try {
			animalService.insert(animalDTO, adoptRegDTO);
		} catch (Exception e) {
			e.printStackTrace();
			upload.deleteFile(request, animalImgs);
			request.setAttribute("msg", "insert fail");
			request.setAttribute("url", "back");
			return "include/alert";
		}

		return "redirect:/"+animalDTO.getAnimal_tag()+"_list";
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
			return "include/alert";
		}
		return "redirect:/"+animal_tag+"_list";
	}
	
	@RequestMapping(value="/animal_content",method = RequestMethod.GET)
	public String animal_contet(@RequestParam("no") int no,Model model) {
		model.addAttribute("content",animalDAO.content(no));
		return "admin/animal/animal_content";
	}


	// ????????????
	@RequestMapping("/adoptreg_list")
	public String adoptreg_list(@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate,
			@RequestParam(value = "adopt_tag", required = false) String adopt_tag,
			@RequestParam(value = "page", defaultValue = "1") int page, Model model,
			@RequestParam(value = "animal_status", required = false) String animal_status,
			@RequestParam(value = "sort",required = false) String sort,
			@RequestParam(value = "animal_name",required = false) String animal_name,
			@RequestParam(value = "animal_no",required=true,defaultValue="0") int animal_no
			) {
		// ?????????
		String field = "";
		String keyword = "";
		
		if(animal_name == null) {animal_name = "";}
		//?????? ????????? ??? animal_status ??????
		if(animal_status == null) {
			animal_status = "?????? ??????";
		}
		//?????? ?????????????????? ??????????????? ??? ??? ?????? ?????? ????????? ?????? ?????? ?????????
		if(animal_status != null && animal_status.equals("apply")) {
			animal_status = "?????? ??????";
		}
		if(animal_status != null && animal_status.equals("possible")) {
			animal_status = "?????? ??????";
		}
		if(animal_status != null && animal_status.equals("waiting")) {
			animal_status = "?????? ??????";
		}
		if(animal_status != null && animal_status.equals("completion")) {
			animal_status = "?????? ??????";
		}

		int currentPage = 1; // ?????? ????????? ??????
		if (page != 1) {
			currentPage = page;
		}
		//animal_status ???????????? ???????????? ?????? ????????? ?????????(adopt_reg_animalno)
		List<Integer> status_no = null;
		if(animal_status != null && !animal_status.equals("")) {
			status_no = animalDAO.joinStatus(animal_status,animal_name);
			if(status_no.size() == 0) {//????????? ???????????? ???????????? ?????? ??????
				status_no.add(-1);
			}
		}
		// ?????????
		if(animal_no == 0) {
			totalRecord = adoptRegDAO.countTag(startDate, endDate, adopt_tag, status_no);	
		}else {
			totalRecord = 1;
		}
		PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);

		// ??????????????? ?????? ???????????? ??????
		
		List<AnimalDTO> animalList = null;
		Map<Integer, ArrayList<Object>> maps = new HashMap();
		if(animal_no == 0) {
			animalList = animalDAO.list();
			for (AnimalDTO dto : animalList) {
				ArrayList<Object> aList = new ArrayList();
				aList.add(dto.getAnimal_name());
				aList.add(dto.getAnimal_status());
				aList.add(dto.getAnimal_state());
				maps.put(dto.getAnimal_no(), aList);
			}
		}
		else {//????????????????????? ????????? ??? ?????? ??????
			AnimalDTO dto = animalDAO.content(animal_no);
			ArrayList<Object> aList = new ArrayList();
			aList.add(dto.getAnimal_name());
			aList.add(dto.getAnimal_status());
			aList.add(dto.getAnimal_state());
			maps.put(dto.getAnimal_no(), aList);
		}
		List<AdoptRegDTO> list = null;
		if(animal_no == 0) {
			list = adoptRegDAO.listPaging(paging.getStartNo(), paging.getEndNo(), startDate, endDate,adopt_tag,
					status_no,sort);
		}else {//????????????????????? ????????? ??? ?????? ??????
			list = new ArrayList<AdoptRegDTO>();
			AdoptRegDTO dto = adoptRegDAO.contentAnimal(animal_no);
			list.add(dto);
		}

		model.addAttribute("total", totalRecord);
		model.addAttribute("paging", paging);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("tag", adopt_tag);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("animal_status",animal_status);
		model.addAttribute("sort",sort);
		model.addAttribute("animal_name",animal_name);

		model.addAttribute("adoptRegList", list);
		model.addAttribute("animalMap", maps);

		return "admin/adoptreg/adoptreg_list";
	}

	/* ????????? ??????????????? ???????????? */
	@RequestMapping(value = "/adoptreg_update", method = RequestMethod.GET)
	public String adoptreg_update(@RequestParam("adopt_reg_regno") int adopt_reg_regno,
			@RequestParam("status") String status, Model model) {

		AdoptRegDTO adoptRegDTO = adoptRegDAO.content(adopt_reg_regno);
		AnimalDTO animalDTO = animalDAO.content(adoptRegDTO.getAdopt_reg_animalno());
		
		//?????? ????????? ?????? ???????????? ????????? ??? ????????? ?????? ?????? ???
		if(adoptRegDTO.getAdopt_reg_duedate()==null && status.equals("adoptdate")) {
			request.setAttribute("msg", "?????? ???????????? ?????? ???????????????");
			request.setAttribute("url", "back");
			return "include/alert";
		}

		model.addAttribute("status",status);
		model.addAttribute("content", adoptRegDTO);
		model.addAttribute("foreign", animalDTO);
		return "admin/adoptreg/adoptreg_update";
	}

	@RequestMapping(value = "/adoptreg_update", method = RequestMethod.POST)
	public String adoptreg_update(AdoptRegDTO adoptRegDTO, @RequestParam("status") String status) throws UnsupportedEncodingException {
		
		
		animalService.adoptRegUpdate(adoptRegDTO,status);
		if(status.equals("adoptdate")) {
			return "redirect:/adoptreg_list?page=1&animal_status=completion";
		}
		return "redirect:/adoptreg_list";
		
	}

	@RequestMapping(value = "/adoptreg_admission")
	public String adoptreg_admission(@RequestParam("animal_no") int animal_no, @RequestParam("animal_status") String animal_status) {
		AnimalDTO animalDTO = new AnimalDTO();
		animalDTO.setAnimal_no(animal_no);
		AdoptRegDTO adoptRegDTO = null;
		//?????? ??????
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());
		
		String path = null;
		//??????
		if(animal_status.equals("?????? ??????")) {
			animalDTO.setAnimal_status("?????? ??????");
			path = "apply";
		}else if(animal_status.equals("?????? ??????")) {
			animalDTO.setAnimal_status("?????? ??????");
			path = "possible";
		}
//		else if(animal_status.equals("?????? ??????")) {
//			animalDTO.setAnimal_status("?????? ??????");
//			adoptRegDTO = new AdoptRegDTO();
//			adoptRegDTO.setAdopt_reg_animalno(animal_no);
//			adoptRegDTO.setAdopt_reg_adoptdate("");
//			path = "?????? ??????";
//		}

		try {
			animalService.update(animalDTO, adoptRegDTO);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "update fail");
			request.setAttribute("url", "back");
			return "include/alert";
		}
		return "redirect:/adoptreg_list?page=1&animal_status="+path;
	}
	
	@RequestMapping("/adoptreg_cancel")
	public String adoptreg_cancel(@RequestParam("animal_no") int animal_no,@RequestParam("adopt_reg_regno") int adopt_reg_regno,
			@RequestParam("user_id") String user_id, HttpServletRequest request) {
		AnimalDTO animalDTO = new AnimalDTO();
		animalDTO.setAnimal_no(animal_no);
		animalDTO.setAnimal_status("?????? ??????");
		try {
			animalService.adoptRegCancel(animalDTO, adopt_reg_regno);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "cancel fail");
			request.setAttribute("url", "back");
			return "include/alert";
		}
		
		UserDTO userinfo = userdao.getUserInfo(user_id);
		
		String receiver = userinfo.getUser_email();
		
		Properties props = System.getProperties();
        props.put("mail.smtp.user", "soopwe12@gmail.com"); // ?????? ???????????? ??????
		props.put("mail.smtp.host", "smtp.gmail.com"); // ?????? SMTP
		props.put("mail.smtp.port", "587"); //465
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.debug", "true");
		props.put("mail.smtp.socketFactory.port", "587"); //465
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		Authenticator auth = new MyAuthentication();

		//session ?????? ???  MimeMessage??????
        Session session = Session.getDefaultInstance(props, auth);
        MimeMessage msg = new MimeMessage(session);
        
        try{
            //??????????????????
            msg.setSentDate(new Date());           
            InternetAddress from = new InternetAddress();             
            // ????????? ?????????
            msg.setFrom(from);           
            // ????????? ?????????
            InternetAddress to = new InternetAddress(receiver);         
            msg.setRecipient(Message.RecipientType.TO, to);
            // ????????? ??????
            msg.setSubject("HeartPet ??????????????? ?????????????????????.", "UTF-8");
            // ????????? ?????? 
            msg.setText("HeartPet ??????????????? ?????????????????????. ????????? ????????? ??????????????? ?????? ??????????????????.", "UTF-8");
            // ????????? ?????? 
            msg.setHeader("content-Type", "text/html");
            //???????????????
            javax.mail.Transport.send(msg);
	        }catch (AddressException addr_e) {
	            addr_e.printStackTrace();
	        }catch (MessagingException msg_e) {
	            msg_e.printStackTrace();
	        }
		
        return "redirect:/adoptreg_list?page=1&animal_status=possible";
	}
	
	
	class MyAuthentication extends Authenticator {
	    PasswordAuthentication pa;
	    public MyAuthentication(){   
	    	String id = "heartpetofficial@gmail.com";      
	        String pw = "ytlyzdvbierurclh";

	        pa = new PasswordAuthentication(id, pw);
	}
	    	// ??????????????? ???????????? ????????????
		    public PasswordAuthentication getPasswordAuthentication() {
		        return pa;
		    }
	}
}
