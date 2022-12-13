package com.heartpet.action;

import java.util.List;
import java.util.Map;

import com.heartpet.model.UserDTO;


public interface UserDAO {

    public int idCheck(String id);
    
    public int adminCheck(String id);
    
    public int kakaoInsert(Map<String, Object> map);
    
    public int naverInsert(Map<String, Object> map);
    
    public int join(UserDTO dto);
    
    public String login(String id);
         
    public UserDTO getUserInfo(String id);
    
    public List<UserDTO> getUserList();
    
    public int totalUser();
    
    public int emailCheck(String email);
    
    public int updateuser(UserDTO dto);
    
    public int update_num(int no);
    
    public int deleteuser(String id);

}
