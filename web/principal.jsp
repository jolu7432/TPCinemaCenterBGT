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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <jsp:include page="menu.jsp"/>
        <h1>Entraste</h1>
        <%= usuarioLog.getNombre()%>
        <%= usuarioLog.getPass()%>
  
    </body>
</html>
