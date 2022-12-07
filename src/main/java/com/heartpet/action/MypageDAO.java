package com.heartpet.action;

import java.util.List;

import com.heartpet.model.Mypage_SupportDTO;
import com.heartpet.model.NoticeDTO;
import com.heartpet.model.UserDTO;

public interface MypageDAO {
	// 마이페이지 후원 금액, 일자 불러오는 리스트
	public List<Mypage_SupportDTO> getSupportList();
	// 마이페이지에서 후원금액 합을 불러오는 메서드
	public int SumSupport();
	// 마이페이지에서 회원 정보를 불러오는 메서드
	public List<UserDTO> UserInfo(); 
	
	

}
