package com.heartpet.action;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heartpet.model.SupportDTO;

@Repository
public class SupportDAOImpl implements SupportDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 후원하기에서 마지막 후원번호 가져오는 메서드
	@Override
	public int SupportMaxNo() {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("support_no");
	}

	// 관리자페이지에서 후원 리스트 출력하는 메서드
	@Override
	public List<SupportDTO> Support() {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("sup_list");
	}

	// 관리자페이지에서 후원내역 등록하는 메서드
	@Override
	public int Support_insert(SupportDTO dto) {
		// TODO Auto-generated method stub
		return this.sqlSession.insert("sup_insert", dto);
	}

	@Override
	public SupportDTO supportCont(int no) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("sup_content", no);
	}
	
	@Override
	public int updateSupport(SupportDTO dto) {
		// TODO Auto-generated method stub
		return this.sqlSession.update("sup_update", dto);
	}

	@Override
	public int deleteSupport(int no) {
		
		return this.sqlSession.delete("sup_delete", no);
	}

	@Override
	public void updateSequence(int no) {
		
		this.sqlSession.update("sup_seq", no);
		
	}

	@Override
	public void insertSupportPay(HashMap<String, Object> map) {
		this.sqlSession.insert("sup_pay", map);
		
	}


}
