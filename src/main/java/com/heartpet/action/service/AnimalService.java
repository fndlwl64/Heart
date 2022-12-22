package com.heartpet.action.service;

import com.heartpet.model.AdoptRegDTO;
import com.heartpet.model.AnimalDTO;

public interface AnimalService {

	public void userInsert(AnimalDTO animalDTO, AdoptRegDTO adoptRegDTO);
}
