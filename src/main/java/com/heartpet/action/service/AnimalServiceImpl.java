package com.heartpet.action.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.heartpet.action.AdoptRegDAO;
import com.heartpet.action.AnimalDAO;
import com.heartpet.model.AdoptRegDTO;
import com.heartpet.model.AnimalDTO;

@Service
@Transactional
public class AnimalServiceImpl implements AnimalService{
	@Autowired
	AnimalDAO animalDAO;
	@Autowired
	AdoptRegDAO adoptRegDAO;
	
	
	@Override
	public void userInsert(AnimalDTO animalDTO, AdoptRegDTO adoptRegDTO) {
		adoptRegDAO.insert(adoptRegDTO);
		animalDAO.insert(animalDTO);
	}
	
	
}
