package com.tarea.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tarea.entity.Marca;

public interface MarcaRepository extends JpaRepository<Marca, Integer>{
	
}
