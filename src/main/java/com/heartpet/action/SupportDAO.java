package com.heartpet.action;

import java.util.List;

import com.heartpet.model.SupportDTO;

public interface SupportDAO {

	// 후원하기에서 마지막 후원번호 가져오는 메서드
	public int SupportMaxNo();
	
	// 관리자 페이지에서 후원하기 리스트 출력하는 메서드
	public List<SupportDTO> Support();
	
	// 관리자 페이지에서 후원하기 등록하는 메서드
	public int Support_insert(SupportDTO dto);
	
	// 관리자 페이지에서 후원하기 상세목록 불러오는 메서드
	SupportDTO supportCont(int no);
	
	// 관리자 페이지에서 후원하기 수정하는 메서드
	public int updateSupport(SupportDTO dto);
	
	// 관리자 페이지에서 후원하기 삭제하는 메서드
	public int deleteSupport(int no);
	
	// 관리자 페이지에서 후원하기 삭제했을때 번호 당기는 메서드
	void updateSequence(int no);
}
