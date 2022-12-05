package com.heartpet.project.action;

import com.heartpet.project.model.UserDTO;

public interface UserDAO {

    public String idCheck(String id);

    public int KakaoInsert(String id, String name, String email);


}
