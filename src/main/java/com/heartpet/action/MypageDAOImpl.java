package com.heartpet.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heartpet.model.Mypage_SupportDTO;
import com.heartpet.model.UserDTO;
import com.heartpet.model.WishVO;

@Repository
public class MypageDAOImpl implements MypageDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*
	 * @Override public List<Mypage_SupportDTO> getSupportList(String id) { // TODO
	 * Auto-generated method stub return this.sqlSession.selectList("support_list",
	 * id); }
	 */

	@Override
	public int SumSupport(String id) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("support_sum", id);
	}

	@Override
	public UserDTO UserInfo(String id) {
		
		return this.sqlSession.selectOne("user_info", id);
	}

	@Override
	public int AnimalRegCount(String id) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("reg_count", id);
	}

	@Override
	public int ReviewCount(String id) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("mypage_review_count", id);
	}

	@Override
	public int UserUpdate(UserDTO dto) {
		// TODO Auto-generated method stub
		return this.sqlSession.update("user_update", dto);
	}

	@Override
	public List<WishVO> getWishList(String id) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("wish_list", id);
	}

	@Override
	public List<WishVO> getAdoptList(String id) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("adopt_list", id);
	}

	@Override
	public List<WishVO> getAdoptComList(String id) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("adopt_com_list", id);
	}

	@Override
	public int UserDelete(String id) {
		// TODO Auto-generated method stub
		return this.sqlSession.update("user_delete", id);
	}

	@Override
	public int review_count_check(HashMap<String, Object> map) {
		return this.sqlSession.selectOne("review_check", map);
	}

	@Override
	public List<Mypage_SupportDTO> getSupportList(int startNo, int endNo, String field, String keyword, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("startNo", startNo);
        map.put("endNo", endNo);
        map.put("field", field);
        map.put("keyword", keyword);
        map.put("id", id);
        return this.sqlSession.selectList("support_list", map);
	}

	@Override
	public int listSupportCount(String field, String keyword, String id) {
		Map<String, String> map = new HashMap<String, String>();
        map.put("field", field);
        map.put("keyword", keyword);
        map.put("id", id);
        return this.sqlSession.selectOne("support_count", map);
	}
	
	
	


}
