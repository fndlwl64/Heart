package com.heartpet.action;

import com.heartpet.model.UserDTO;

public interface UserDAO {

    public String idCheck(String id);

    public int KakaoInsert(String id, String name, String email);


}
