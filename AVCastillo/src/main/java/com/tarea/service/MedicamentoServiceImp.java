package com.tarea.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tarea.entity.Medicamento;
import com.tarea.repository.MedicamentoRepository;

@Service
public class MedicamentoServiceImp implements MedicamentoService{
	
	@Autowired
	private MedicamentoRepository repository;

	@Override
	public Medicamento insertaMedicamento(Medicamento med) {
		return repository.save(med);
	}

	
}
