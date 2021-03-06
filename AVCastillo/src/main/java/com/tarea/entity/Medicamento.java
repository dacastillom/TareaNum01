package com.tarea.entity;

import java.util.Date;

//import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

//import org.springframework.format.annotation.DateTimeFormat;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

//import lombok.Getter;
//import lombok.Setter;


@Entity
@Table(name ="tb_medicamento" )
public class Medicamento {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cod_med; //@Column(name = "cod_med")

	private String des_med;
	private double pre_med;
	private int can_med;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fecha_elab;

	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cod_marca")
	private Marca marca;
	
	
	
	public Marca getMarca() {
		return marca;
	}

	public void setMarca(Marca marca) {
		this.marca = marca;
	}

	public int getCod_med() {
		return cod_med;
	}

	public void setCod_med(int cod_med) {
		this.cod_med = cod_med;
	}

	public String getDes_med() {
		return des_med;
	}

	public void setDes_med(String des_med) {
		this.des_med = des_med;
	}

	public double getPre_med() {
		return pre_med;
	}

	public void setPre_med(double pre_med) {
		this.pre_med = pre_med;
	}

	public int getCan_med() {
		return can_med;
	}

	public void setCan_med(int can_med) {
		this.can_med = can_med;
	}

	public Date getFecha_elab() {
		return fecha_elab;
	}

	public void setFecha_elab(Date fecha_elab) {
		this.fecha_elab = fecha_elab;
	}
	
	
	//Llave foránea
	/*@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cod_marca") //se coloca la llave foránea de la tb_marca
	private Marca marca;*/
	
	
	
}