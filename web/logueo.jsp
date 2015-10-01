<%-- 
    Document   : Logeo
    Created on : 18/09/2015, 16:58:16
    Author     : Jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Logueo</h1>
        <form method="post" action="ValidaLogin">
            Usuario:<input type="text" name="user"><br><br>
            Password<input type="password" name="pass"><br><br>
            <input type="submit" value="Ingresar">            
        </form>
    </body>
</html>
