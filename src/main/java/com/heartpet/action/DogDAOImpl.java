package com.heartpet.action;

import com.heartpet.model.DogDTO;
import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;

public class DogDAOImpl implements DogDAO {
    @Autowired
    DogDAO dogDAO;
    @Override
    public int insert(DogDTO testDTO) {
        return 0;
    }

    @Override
    public int update(DogDTO testDTO) {
        return 0;
    }

    @Override
    public void delete(int id) {


    }

    @Override
    public List<DogDTO> list() {
        return dogDAO.list();
    }

    @Override
    public DogDTO content(int id) {
        return null;
    }

    @Override
    public List<DogDTO> search() {
        return null;
    }
}
