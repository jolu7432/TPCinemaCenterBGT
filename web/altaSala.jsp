<%-- 
    Document   : altaSala
    Created on : Oct 23, 2015, 9:14:49 AM
    Author     : microtik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Alta de Sala</title>  
	<script>
	    var global;
	    function cargarCamposForm(item) {
		$('#txtNumero').val(item.numSala);
		$('#txtColumnas').val(item.columna);
		$('#txtFilas').val(item.fila);
		$('#chkCine').val(item.cine.idCine);
	    }
	    $(document).ready(function () {

		$.post('ServletCargaComboBox', {Accion: "Cines"}, function (responseJson) {
		    $.each(responseJson, function (index, item) {
			$('<option value="' + item.idCine + '">').text(item.nombre).appendTo($('#chkCine'));
		    });
		});
		if (<%= request.getParameter("idSala")%> != null) {
		    $('[name=accion]').val('editar');
		    $('[name=idSalaEditar]').val(<%= request.getParameter("idSala")%>);
		    $.post('ServletSala', {idSala: <%= request.getParameter("idSala")%>}, function (responseJson) {
			$.each(responseJson, function (index, item) {
			    global = item;
			});
			setTimeout('cargarCamposForm(global)', 500);
		    });
		}

	    });
	</script>
    </head>
    <body>
        <jsp:include page="ServletValidaLoginRol?UrlPage=<%= request.getRequestURL()%>" flush="true"/> 
        <div id="rcorners" class="container">           
            <form method="post" action="ServletSala" >           
                <div class="col-md-8">
                    <center><h1>Alta de Cine</h1></center>
                    <div class="form-group col-md-2">
                        <label for="txtNumero">Numero de Sala</label>
                        <input type="text" class="form-control" id="txtNumero" placeholder="Numero" name="numero" required autofocus>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="txtColumnas">Cantidad de Columnas</label>
                        <input type="text" class="form-control" id="txtColumnas" placeholder="Columnas" name="columnas" required>
                    </div>
		    <div class="form-group col-md-2">
                        <label for="txtFilas">Cantidad de Filas</label>
                        <input type="text" class="form-control" id="txtFilas" placeholder="Filas" name="filas" required>
                    </div>
                </div>
		<br>
                <div class="col-md-10">
                    <div class="form-group">
                        <label for="txtCine">Cine</label>                      
                        <select class="form-control" id="chkCine" placeholder="Cine" name="cine" required>
                            <option value="">Seleccionar...</option> 
                        </select>
                    </div>
		    <input type="hidden" name="accion" value="guardar">
		    <input type="hidden" name="idSalaEditar" value="">
		    <button type="submit" class="btn btn-primary btn-lg">Guardar</button>
            </form>
        </div>
    </body>
</html>
