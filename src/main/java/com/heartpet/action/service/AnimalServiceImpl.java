package com.heartpet.action.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.heartpet.action.AdoptRegDAO;
import com.heartpet.action.AnimalDAO;
import com.heartpet.action.WishDAO;
import com.heartpet.model.AdoptRegDTO;
import com.heartpet.model.AnimalDTO;
import com.heartpet.model.WishDTO;

@Service
@Transactional
public class AnimalServiceImpl implements AnimalService {
	@Autowired
	AnimalDAO animalDAO;
	@Autowired
	AdoptRegDAO adoptRegDAO;

	@Override
	public void insert(AnimalDTO animalDTO, AdoptRegDTO adoptRegDTO) {
		if(adoptRegDTO != null) {
			adoptRegDAO.insert(adoptRegDTO);
		}
		animalDAO.insert(animalDTO);
	}

	@Override
	public void update(AnimalDTO animalDTO, AdoptRegDTO adoptRegDTO) {
		animalDAO.updateStatus(animalDTO);
		adoptRegDAO.update(adoptRegDTO);
	}

	@Override
	public void adoptRegUpdate(AdoptRegDTO adoptRegDTO) {
		if (adoptRegDTO.getAdopt_reg_duedate() != null) {// 입양 예정일 등록
			String reg_duedate = adoptRegDTO.getAdopt_reg_duedate().replace("T", " ");
			adoptRegDTO.setAdopt_reg_duedate(reg_duedate);
			adoptRegDAO.update(adoptRegDTO);
		}
		if (adoptRegDTO.getAdopt_reg_adoptdate() != null) {// 입양 완료일 등록
			adoptRegDTO.setAdopt_reg_duedate(null);
			String reg_adoptdate = adoptRegDTO.getAdopt_reg_adoptdate().replace("T", " ");
			adoptRegDTO.setAdopt_reg_adoptdate(reg_adoptdate);
			
			AnimalDTO animalDTO = new AnimalDTO();
			animalDTO.setAnimal_no(adoptRegDTO.getAdopt_reg_animalno());
			animalDAO.updateStatus(animalDTO);
			adoptRegDAO.update(adoptRegDTO);
		}
	}

	@Override
	public void adoptRegCancel(AnimalDTO animalDTO, int adopt_reg_regno) {
		animalDAO.updateStatus(animalDTO);
		adoptRegDAO.updateCancel(adopt_reg_regno);
	}
	

}
