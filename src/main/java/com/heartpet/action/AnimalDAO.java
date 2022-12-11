package com.heartpet.action;

import java.util.List;

import com.heartpet.model.AnimalDTO;

public interface AnimalDAO {
	public int insert(AnimalDTO dto);
    public int update(AnimalDTO dto);
    public void delete(int id);
    public List<AnimalDTO> list();
    public List<AnimalDTO> listTag(String animal_tag);
    public AnimalDTO content(int id);
    public List<AnimalDTO> search();
    public List<String> animalName(List<Integer> animalId);
    public int count();
}
