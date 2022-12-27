package com.heartpet.action;

import java.util.List;
import java.util.Map;

import com.heartpet.model.AnimalDTO;

public interface AnimalDAO {
	public int insert(AnimalDTO dto);
    public int update(AnimalDTO dto);
    public int updateStatus(AnimalDTO dto);
    public void delete(int id);
    public List<Integer> joinStatus(String animal_status);
    public List<AnimalDTO> list();
    public List<AnimalDTO> listTag(String animal_tag);
    public List<AnimalDTO> mainAnimal(String animal_tag);
    public List<AnimalDTO> listTagUser(String animal_tag);
    public List<AnimalDTO> listPaging(int startNO, int endNo, AnimalDTO animalDTO, String keyword,String sort,int startWeight, int endWeight);
    public AnimalDTO content(int id);
    public List<AnimalDTO> search();
    public Map<String, Object> animalName(int animal_no);
    public int count(String animal_tag);
    public int countPaging(AnimalDTO dto, String keyword,int startWeight, int endWeight);
    
}
