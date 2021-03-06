<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Tarea Virtual N?01 - Mejorado - David Castillo Monz?n </title>
</head>
<body>

<div class="container">
<h1>Registra Medicamento</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />
	
	<form action="registraMedicamento" id="id_form" method="post"> <!-- No ovlidar el action que ser?a un URL -->
			
			<!-- <div class="form-group">
				<label class="control-label" for="id_codigo">C?digo</label>
				<input class="form-control" type="text" id="id_codigo" name="cod_med" placeholder="Ingrese el Codigo" maxlength="5">    
			</div> -->
			
			<div class="form-group">
				<label class="control-label" for="id_descripcion">Descripci?n</label>
				<input class="form-control" type="text" id="id_descripcion" name="des_med" placeholder="Ingrese descripci?n" maxlength="50" pattern="">    <!-- name = nombre de atributo -->
			</div>
			
			<div class="form-group">
				<label class="control-label" for="id_precio">Precio</label>
				<input class="form-control" type="text" pattern="^\d{0,9}(\.\d{2})$" id="id_precio" name="pre_med" placeholder="Ingrese el precio" maxlength="7">    
			</div>
			
			<div class="form-group">
				<label class="control-label" for="id_cantidad">Cantidad</label>
				<input class="form-control" type="text" id="id_cantidad" name="can_med" placeholder="Ingrese cantidad" maxlength="2">    
			</div>
			
			<div class="form-group">
				<label class="control-label" for="id_fecha">Fecha de Elaboraci?n</label>
				<input class="form-control" type="text" id="id_fecha" name="fecha_elab" placeholder="Ingrese la fecha YYYY-MM-DD" maxlength="100">    
			</div>
		
		
			
			<div class="form-group">
				<label class="control-label" for="id_marca">Marca</label>
				<select id="id_marca" name="marca.cod_marca" class="form-control">
					<option value=" ">[Seleccione]</option>
				</select>
				
			</div>
			

			
			<div class="form-group">
				<button id="id_registrar" type="button" class="btn btn-primary" >Registra Medicamento</button>  <!-- Semana 2: id="id_registrar" type="button" -->
			</div>
	</form>
</div>


<script type="text/javascript">
$.getJSON("listaMarca", {}, function(data){
	console.log("este es un mensaje para validar XD",data)
	$.each(data, function(index,item){
		$("#id_marca").append("<option value="+ item.cod_marca + ">"+ item.nom_marca +"</option>");
	});
});



</script>


<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>





<!-- 
	https://mkyong.com/tutorials/java-regular-expression-tutorials/

 -->
<script type="text/javascript">

$("#id_registrar").click(function () {	
	
	var validator = $('#id_form').data('bootstrapValidator');
	validator.validate(); 						//aplica las validaciones

	if (validator.isValid()){
		$.ajax({ 								//el Ajax no refresca toda la p?gina sino sectores que yo decida dentro.
			type: 'POST' ,
			data: $("#id_form").serialize(), 	//el id del form
			url: 'registraMedicamento', 				//se llama al return del @RequestMapping del controlador
			success: function (data){
				clear();
				mostrarMensaje(data.MENSAJE);   // en los recursos de js tenemos global.js y existe una funciones mostraMensaje. El atributo mensaje proviene del controlador
				validator.resetForm();
				
			},
			error: function (){
				mostrarMensaje(MSG_ERROR);
			},
		}); 
			 
	}
	
});   


//Se limpia los campos
function clear(){
	$("#id_codigo").val('');
	$("#id_descripcion").val('');
	$("#id_precio").val('');
	$("#id_cantidad").val('');
	$("#id_fecha").val('');
	$("#id_marca").val('');

	
}


//Se ejecuta la validaci?n
$(document).ready(function() {
	
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	/*cod_med:{
                    selector: "#id_codigo",
                    validators:{
                        notEmpty: {
                             message: 'El codigo es obligatorio'
                        },
                        stringLength: {
                            min: 5,
                            max: 5,
                            message: 'El c?digo es de 5 caracteres'
                        },
                    }
                },*/
                des_med:{
                    selector: "#id_descripcion",
                    validators:{
                        notEmpty: {
                             message: 'La descripcion es obligatoria'
                        },
                        stringLength: {
                            min: 8,
                            max: 50,
                            message: 'La descripci?n debe estar entre 8 y 50 caracteres'
                        },
                    }
                },
                pre_med:{
                    selector: "#id_precio",
                    validators:{
                        notEmpty: {
                             message: 'El precio es obligatorio'
                        },
                        regexp: {
                            regexp: /^\d{0,9}(\.\d{2})?$/,
                            message: 'El precio debe contener 2 decimales'
                        }
                    }
                },
                can_med:{
                    selector: "#id_cantidad",
                    validators:{
                        notEmpty: {
                             message: 'La cantidad es obligatoria'
                        },
                        stringLength: {
                            min: 1,
                            max: 2,
                            message: 'La cantidad m?xima es de 99'
                        },
                    }
                },
                fecha_elab:{
                    selector: "#id_fecha",
                    validators:{
                    	notEmpty: {
                            message: 'La fecha de elaboraci?n es obligatorio'
                       },
                       regexp: {
                           regexp: /((?:19|20)[0-9][0-9])-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])/,
                           message: 'A?o/Mes/D?a'
                       }
                   }
               },
               /*precio:{
                   selector: "#id_precio",
                   validators:{
                       notEmpty: {
                            message: 'El precio es obligatorio'
                       },
                       regexp: {
                           regexp: /^\d{0,9}(\.\d{2})?$/,
                           message: 'El precio debe contener 2 decimales'
                       }
                   }
               },*/
               marca:{
                   selector: "#id_marca",
                   validators:{
                       notEmpty: {
                            message: 'Seleccione una marca'
                       },
                   }
               },
              
        }   
    });


    // Validate the form manually
    //$('#validateBtn').click(function() {
       // $('#id_form').bootstrapValidator('validate');
    //});
});
</script>

</body>
</html>




