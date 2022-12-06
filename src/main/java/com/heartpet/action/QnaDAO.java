package com.heartpet.action;

import com.heartpet.model.QnaDTO;

import java.util.List;

public interface QnaDAO {
    public List<QnaDTO> listQna();
    public int insertQna(QnaDTO dto);
    public QnaDTO contentQna(int board_no);
    public int hitQna(int board_no);
    public int updateQna(QnaDTO dto);
    public int deleteQna(int board_no);
    public List<QnaDTO> searchQna(String field, String keyword);

}
