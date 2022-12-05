package com.heartpet.action;

import com.heartpet.model.QnaDTO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class QnaDAOImpl implements QnaDAO {

    @Autowired
    QnaDAO qnaDAO;

    @Override
    public List<QnaDTO> listQna() {
        return qnaDAO.listQna();
    }

    @Override
    public int insertQna(QnaDTO dto) {
        return 0;
    }

    @Override
    public QnaDTO contentQna(int board_no) {
        return null;
    }

    @Override
    public int updateQna(QnaDTO dto) {
        return 0;
    }

    @Override
    public int deleteQna(int board_no) {
        return 0;
    }

    @Override
    public List<QnaDTO> searchQna(String field, String keyword) {
        return null;
    }
}
