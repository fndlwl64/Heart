package com.heartpet.action;

import java.util.HashMap;
import java.util.List;

import com.heartpet.model.Mypage_SupportDTO;
import com.heartpet.model.NoticeDTO;
import com.heartpet.model.UserDTO;
import com.heartpet.model.WishVO;

public interface MypageDAO {
	
	// 마이페이지 후원 금액, 일자 불러오는 리스트
	//public List<Mypage_SupportDTO> getSupportList(String id);
	
	// 마이페이지에서 후원금액 합을 불러오는 메서드
	public int SumSupport(String id);
	
	// 마이페이지에서 회원 정보를 불러오는 메서드
	public UserDTO UserInfo(String id);
	
	// 마이페이지에서 회원이 입양대기하고 있는 목록 개수를 불러오는 메서드
	public int AnimalRegCount(String id);
	
	// 마이페이지에서 회원이 작성한 리뷰 개수를 불러오는 메서드
	public int ReviewCount(String id);
	
	// 마이페이지에서 회원정보를 수정하는 메서드
	public int UserUpdate(UserDTO dto);
	
	// 마이페이지에서 관심정보를 불러오는 메서드
	/* public List<WishVO> getWishList(String id); */
	
	public List<WishVO> listWish(int startNo, int endNo, String id);
    public int listWishCount(String id);
	
	// 마이페이지에서 입양예정 불러오는 메서드
	/* public List<WishVO> getAdoptList(String id); */
	
	public List<WishVO> listAdopt(int startNo, int endNo, String id);
    public int listAdoptCount(String id);
	
	// 마이페이지에서 입양완료 불러오는 메서드
	/* public List<WishVO> getAdoptComList(String id); */
	
	public List<WishVO> listAdoptCom(int startNo, int endNo, String id);
    public int listAdoptComCount(String id);
	
	// 마이페이지에서 회원 탈퇴하는 메서드
	public int UserDelete(String id);
	
	
	
	// 마이페이지에서 입양완료된 동물 후기썼는지 안썼는지 체크하는 메서드
	public int review_count_check(HashMap<String, Object> map);
	
	// 마이페이지에서 후원내역 페이징까지
	public List<Mypage_SupportDTO> getSupportList(int startNo, int endNo, String search_date_start, String search_date_end, String id);
	
	// 마이페이지에서 후원하기 페이징 전체 개수
    public int listSupportCount(String search_date_start, String search_date_end, String id);
    
    // 기간별 후원금액 합
    public int supportdatesum(String search_date_start, String search_date_end, String id);
}
