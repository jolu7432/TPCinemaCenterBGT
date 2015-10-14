<%-- 
    Document   : altaCine
    Created on : 14-oct-2015, 20:16:21
    Author     : herna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuarioLog" class="Modelo.Usuario" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Alta de Cines</title>  
    <script>
        $(document).ready(function () {
            $.post('ServletCine', {idCine: <%= request.getParameter("idCine")%>}, function (responseJson) {
                if (<%= request.getParameter("idPelicula")%> != null) {
                    $.each(responseJson, function (index, item) {
                        $('#txtNombre').val(item.nombre);
                        $('#txtDireccion').val(item.direccion);
                    });
                }
            });

        });
    </script>
</head>
    <body>   
        <jsp:include page="ServletValidaLoginRol" flush="true"/> 
        <div id="rcorners" class="container">           
            <form method="post" action="ServletPelicula" enctype="multipart/form-data" >           
                <div class="col-md-8">
                    <center><h1>Alta de Pelicula</h1></center>
                    <div class="form-group col-md-2">
                        <label for="txtNombre">Nombre</label>
                        <input type="text" class="form-control" id="txtNombre" placeholder="Nombre" name="nombre" required autofocus>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="txtApellido">Direccion</label>
                        <input type="text" class="form-control" id="txtDireccion" placeholder="Dirección" name="dirección" required>
                    </div>
                    
                    <button type="submit" class="btn btn-primary btn-lg">Guardar</button>
                </div> 
            </form>
        </div>

    </body>
</html>
