package com.actividad.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.actividad.entidad.Medicamento;
import com.actividad.repositorio.MedicamentoRepositorio;

@Service
public class MedicamentoServicioImpl implements MedicamentoServicio {

	@Autowired
	private MedicamentoRepositorio repositorio;
	
	@Override
	public Medicamento insertaMedicamento(Medicamento obj) {
		return repositorio.save(obj) ;
	}
	

}
