package com.actividad.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.actividad.entidad.Marca;
import com.actividad.entidad.Medicamento;
import com.actividad.servicio.MarcaServicio;
import com.actividad.servicio.MedicamentoServicio;

@Controller
public class RegistraMedicamentoController {
	
	@RequestMapping("/verMedicamento")
	public String ver() {
		return "registraMedicamento";
	}
	
	
	@Autowired
	private MarcaServicio marcaServicio;
	
	@Autowired
	private MedicamentoServicio medicamentoServicio;
	
	
	@ResponseBody
	@RequestMapping("/listaMarca")
	public List<Marca> listaMarca(){
			return marcaServicio.listaMarca();
	}
	
	
	@ResponseBody
	@RequestMapping("/registraMedicamento")
	public Map<String, Object> registra(Medicamento obj){
			Map<String, Object> salida = new HashMap<String, Object>();
		
		Medicamento objSalida = medicamentoServicio.insertaMedicamento(obj);
		if(objSalida == null) {
			salida.put("MENSAJE", "Registro erróneo");
		}else {
			salida.put("MENSAJE", "Registro exitoso");
		}
		
		return salida;
		
		
	}
	
	
	@RequestMapping("/salida")
	public String salida() {
		return "registraMedicamento";
	}


}
