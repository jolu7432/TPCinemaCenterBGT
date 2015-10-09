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
        <title>Alta de Usuarios</title>      
    </head>
    <body>  
        <div id="menu">  
            <jsp:include page="menu.jsp"/>
        </div>
        <form method="post" action="ServletRegistro" enctype="multipart/form-data" class="form-signup">
            <center><h1>Registro de usuario</h1></center>
            <div id="rcorners" class="container">
                <div class="form-group">
                    <label for="txtNombre">Nombre</label>
                    <input type="text" class="form-control" id="txtNombre" placeholder="Nombre" name="nombre" required autofocus>
                </div>
                <div class="form-group">
                    <label for="txtApellido">Apellido</label>
                    <input type="text" class="form-control" id="txtApeliido" placeholder="Apellido" name="apellido" required>
                </div>
                <div class="form-group">
                    <label for="txtDNI">DNI</label>
                    <input type="text" class="form-control" id="txtDNI" placeholder="DNI" name="dni" required>
                </div>              
                <div class="form-group">
                    <label for="txtUsuario">Usuario</label>
                    <input type="text" class="form-control" id="txtUsuario" placeholder="Usuario" name="user" required>
                </div>
                <div class="form-group">
                    <label for="txtPass">Password</label>
                    <input type="Password" class="form-control" id="txtPass" placeholder="Password" name="pass" required>
                </div>
                <div class="form-group">
                    <label for="txtEmail">Email</label>
                    <input type="Email" class="form-control" id="txtEmail" placeholder="Email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="txtTel">Telefono</label>
                    <input type="text" class="form-control" id="txtTel" placeholder="Telefono" name="telefono">
                </div>
                <div class="form-group">
                        <label for="UrlImagen"></label>
                    <input type="file" id="UrlImagen" name="urlImagen">
                    <p class="help-block">Cargue una imagen</p>
                </div>
                <button type="submit" class="btn btn-primary btn-lg">Registrate</button>
            </div>
        </form>
    </body>
</html>
