package com.actividad.repositorio;



import org.springframework.data.jpa.repository.JpaRepository;

import com.actividad.entidad.Marca;

public interface MarcaRepositorio extends JpaRepository<Marca, Integer> {
	


}
