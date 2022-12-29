package com.heartpet.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
import com.heartpet.action.service.AnimalService;
import com.heartpet.model.AdoptRegDTO;
import com.heartpet.model.AnimalDTO;
import com.heartpet.model.PageDTO;
import com.heartpet.model.UserDTO;
import com.heartpet.model.WishDTO;
import com.heartpet.util.FileUploadImage;

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
	private AnimalService animalService;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private HttpServletRequest request;
	

	// 한 페이지당 보여질 게시물의 수
    private final int rowsize = 8;
    // 전체 게시물의 수
    private int totalRecord = 0;

    @RequestMapping(value = "/user_dog_list")
	public String user_dog_list( @RequestParam(value = "page", defaultValue = "1") int page, Model model
    		, AnimalDTO animalDTO, @RequestParam(value = "keyword" , required = false) String keyword
    		,@RequestParam(value="sort" , required = false) String sort) {
    	//강아지 , 삭제되지 않은 데이터
    	animalDTO.setAnimal_tag("dog");
    	animalDTO.setAnimal_state(1);
    	if(animalDTO.getAnimal_status()==null || animalDTO.getAnimal_status().equals("")) {
    		animalDTO.setAnimal_status("not 입소 신청");
    	}
    	System.out.println(animalDTO.getAnimal_status());
		//페이징
		String field = ""; 
		
		String session_id = (String)request.getSession().getAttribute("session_id");
		
		//좋아요
		/*
		 * WishDTO wishDTO = new WishDTO();
		 * wishDTO.setWish_petno(animalDTO.getAnimal_no());
		 * wishDTO.setWish_userid(session_id);
		 * model.addAttribute("wishCheck",wishDAO.check(wishDTO));
		 */
		
		
		int currentPage = 1;	// 현재 페이지 변수
		if(page != 1) { currentPage = page; }

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
    	List<AnimalDTO> animalList = animalDAO.listPaging(paging.getStartNo(), paging.getEndNo(),animalDTO,keyword,sort,startWeight,endWeight);
    	
    	List<Integer> wishList = new ArrayList<Integer>();
    	for(int i=0; i<animalList.size(); i++) {
    	  wishList.add(wishDAO.selectWish(animalList.get(i).getAnimal_no(), session_id));
    	}

    	model.addAttribute("total", totalRecord);
        model.addAttribute("paging", paging);		
 		model.addAttribute("field", field);
 		model.addAttribute("sort",sort);
 		model.addAttribute("keyword",keyword);
		model.addAttribute("animalList", animalList);
		model.addAttribute("animalDTO",animalDTO);
		model.addAttribute("wishList", wishList);
		return "user/animal/user_animal_list";
	}

	@RequestMapping(value = "/user_cat_list")
	public String user_cat_list(@RequestParam(value = "page", defaultValue = "1") int page, Model model
    		, AnimalDTO animalDTO, @RequestParam(value = "keyword" , required = false) String keyword, @RequestParam(value = "sort", required = false) String sort) {
		//고양이 , 삭제되지 않은 데이터
    	animalDTO.setAnimal_tag("cat");
    	animalDTO.setAnimal_state(1);

    	if(animalDTO.getAnimal_status()==null || animalDTO.getAnimal_status().equals("")) {
    		animalDTO.setAnimal_status("not 입소 신청");
    	}

    	
    	//좋아요
		/*
		 * WishDTO wishDTO = new WishDTO();
		 * wishDTO.setWish_petno(animalDTO.getAnimal_no());
		 * wishDTO.setWish_userid((String)request.getSession().getAttribute("session_id"
		 * )); model.addAttribute("wishCheck",wishDAO.check(wishDTO));
		 */

		//페이징
		String field = ""; 
		
		String session_id = (String)request.getSession().getAttribute("session_id");
		
		int currentPage = 1;	// 현재 페이지 변수
		if(page != 1) { currentPage = page; }

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

    	System.out.println("========================");
    	System.out.println("========================");
    	System.out.println("========================");
		System.out.println(startWeight);
		
		totalRecord = animalDAO.countPaging(animalDTO, keyword,startWeight,endWeight);
    	PageDTO paging = new PageDTO(currentPage, rowsize, totalRecord, field, keyword);
    	List<AnimalDTO> animalList = animalDAO.listPaging(paging.getStartNo(), paging.getEndNo(),animalDTO,keyword,sort,startWeight , endWeight);
    	
    	
    	List<Integer> wishList = new ArrayList<Integer>();
    	for(int i=0; i<animalList.size(); i++) {
    	  wishList.add(wishDAO.selectWish(animalList.get(i).getAnimal_no(), session_id));
    	}
    	
    	model.addAttribute("total", totalRecord);
        model.addAttribute("paging", paging);		
 		model.addAttribute("field", field);
 		model.addAttribute("sort",sort);
 		model.addAttribute("keyword",keyword);
		model.addAttribute("animalList", animalList);
		model.addAttribute("animalDTO",animalDTO);
		model.addAttribute("wishList", wishList);
		return "user/animal/user_animal_list";
	}

	@RequestMapping(value = "/user_animal_content", method = RequestMethod.GET)
	public String user_dog_content(@RequestParam("no") int no, Model model) {
		AnimalDTO animalDTO = animalDAO.content(no);
		
		//좋아요 여부
		WishDTO wishDTO = new WishDTO();
		wishDTO.setWish_petno(animalDTO.getAnimal_no());
		wishDTO.setWish_userid((String)request.getSession().getAttribute("session_id"));
		
		//입소 신청일
		AdoptRegDTO adoptRegDTO = adoptRegDAO.content(no);
		
		model.addAttribute("adoptRegDTO",adoptRegDTO);
		model.addAttribute("wishCheck",wishDAO.check(wishDTO));
		model.addAttribute("dto", animalDTO);
		return "user/animal/user_animal_content";
	}

	// 입양 신청
	@RequestMapping("user_get_animal")
	public String user_get_animal(@RequestParam("animal_no") int animal_no) {
		// animal_status update
		AnimalDTO animalDTO = new AnimalDTO();
		animalDTO.setAnimal_no(animal_no);
		animalDTO.setAnimal_status("입양 대기");
		
		
		// Adoptreg 추가
		// user id 변경
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());
		AdoptRegDTO adoptRegDTO = new AdoptRegDTO();
		adoptRegDTO.setAdopt_reg_userid(request.getSession().getAttribute("session_id").toString());
		adoptRegDTO.setAdopt_reg_animalno(animal_no);
		adoptRegDTO.setAdopt_reg_regdate(strDate);
		
		try {
			animalService.update(animalDTO, adoptRegDTO);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "입양 신청이 실패했습니다.");
			request.setAttribute("url", "main");
			return "include/alert";
		}

		return "redirect:/user_animal_content?no="+animal_no;
	}
	
	// 입양 취소
	@RequestMapping(value = "/user_cancel_animal")
	public String user_cancel_animal(@RequestParam("animal_no") int animal_no){
		AnimalDTO animalDTO = new AnimalDTO();
		animalDTO.setAnimal_no(animal_no);
		animalDTO.setAnimal_status("입양 가능");
		
		AdoptRegDTO adoptRegDTO = new AdoptRegDTO();
		adoptRegDTO.setAdopt_reg_regdate("");
		adoptRegDTO.setAdopt_reg_animalno(animal_no);
		
		try {
			animalService.update(animalDTO, adoptRegDTO);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "입양 취소가 실패했습니다.");
			request.setAttribute("url", "main");
			return "include/alert";
		}
		return "redirect:/user_mypage_adoptreg_list";
	}



    // 입소 신청
    @RequestMapping(value = "/user_animal_insert", method = RequestMethod.GET)
    public String user_animal_insert(Model model, HttpServletResponse response) throws IOException {        
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String user_id ="";
    
        // 로그인 여부 체크
        if ((session.getAttribute("session_id") == null || session.getAttribute("session_id") == "")
                && (session.getAttribute("session_admin_id") == null || session.getAttribute("session_admin_id") == "")) {
           out.println("<script> alert('로그인이 필요합니다.'); location.href='" + request.getContextPath() + "/'; </script>");
        }else {
            if(session.getAttribute("session_id") != null) {
                user_id = (String) session.getAttribute("session_id");
            }else {
                user_id = (String) session.getAttribute("session_admin_id");
            }
        }
        UserDTO userContent = this.userDAO.getUserInfo(user_id);
        System.out.println(userContent.getUser_grade());

        if(userContent.getUser_grade() > 2) {
            out.println("<script> alert('접근 권한이 없습니다.'); location.href='" + request.getContextPath() + "/'; </script>");
            out.flush();
        }
        return "user/animal/user_animal_insert";
    }


	@RequestMapping(value = "/user_animal_insert", method = RequestMethod.POST)
	public String user_animal_insert_ok(@RequestParam("files") List<MultipartFile> files, AnimalDTO animalDTO,
			@RequestParam("user_id") String id) throws IllegalStateException, IOException {
		
		// Adoptreg 추가
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());
		
		int idx = strDate.indexOf(" ");
		
		if(strDate.substring(idx+1, idx+3).equals("24")) {
			strDate = strDate.substring(0,idx+1)+"0"+strDate.substring(idx+3);
		}
		

		AdoptRegDTO adoptRegDTO = new AdoptRegDTO();
		//test
		
		adoptRegDTO.setAdopt_reg_animalno(animalDAO.count(null)+1);
		adoptRegDTO.setAdopt_reg_userid(id);
		adoptRegDTO.setAdopt_reg_appdate(strDate);

		// 동물 입소 신청
		// 이미지 업로드 및 animal 데이터 추가
		
		FileUploadImage upload = new FileUploadImage();
		List<String> animalImgs =  upload.uploadFile(request, files, "animal", 3);
		
		animalDTO.setAnimal_img1(animalImgs.get(0));
		animalDTO.setAnimal_img2(animalImgs.get(1));
		animalDTO.setAnimal_img3(animalImgs.get(2));
		
		animalDTO.setAnimal_status("입소 신청");
		
		try {
			animalService.insert(animalDTO, adoptRegDTO);
		} catch (Exception e) {
			e.printStackTrace();
			upload.deleteFile(request, animalImgs);
			request.setAttribute("msg", "insert fail");
			request.setAttribute("url", "user_animal_insert");
			return "include/alert";
		}
		

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
	
	@ResponseBody
	@RequestMapping("/wish_insert")
	public int wish(@RequestParam("animal_no") int animal_no, @RequestParam("user_id") String user_id) {
		System.out.println("여기"+animal_no);
		System.out.println("여기22222222222222"+user_id);
		int check = wishDAO.selectWish(animal_no, user_id);
		if(check > 0) {

			wishDAO.deleteWish(animal_no, user_id);
			return 0;
		}else {
			wishDAO.insertWish(animal_no, user_id);
			return 1;
		}
	}
	
	@RequestMapping("test")
	public String test() {
		System.out.println("======================");
		System.out.println("======================");
		System.out.println("======================");
		
		System.out.println((String)request.getSession().getAttribute("session_id"));
		System.out.println((String)request.getSession().getAttribute("session_admin_id"));
		return "admin/admin_main";
	}
}