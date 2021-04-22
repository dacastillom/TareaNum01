package com.actividad.entidad;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tb_marca")
public class Marca {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cod_marca;
	private String nom_marca;
	
	
	
	//Metodos Get / Set
	
	public int getCod_marca() {
		return cod_marca;
	}

	public void setCod_marca(int cod_marca) {
		this.cod_marca = cod_marca;
	}

	public String getNom_marca() {
		return nom_marca;
	}

	public void setNom_marca(String nom_marca) {
		this.nom_marca = nom_marca;
	}


	
	



}
