package com.heartpet.project.action;

import com.heartpet.project.model.QnaDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface QnaDAO {
    public List<QnaDTO> listQna();
    public int insertQna(QnaDTO dto);
    public QnaDTO contentQna(int board_no);
    public int updateQna(QnaDTO dto);
    public int deleteQna(int board_no);
    public List<QnaDTO> searchQna(String field, String keyword);

}
