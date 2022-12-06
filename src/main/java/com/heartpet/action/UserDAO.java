package com.heartpet.action;

import java.util.Map;

import com.heartpet.model.UserDTO;


public interface UserDAO {

    public int idCheck(String id);

    public int kakaoInsert(Map<String, Object> map);
    
    public int join(UserDTO dto);
    
    public String login(Map<String, Object> map);


}
