<%-- 
    Document   : abmPelicula
    Created on : 02-oct-2015, 23:57:20
    Author     : Jorge
--%>

<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuarioLog" class="Modelo.Usuario" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ABM Pelicula</title>       
    </head>
    <body>       
        <div id="menu">  
            <jsp:include page="menu.jsp"/>           
        </div> 
    <center><h1>ACA VA UN TITULO DESCRIPTIVO</h1></center>
    <input type="button" id="altaPelicula" value="Subir Pelicula"/><br>     
    <div id="formAltaPelicula"></div>         
    <div id="listadoPeliculas">
        <jsp:include page="listadoPeliculas.jsp"/>
    </div>    
</body> 
<script>
    $('#altaPelicula').click(function () {
        if ($('#altaPelicula').val() == 'Cancelar') {
            $('#altaPelicula').val('Subir Pelicula');
            $('#formAltaPelicula').text('');
        } else {
            $('#altaPelicula').val('Cancelar');
            $('#formAltaPelicula').load('altaPelicula.jsp');
        }
    });
</script>
</html>
