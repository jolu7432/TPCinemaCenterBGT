<%-- 
    Document   : altaUsuario
    Created on : Oct 14, 2015, 5:58:19 PM
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
        <jsp:include page="ServletValidaLoginRol?UrlPage=<%= request.getRequestURL()%>" flush="true"/> 
        <form method="post" action="ServletUsuario" enctype="multipart/form-data" class="form-signup">
            <center><h1>Registro de usuario</h1></center>
            <div id="rcorners" class="container">
                <div class="form-group">
                    <label for="txtNombre">Nombre</label>
                    <input type="text" class="form-control" id="txtNombre" placeholder="Nombre" name="nombre" required autofocus>
                </div>
                <div class="form-group">
                    <label for="txtApellido">Apellido</label>
                    <input type="text" class="form-control" id="txtApellido" placeholder="Apellido" name="apellido" required>
                </div>
                <div class="form-group">
                    <label for="txtDNI">DNI</label>
                    <input type="text" class="form-control" id="txtDNI" placeholder="DNI" name="dni" required>
                </div>
                <div class="form-group" id="chkAdm">
                    <label for="chkAdm">Administrador?</label><input type="checkbox" class="form-control" id="chkAdm" name="administrador">
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
                    <input type="file" id="UrlImagen" name="urlImagen" value="">
                    <p class="help-block">Cargue una imagen</p>
                    <input type="hidden" id="ImgDefecto" name="imgdefecto" value="default-user.png">
                </div>
                <button type="submit" class="btn btn-primary btn-lg">Cargar</button>
            </div>
        </form>
    </body>
    <script>
        $(document).ready(function () {
            $.post('ServletUsuario', {id: <%= request.getParameter("id")%>}, function (responseJson) {
                if (<%= request.getParameter("id")%> != null) {
                    $.each(responseJson, function (index, item) {
                        $('#txtNombre').val(item.nombre);
                        $('#txtApellido').val(item.apellido);
                        $('#txtDNI').val(item.dni);
                        $('#chkAdm  input[type=checkbox]').prop('checked', item.administrador);
                        $('#txtUsuario').val(item.user);
                        $('#txtPass').val(item.pass);
                        $('#txtEmail').val(item.email);
                        $('#txtTel').val(item.telefono);
                        $('#UrlImagen').val(item.urlImg);
                    });
                }
            });
        });
    </script>
</html>
