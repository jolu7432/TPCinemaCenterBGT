<%-- 
    Document   : abmFunciones
    Created on : 14-oct-2015, 18:08:26
    Author     : Jorge
--%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuarioLog" class="Modelo.Usuario" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ABM Funcion</title>       
    </head>
    <body> 
        <jsp:include page="ServletValidaLoginRol" flush="true"/> 
        <div id="menu">  
            <jsp:include page="menu.jsp"/>           
        </div> 
    <center><h1>ACA VA UN TITULO DESCRIPTIVO</h1></center>
    <input type="button" id="altaFuncion" value="Alta Funcion"/><br>     
    <div id="formAltaFuncion"></div>         
    <div id="listadoFunciones">
        <jsp:include page="listadoFunciones.jsp"/>
    </div>    
</body> 
<script>
    $('#altaFuncion').click(function () {
        if ($('#altaFuncion').val() == 'Cancelar') {
            $('#altaFuncion').val('Alta Funcion');
            $('#formAltaFuncion').text('');
        } else {
            $('#altaFuncion').val('Cancelar');
            $('#formAltaFuncion').load('altaFuncion.jsp');
        }
    });  
</script>
</html>
