package com.heartpet.project.action;

import com.heartpet.project.model.QnaDTO;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

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
