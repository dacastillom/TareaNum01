package com.tarea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tarea.entity.Marca;
import com.tarea.repository.MarcaRepository;

@Service
public class MarcaServiceImpl implements MarcaService{

	@Autowired
	private MarcaRepository repository;
	
	@Override
	public List<Marca> listaMarca() {
		return repository.findAll();
	}

	
}