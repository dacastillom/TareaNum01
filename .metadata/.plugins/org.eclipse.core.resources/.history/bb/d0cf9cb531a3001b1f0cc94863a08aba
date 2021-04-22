package com.actividad.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.actividad.entidad.Marca;
import com.actividad.repositorio.MarcaRepositorio;

@Service
public class MarcaServicioImpl implements MarcaServicio {
	@Autowired
	private MarcaRepositorio repositorio;

	@Override
	public List<Marca> listaMarca() {
		return repositorio.findAll();
	}

	
}
