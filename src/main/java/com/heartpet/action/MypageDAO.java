package com.heartpet.action;

import java.util.List;

import com.heartpet.model.Mypage_SupportDTO;
import com.heartpet.model.NoticeDTO;

public interface MypageDAO {
	// 마이페이지 후원 금액, 일자 불러오는 리스트
	public List<Mypage_SupportDTO> getNoticeList();

}
