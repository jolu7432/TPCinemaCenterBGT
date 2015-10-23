<%-- 
    Document   : abmSala
    Created on : Oct 22, 2015, 8:57:50 PM
    Author     : microtik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ABM Salas</title>
    </head>
    <body>
       <jsp:include page="ServletValidaLoginRol?UrlPage=<%= request.getRequestURL()%>" flush="true"/> 
        <div id="menu">  
            <jsp:include page="menu.jsp"/>           
        </div> 
	<center><h1>Administrar Salas</h1></center>
    <input type="button" id="altaSala" value="Alta Sala"/><br>     
    <div id="formAltaSala"></div>         
    <div id="listadoSala">
        <jsp:include page="listadoSalas.jsp"/>
    </div>    
</body> 
<script>
    $('#altaSala').click(function () {
        if ($('#altaSala').val() == 'Cancelar') {
            $('#altaSala').val('Subir Sala');
            $('#formAltaSala').text('');
        } else {
            $('#altaSala').val('Cancelar');
            $('#formAltaSala').load('altaSala.jsp');
        }
    });  
</script>
    </body>
</html>
