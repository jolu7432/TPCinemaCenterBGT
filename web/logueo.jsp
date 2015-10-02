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
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="bootstrap/css/style.css" rel="stylesheet">

    </head>
    <body>
        <div class="navbar-fixed-top"> 
                <form class="navbar-form" action="ValidaLogin" method="post">
                    <div class="navbar-header">
                        <h1>CinemaCenter</h1>
                    </div>
                        <div class="navbar-right navbar-">
                            <label for="inputUsuario" >Usuario</label>
                            <input type="text" id="inputUsuario" name="user"  class="form-control" placeholder="Ingrese usuario" required autofocus>

                            <label for="inputPassword" >Contraseña: </label>
                            <input type="password" name="pass" id="inputPassword" class="form-control" placeholder="Contraseña" required>

                            <button class="navbar-btn btn-primary " type="submit" name="Ingresar" >Ingresar</button>
                        </div>
                </form>
            
        </div>
    </body>
</html>
