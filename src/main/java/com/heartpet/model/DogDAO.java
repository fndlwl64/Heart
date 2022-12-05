package com.heartpet.project.action;

import com.heartpet.project.model.AnimalDTO;
import com.heartpet.project.model.DogDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DogDAO {
    public int insert(DogDTO dto);
    public int update(DogDTO dto);
    public void delete(int id);
    public List<DogDTO> list();
    public DogDTO content(int id);
    public List<DogDTO> search();
    /*page???*/
}
