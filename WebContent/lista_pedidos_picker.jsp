<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<LINK REL=StyleSheet HREF="css/estilos.css" TYPE="text/css" MEDIA=screen>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">


<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="p-3 mb-2 bg-light text-dark">

	<h6>
		<ins>
			<b>BIENVENIDO:</b>
		</ins>
		<mark>${usuario}</mark>
	</h6>

	<div>
		<br> <a class="btn btn-primary" data-toggle="collapse"
			href="login.jsp" role="button" aria-expanded="false"
			aria-controls="collapseExample"> Cerrar sesion </a>
	</div>


	<div class="table-responsive">
		<!-- SE PUEDE QUITAR LO RESPONSIVE -->

		<table border="1" id="table" class="table">
			<!-- TAMBIEN EL CLASS -->
			<thead>
				<tr>
					<td align="center"><b>N� de pedido</b></td>
					<td align="center"><b>Estado</b></td>
				</tr>
			</thead>
			<c:forEach var="pedido" items="${lista}">
				<tr id="celda" onclick="cambiar_color_over(this)">
					<td class="num_pedido" align="center" style="font-weight: bold"><c:out
							value="${ pedido.num_pedido}"></c:out></td>
					<td align="center"><c:out value="${ pedido.estado}"></c:out></td>
				</tr>

			</c:forEach>
		</table>

	</div>

	<div
		class="card-body d-flex justify-content-between align-items-center">
		<button type="button" class="btn btn-info" id="a-submit">Preparar</button>
		<button type="button" class="btn btn-danger" id="cancel"
			onclick="actualizar_pagina();">Cancelar</button>
	</div>

	<!-- 	<div> -->
	<!-- 		<button type="button" class="btn btn-info" id="a-submit">Preparar</button> -->
	<!-- 	</div> -->

	<div>
		<br>
		<footer class="blockquote-footer">Creado por A.T. Ribeiro</footer>
	</div>
	<!-- 	<a class="btn btn-primary blue-background-white" data-toggle="collapse" role="button" -->
	<!-- 		aria-expanded="false" aria-controls="collapseExample" id="a-submit"> -->
	<!-- 		PREPARAR </a> -->

	<script type="text/javascript">
	
		document.body.style.zoom="300%"
		
		function actualizar_pagina() {
			
			location.reload();			
			
		}
		
	</script>

	<script type="text/javascript">		
				
		if ("${bandera}" == 2) {
	
			alert('SESION CORRECTA');		
				
		}			
	</script>

	<script type="text/javascript">
	
		var selected_rows = []
		
		$("table tr").click(function() {
			
 	 		let clicked_row = $(this)
  	
  			if (clicked_row.hasClass('selected')) {
   		 		clicked_row.removeClass('selected')
  			} else {
    			clicked_row.addClass('selected')
  			}
		});

		$('#a-submit').click(function() {
			
			var con = 0;
			var num = "", num2 = "", num3 = "", num4 = "", num5 = "";
			
  			data = []
  			selections = $('.selected')
  			selections.each((index, element) => {
    			let row_content = {
      				num_pedido : $(element).find('.num_pedido').text(),     
       			} 
    			
    			if (con == 0) {
    				
    				num = $(element).find('.num_pedido').text()
    				
    				con = con + 1;
    				    				
    			} else if (con == 1) {
    				
    				num2 = $(element).find('.num_pedido').text()
    				
    				con = con + 1;
    				
    			} else if (con == 2) {
    				
    				num3 = $(element).find('.num_pedido').text()
    				
    				con = con + 1;
    				
    			} else if (con == 3) {
    				
    				num4 = $(element).find('.num_pedido').text()
    				
    				con = con + 1;
    				
    			} else if (con == 4) {
    				
    				num5 = $(element).find('.num_pedido').text()
    				
    				con = con + 1;
    				
    			}    			
    			    			
    		data.push(row_content)      		
    		  			    		    		
  			})  
  			
  			console.log("CONTADOR: "+con)
  			
				if (con == 1) {
				
					var parametro = num;
				    				
				} else if (con == 2) {
					
					var parametro = num + ", " + num2;
								
				} else if (con == 3) {
				
					var parametro =	num + ", " + num2 + ", " + num3;
				
				} else if (con == 4) {
				
					var parametro = num + ", " + num2 + ", " + num3 + ", " + num4;
				
				} else if (con == 5) {
				
					var parametro = num + ", " + num2 + ", " + num3 + ", " + num4 + ", " + num5;
				}	
  			 			
  			//console.log(data.toString().replace(/[^a-zA-Z ]/g, ""));
  			  			
  			console.log(parametro);
        		
  			location.href = "controller?seleccion=lista_pedidos_picker_entrada"+","+con+","+parametro;
    
		})

	</script>

	<script type="text/javascript">
	
		function cambiar_color_over(celda) {
		   celda.style.backgroundColor="#ab2a3e";
		   celda.style.color="#ebeae4";
		   		   
		}
		
	</script>



</body>
</html>