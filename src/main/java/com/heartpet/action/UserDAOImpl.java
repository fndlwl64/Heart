package com.heartpet.action;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

    @Override
    public String idCheck(String id) {
        return null;
    }

    @Override
    public int KakaoInsert(String id, String name, String email) {
        return 0;
    }
}
