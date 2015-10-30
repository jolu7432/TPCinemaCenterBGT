<%-- 
    Document   : error
    Created on : 08-oct-2015, 20:54:03
    Author     : Jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error 404</title>
    </head>
    <body>
        <div id="menu">  
            <jsp:include page="menu.jsp"/>           
        </div> 
        <h1><%= request.getParameter("msg")%></h1>
    </body>
</html>
