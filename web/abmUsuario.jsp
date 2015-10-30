<%-- 
    Document   : abmUsuarios
    Created on : Oct 9, 2015, 11:39:47 AM
    Author     : microtik
--%>

<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuarioLog" class="Modelo.Usuario" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ABM Usuarios</title>
    </head>
    <body>
        <jsp:include page="ServletValidaLoginRol?UrlPage=<%= request.getRequestURL()%>" flush="true"/> 
        <div id="menu">  
            <jsp:include page="menu.jsp"/>           
        </div> 
    <center><h1>Administrar Usuarios</h1></center>
    <input type="button" id="altaUsuario" value="Subir Usuario"/><br>     
    <div id="formAltaUsuario"></div>         
    <div id="listadoUsuarios">
        <jsp:include page='listadoUsuarios.jsp'/>
    </div> 
  
</body>
<script>   
    $('#altaUsuario').click(function () {
        if ($('#altaUsuario').val() == 'Cancelar') {
            $('#altaUsuario').val('Subir Usuario');
            $('#formAltaUsuario').text('');
        } else {
            $('#altaUsuario').val('Cancelar');
            $('#formAltaUsuario').load('altaUsuario.jsp');
        }
    });   
</script>
<div id="errorUser"><h1 align= "center" ><%if(request.getParameter("errorUser") !=null)%><%=request.getParameter("errorUser")%></h1></div>
</html>
