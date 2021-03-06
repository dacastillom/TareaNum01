package com.tarea.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tarea.entity.Marca;
import com.tarea.entity.Medicamento;
import com.tarea.service.MarcaService;
import com.tarea.service.MedicamentoService;

/*1° Colocar anotación @Controller*/

@Controller
public class MedicamentoController {

	/*2° Llamar al .jsp*/
	@RequestMapping("/verMedicamento") /*nombre o sobrenombre, es una petición*/
	public String ver() {
		return "registraMedicamento";
	}
	
	
	
	
	
	@Autowired
	private MarcaService marcaService;
	
	@Autowired
	private MedicamentoService medicamentoService;
	
	
	
	@ResponseBody
	@RequestMapping("/listaMarca")
	public List<Marca> listaMarca(){
		return marcaService.listaMarca();
	}
	
	/*@RequestMapping("/insertaMedicamento")
	public String regMedicamento(Medicamento med, HttpSession sesion) {
		Medicamento objSalida = medicamentoService.insertaMedicamento(med);
		if(objSalida == null) {
			sesion.setAttribute("MENSAJE", "Error al insertar");
		}else {
			sesion.setAttribute("MENSAJE", "Registro exitoso");
		}
		
		return "redirect:salida";
		
	}*/
	
	@ResponseBody
	@RequestMapping("/registraMedicamento")
	public Map<String, Object> registra(Medicamento med){
		Map<String, Object> salida = new HashMap<String, Object>();
		
		Medicamento objSalida = medicamentoService.insertaMedicamento(med);
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
