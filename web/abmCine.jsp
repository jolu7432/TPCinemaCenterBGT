<%-- 
    Document   : abmCine
    Created on : 14-oct-2015, 20:14:37
    Author     : hernan
--%>

<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuarioLog" class="Modelo.Usuario" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ABM Cine</title>       
    </head>
    <body> 
        <jsp:include page="ServletValidaLoginRol?UrlPage=<%= request.getRequestURL()%>" flush="true"/>  
        <div id="menu">  
            <jsp:include page="menu.jsp"/>           
        </div> 
    <center><h1>Administrar Cines</h1></center>
    <input type="button" id="altaCine" value="Alta Cine"/><br>     
    <div id="formAltaCine"></div>         
    <div id="listadoCines">
        <jsp:include page="listadoCines.jsp"/>
    </div>    
</body> 
<script>
    $('#altaCine').click(function () {
        if ($('#altaCine').val() == 'Cancelar') {
            $('#altaCine').val('Subir Cine');
            $('#formAltaCine').text('');
        } else {
            $('#altaCine').val('Cancelar');
            $('#formAltaCine').load('altaCine.jsp');
        }
    });  
</script>
</html>
