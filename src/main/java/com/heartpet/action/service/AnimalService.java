package com.heartpet.action.service;

import com.heartpet.model.AdoptRegDTO;
import com.heartpet.model.AnimalDTO;
import com.heartpet.model.WishDTO;

public interface AnimalService {

	public void insert(AnimalDTO animalDTO, AdoptRegDTO adoptRegDTO);
	public void update(AnimalDTO animalDTO, AdoptRegDTO adoptRegDTO);
	public void adoptRegUpdate(AdoptRegDTO adoptRegDTO);
}
