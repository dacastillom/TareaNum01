package com.tarea.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tarea.entity.Medicamento;

public interface MedicamentoRepository extends JpaRepository<Medicamento, Integer>{

	
}
