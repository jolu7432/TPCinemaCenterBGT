<%-- 
    Document   : altaFuncion
    Created on : 14-oct-2015, 18:09:38
    Author     : Jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuarioLog" class="Modelo.Usuario" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de Funciones</title>  
        <script>
            $(document).ready(function () {
                $.post('ServletFuncion', {idFuncion: <%= request.getParameter("idFuncion")%>}, function (responseJson) {
                    if (<%= request.getParameter("idFuncion")%> != null) {
                        $.each(responseJson, function (index, item) {
                            $('#txtFechaYHora').val(item.fechaYHora);
                            $('#txtPrecio').val(item.precio);
                            $('#txtDuracion').val(item.duracion);
                            $('#txtCine').val(item.sala.cine.nombre);
                            $('#txtSala').val(item.numSala);
                            $('#txtPelicula').val(item.pelicula.nombre);                            
                        });
                    }
                });
            });
        </script>
    </head>
    <body>   
        <jsp:include page="ServletValidaLoginRol" flush="true"/> 
        <div id="rcorners" class="container">           
            <form method="post" action="ServletFuncion" >           
                <div class="col-md-8">
                    <center><h1>Alta de Funciones</h1></center>
                    <div class="form-group col-md-2">
                        <label for="txtFechaYHora">Fecha y Hora</label>
                        <input type="text" class="form-control" id="txtFechaYHora" placeholder="FechaYHora" name="fechaYHora" required autofocus>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="txtPrecio">Precio</label>
                        <input type="text" class="form-control" id="txtPrecio" placeholder="Precio" name="precio" required>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="txtDuracion">Duracion</label>
                        <input type="text" class="form-control" id="txtDuracion" placeholder="Duracion" name="duracion" required>
                    </div>
                </div>
                <br>
                <div class="col-md-10">
                    <div class="form-group">
                        <label for="txtCine">Cine</label>
                        <input type="select" class="form-control" id="txtCine" placeholder="Cine" name="cine" required>
                    </div>                
                   <div class="form-group">
                        <label for="txtSala">Sala</label>
                        <input type="select" class="form-control" id="txtSala" placeholder="Sala" name="sala" required>
                    </div>
                    <div class="form-group">
                        <label for="txtPelicula">Sala</label>
                        <input type="select" class="form-control" id="txtPelicula" placeholder="Pelicula" name="pelicula" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-lg">Guardar</button>
                </div> 
            </form>
        </div>

    </body>
</html>
