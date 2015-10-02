<%-- 
    Document   : Prueba
    Created on : Oct 2, 2015, 10:27:50 AM
    Author     : microtik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="testplagio">
            nombre: <input type="text" name="nombre"><br><br>
            apellido: <input type="text" name="apellido"><br><br>
            DNI: <input type="text" name="dni"><br><br>
            Es Administrador <input type="radio" name="adm"><br><br>
            Usuario: <input type="text" name="user"><br><br>
            Password: <input type="password" name="pass"><br><br>
            Email: <input type="text" name="email"><br><br>
            Telefono: <input type="text" name="telefono"><br><br>
            <input type="submit" value="registrar">            
        </form>
    </body>
</html>
