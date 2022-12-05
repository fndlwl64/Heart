package com.heartpet.action;

public interface UserDAO {

    public String idCheck(String id);

    public int KakaoInsert(String id, String name, String email);


}
