<%-- 
    Document   : reservar
    Created on : 22/10/2015, 21:13:19
    Author     : Hernan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reserva</title>
    </head>
    <body>        
        <jsp:include page="menu.jsp"></jsp:include>
        <jsp:include page="ServletValidaLoginRol?UrlPage=<%= request.getRequestURL()%>" flush="true"/> 
        
        
    </body>   
</html>
