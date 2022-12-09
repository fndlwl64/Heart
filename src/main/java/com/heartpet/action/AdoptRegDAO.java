package com.heartpet.action;

import java.util.List;

import com.heartpet.model.AdoptRegDTO;

public interface AdoptRegDAO {
	public int insert(AdoptRegDTO dto);
    public int update(AdoptRegDTO dto);
    public void delete(int id);
    public List<AdoptRegDTO> list();
    public AdoptRegDTO content(int id);
    public List<AdoptRegDTO> search();

}
