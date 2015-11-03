<%-- 
    Document   : principal
    Created on : 25/09/2015, 13:45:58
    Author     : Jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuarioLog" class="Modelo.Usuario" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset=UTF-8>
        <script language="javascript">
	    <% if (request.getParameter("msj") != null) {%>
	    <% if (request.getParameter("msj").equals("reservado")) {%>
	    alert('Su reserva se realizo con exito');
	    <%}%>
	    <% }%>
	    var titletext = "Bienvenidos a CinemaCenter!!!";
	    var repeat = true;
	    var index = 0;
	    var inicio = 0;
	    function scrolltitle() {
		if (index <= titletext.length && index <= 15) {
		    document.title = titletext.substring(0, index);
		    index++;
		    setTimeout('scrolltitle()', 200);
		}
		else if (index <= titletext.length && index >= 15) {
		    inicio++;
		    document.title = titletext.substring(inicio, index);
		    index++;
		    setTimeout('scrolltitle()', 200);
		}

		else {
		    index = 0;
		    inicio = 0;
		    if (repeat)
			setTimeout('scrolltitle()', 1000);
		}
	    }
	    window.onload = function () {
		if (!document.layers)
		    setTimeout('scrolltitle()', 1000);
	    }
        </script>
        <title> </title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>
	    $(document).ready(function () {
		$.get('ServletPelicula', {urlPage: "/principal.jsp"}, function (responseJson) {
		    $.each(responseJson, function (index, item) {
			var div = $('<div id=d1"' + index + '" class="col-sm-6 col-md-4">').appendTo($('#pelis'));
			var div1 = $('<div id=d2"' + index + '" class="thumbnail">').appendTo(div);
			$('<img id=img"' + index + '" src="img/' + item.urlImagen + '" alt="...">').appendTo(div1);
			var div2 = $('<div id=d3"' + index + '"  class="caption">').appendTo(div1);
			$('<h3>').text(item.nombre).appendTo(div2);
			var p = $('<p>').text(item.descripcion.substr(0, 200) + "...").appendTo(div2);
			$('<a href="reservar.jsp?id=' + item.idPelicula + '" class="btn btn-secondary" role="button">+ Ver Más</a>').appendTo(p);

			$(' <a href="reservar.jsp?id=' + item.idPelicula + '" class="btn btn-primary" role="button">Reservar</a> ').appendTo(div2);
		    });
		});
	    });
        </script>
    </head>
    <body>
        <div id="menu">  
            <jsp:include page="menu.jsp"/>
        </div>
        <h1 align= "center" >Peliculas</h1>       
        <div id="pelis" class="row">       
        </div>       
    </body>
</html>
