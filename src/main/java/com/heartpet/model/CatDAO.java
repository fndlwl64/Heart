package com.heartpet.project.action;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CatDAO {
    public void delete(int id);
}
