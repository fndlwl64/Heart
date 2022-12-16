package com.heartpet.action;

import java.util.List;
import java.util.Map;

import com.heartpet.model.AdoptRegDTO;

public interface AdoptRegDAO {
	public int insert(AdoptRegDTO dto);
    public int update(AdoptRegDTO dto);
    public void delete(int id);
    //public List<Map<String, Object>> list();
    public List<AdoptRegDTO> list();
    public List<AdoptRegDTO> listPaging(int startNo, int endNo, String startDate, String endDate, String tag,String sort);
    public AdoptRegDTO content(int id);
    public List<AdoptRegDTO> search();
    public int count();
    public int countTag(String startDate, String endDate, String tag);
}
