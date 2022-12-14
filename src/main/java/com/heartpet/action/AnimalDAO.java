package com.heartpet.action;

import java.util.List;

import com.heartpet.model.AnimalDTO;

public interface AnimalDAO {
	public int insert(AnimalDTO dto);
    public int update(AnimalDTO dto);
    public int updateStatus(AnimalDTO dto);
    public void delete(int id);
    public List<AnimalDTO> list();
    public List<AnimalDTO> listTag(String animal_tag);
    public List<AnimalDTO> listTagUser(String animal_tag);
    public List<AnimalDTO> listPaging(int startNO, int endNo, AnimalDTO animalDTO);
    public AnimalDTO content(int id);
    public List<AnimalDTO> search();
    public List<String> animalName(List<Integer> animalId);
    public int count(String animal_tag);
    public int countPaging(AnimalDTO dto);
}
