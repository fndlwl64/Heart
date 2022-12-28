package com.heartpet.action;

import java.util.List;
import java.util.Map;

import com.heartpet.model.AdoptRegDTO;

public interface AdoptRegDAO {
	public int insert(AdoptRegDTO dto);
    public int update(AdoptRegDTO dto);
    public int updateCancel(int adoptreg_regno);
    public void delete(int id);
    //public List<Map<String, Object>> list();
    public List<AdoptRegDTO> list();
    public List<AdoptRegDTO> listPaging(int startNo, int endNo, String startDate, String endDate, String tag,List<Integer> status_no, String sort);
    public AdoptRegDTO content(int id);
    public AdoptRegDTO contentAnimal(int animal_no);
    public List<AdoptRegDTO> search();
    public int count();
    public int countTag(String startDate, String endDate, String tag, List<Integer> status_no);
}
