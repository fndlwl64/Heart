package com.heartpet.action;

import com.heartpet.model.FnqDTO;
import com.heartpet.model.QnaDTO;

import java.util.List;

public interface QnaDAO {
    public List<QnaDTO> listQna(int startNo, int endNo, String field, String keyword);
    public int listQnaCount(String field, String keyword);
    public int insertQna(QnaDTO dto);
    public QnaDTO contentQna(int board_no);
    public int hitQna(int board_no);
    public int updateQna(QnaDTO dto);
    public int deleteQna(int board_no);
    public String idQna(int board_no);
	public List<FnqDTO> listFnq(int startNo, int endNo, String field, String keyword);
    public int listFnqCount(String field, String keyword);

}
