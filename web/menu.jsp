<%-- 
    Document   : menu
    Created on : 02/10/2015, 11:06:55
    Author     : Jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuarioLog" class="Modelo.Usuario" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String aux = usuarioLog.getUser();
            if (aux.equals("jolu7432")) {%>
        <div class="dropdown">
            <h1>Jorge</h1> 
            <button type="button">Menú desplegable</button>

        </div> 
        <% }else {%>
        <div class="dropdown">
            <h1>Hernan</h1> 
            <button type="button">Menú desplegable</button>

        </div> 
        <% }%>
    </body>
</html>
