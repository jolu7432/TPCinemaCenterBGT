<%-- 
    Document   : CargaPeliculas
    Created on : Oct 3, 2015, 4:00:19 PM
    Author     : microtik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuarioLog" class="Modelo.Usuario" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de Peliculas</title>  
        <script>
            $(document).ready(function () {
                 $.post('ServletPelicula', {idPelicula: <%= request.getParameter("idPelicula")%>}, function (responseJson) {
                     if (<%= request.getParameter("idPelicula")%> != null) {
                        $.each(responseJson, function (index, item) {
                            $('#txtNombre').val(item.nombre);
                            $('#txtDirector').val(item.director);
                            $('#txtDuracion').val(item.duracion);
                            $('#txtDescripcion').val(item.descripcion);
                        });
                    }
                });
   
            });
            
        </script>
    </head>
    <body>   
        <jsp:include page="ServletValidaLoginRol" flush="true"/> 
        <form method="post" action="ServletPelicula"  enctype="multipart/form-data" accept-charset="UTF-8" class="form-signup">            
            <center><h1>Alta de Pelicula</h1></center>
            <div id="rcorners" class="container">
                <div class="form-group">
                    <label for="txtNombre">Nombre</label>
                    <input type="text" class="form-control" id="txtNombre" placeholder="Nombre" name="nombre" required autofocus>
                </div>
                <div class="form-group">
                    <label for="txtApellido">Director</label>
                    <input type="text" class="form-control" id="txtDirector" placeholder="Director" name="director" required>
                </div>
                <div class="form-group">
                    <label for="txtDuracion">Duracion</label>
                    <input type="text" class="form-control" id="txtDuracion" placeholder="Duracion" name="duracion" required>
                </div>
                <div class="form-group">
                    <label for="txtDescripcion">Descripcion</label>
                    <textarea class="form-control" id="txtDescripcion" placeholder="Descripcion..." name="descripcion" rows="5" required></textarea>
                </div>
                <div class="form-group">
                    <label for="UrlImagen"></label>
                    <input type="file" id="UrlImagen" name="urlImagen">
                    <p class="help-block">Cargue una imagen</p>
                </div>
                <button type="submit" id="guardarPeli" class="btn btn-primary btn-lg">Guardar</button>
     </div>
        </form>
     
    </body>
</html>
