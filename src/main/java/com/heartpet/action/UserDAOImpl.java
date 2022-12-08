package com.heartpet.action;

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

	

}
