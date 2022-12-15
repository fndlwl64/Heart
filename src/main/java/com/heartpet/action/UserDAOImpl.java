package com.heartpet.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heartpet.model.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

    @Override
    public int idCheck(String id) {
        return this.sqlSession.selectOne("id_check", id);
    }

    @Override
    public int kakaoInsert(Map<String, Object> map) {
		return this.sqlSession.insert("kakao_insert", map);
    }
    
    @Override
	public int naverInsert(Map<String, Object> map) {
    	return this.sqlSession.insert("naver_insert", map);
	}

	@Override
	public int join(UserDTO dto) {
		return this.sqlSession.insert("join", dto);
	}

	@Override
	public String login(String id) {
		return this.sqlSession.selectOne("login", id);
	}

	@Override
	public UserDTO getUserInfo(String id) {
		return this.sqlSession.selectOne("userInfo", id);
	}

	@Override
	public int adminCheck(String id) {
		return this.sqlSession.selectOne("admin_check", id);
	}

	@Override 
	public List<UserDTO> getUserList() { 
		return this.sqlSession.selectList("user_list"); 
	}
	 

	@Override
	public int emailCheck(String email) {
		return this.sqlSession.selectOne("email_check", email);
	}

	@Override
	public int totalUser() {
		return this.sqlSession.selectOne("total_user");
	}

	@Override
	public int deleteuser(int no) {
		return this.sqlSession.update("delete_user", no);
	}

	@Override
	public int update_num(int no) {
		return this.sqlSession.update("update_num", no);
	}

	@Override
	public int updateuser(UserDTO dto) {
		return this.sqlSession.update("update_user", dto);
	}

	@Override
	public String findid(Map<String, String> map) {
		return this.sqlSession.selectOne("find_id", map);
	}

	@Override
	public List<UserDTO> userListPaging(int startNo, int endNo, String field, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNo", startNo);
    	map.put("endNo", endNo);
    	map.put("field", field);
    	map.put("keyword", keyword);
        return this.sqlSession.selectList("user_list", map);
	}

	@Override
	public int countUser(String field, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("field", field);
		map.put("keyword", keyword);		
		return this.sqlSession.selectOne("user_count", map);
	}

	@Override
	public String find_pwd(Map<String, String> map) {	
		return this.sqlSession.selectOne("find_pwd", map);
	}

	@Override
	public String pwd_email(String id) {
		return this.sqlSession.selectOne("pwd_email", id);
	}

	@Override
	public int id_name(String name) {
		return this.sqlSession.selectOne("id_name", name);
	}

	@Override
	public String id_email(Map<String, String> map) {
		return this.sqlSession.selectOne("id_email", map);
	}

	

	

}
