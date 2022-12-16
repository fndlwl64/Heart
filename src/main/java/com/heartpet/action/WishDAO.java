package com.heartpet.action;

import java.util.List;

import com.heartpet.model.WishDTO;

public interface WishDAO {

    public List<WishDTO> list();
    public WishDTO content(int wish_no);
    public WishDTO check(WishDTO wishDTO);
    public int count();
    public int insert(WishDTO dto);
    public int update(int wish_no);
    public int delete(int wish_no);

}
