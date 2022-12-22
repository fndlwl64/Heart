package com.heartpet.action;

import com.heartpet.model.NoticeDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO{

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/*
	 * @Override public List<NoticeDTO> getNoticeList() { return
	 * this.sqlSession.selectList("notice_list"); }
	 */

	@Override
	public NoticeDTO getNotice(int no) {
		return this.sqlSession.selectOne("notice_content", no);
	}

	@Override
	public int readCount(int no) {
		return this.sqlSession.update("notice_read", no);
	}

	@Override
	public int noticeinsert(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return this.sqlSession.insert("notice_insert", dto);
	}

	@Override
	public int noticeupdate(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return this.sqlSession.update("notice_update", dto);
	}

	@Override
	public int noticedelete(int no) {
		// TODO Auto-generated method stub
		return this.sqlSession.update("notice_delete", no);
	}

	@Override
	public List<NoticeDTO> listNotice(int startNo, int endNo, String search_title, String search_cont, String search_date_start, String search_date_end, String order) {
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("startNo", startNo);
        map.put("endNo", endNo);
        map.put("search_title", search_title);
        map.put("search_cont", search_cont);
        map.put("search_date_start", search_date_start);
        map.put("search_date_end", search_date_end);
        map.put("order", order);
        return this.sqlSession.selectList("notice_list", map);
	}

	@Override
	public int listNoticeCount(String search_title, String search_cont, String search_date_start, String search_date_end) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("search_title", search_title);
        map.put("search_cont", search_cont);
        map.put("search_date_start", search_date_start);
        map.put("search_date_end", search_date_end);
        return this.sqlSession.selectOne("notice_count", map);
	}
	
	

}
