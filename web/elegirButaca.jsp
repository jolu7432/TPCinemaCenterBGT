<%-- 
    Document   : elegirButaca
    Created on : 29-oct-2015, 13:33:20
    Author     : Jorge, Hernan y Bruno :)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuarioLog" class="Modelo.Usuario" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body align="center">
        <%--    <jsp:include page="ServletValidaLoginRol?UrlPage=<%= request.getRequestURL()%>" flush="true"/> --%>
        <div id="menu">  
            <jsp:include page="menu.jsp"/>           
        </div> 
        <h1>Elegir Butaca</h1>
        <form method="post" action="#">
            <div class="row">
                <div class="col-md-12">
                   <center><div class="col-md-10" id="salita">
		       </div></center>>
                    <div class="col-md-2">
                    </div>
                </div>
            </div>
            <input type="button" id="reservar" value="Hacer Reserva">
        </form>
    </body>
    <script>
	var funcion;
	var butacasOcupadas = [];
	var butacasReservadas = [];
	function recargar() {
	    location.href = "/TPCinemaCenterBGT/principal.jsp?msj=reservado";
	}
	function traerFuncion(idFuncion)
	{
	    $.post('ServletFuncion', {idFuncion: idFuncion}, function (responseJson) {
		$.each(responseJson, function (index, item) {
		    funcion = item;
		    var numButaca = 0;
		    for (i = 0; i < item.sala.fila; i++) {
			$('<br>').appendTo($('#salita'));
			var tr = $('<tr>').appendTo($('#salita'));
			for (f = 0; f < item.sala.columna; f++) {
			    var td = $('<td>').appendTo(tr);
			    numButaca++;
			    $('<img id=' + numButaca + ' src="img/butacaD.png" class="reservar">').appendTo(td);
			}
		    }
		});
	    });
	}
	;
	function traerReservas() {
	    $.post('ServletReservar', {idFuncion: <%= request.getParameter("idFuncion")%>}, function (responseJson) {
		$.each(responseJson, function (index, item) {
		    for (i = 0; i < funcion.sala.fila; i++) {
			//$('<br>').appendTo($('#salita'));
			//var tr = $('<tr>').appendTo($('#salita'));
			for (f = 0; f < funcion.sala.columna; f++) {
			    //var td = $('<td>').appendTo(tr);
			    $('#' + item.butaca).attr("src", "img/butacaOcu.png");
			    butacasOcupadas.push(item.butaca);
			}
		    }
		});
	    });
	}
	;
	$(document).ready(function () {
	    setTimeout('traerFuncion(<%= request.getParameter("idFuncion")%>)',200);
	    //setTimeout('console.log(funcion)', 500);
	    setTimeout('traerReservas()', 200);
	    $('#reservar').click(function () {
		if (butacasReservadas.length == 0) {
		    alert('Debe seleccionar alguna butaca!!!');
		} else {
		    var id = "";
		    $.each(butacasReservadas, function (ind, elem) {
			id += elem + '-';
		    });
		    $.post('ServletReservar', {ReservaButacas: id, idFuncion: <%= request.getParameter("idFuncion")%>, user: <%=usuarioLog.getId()%>}, function (vacio) {
		    });
		    setTimeout('recargar()', 500);
		}
	    });
	});
	$('#salita').on('click', '.reservar', function () {
	    if ($(this).attr('src') == "img/butacaRes.png") {
		$('#' + this.id).attr("src", "img/butacaD.png");
		butacasReservadas.pop(this.id);
	    } else {
		if (verificarButaca(this.id)) {
		    $('#' + this.id).attr("src", "img/butacaRes.png");
		    butacasReservadas.push(this.id);
		}
	    }
	});
	function verificarButaca(id) {
	    var resp = true;
	    $.each(butacasOcupadas, function (ind, elem) {
		if (id == elem) {
		    resp = false
		}
	    });
	    return resp;
	}
    </script>
    <style>
        .reservar{
        }               
    </style>

</html>