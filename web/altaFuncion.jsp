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
        <link href="bootstrap/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css"/>

        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap-datetimepicker.js" type="text/javascript"></script>
        <script src="bootstrap/js/locales/bootstrap-datetimepicker.ar.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $(".form_datetime").datetimepicker({format: 'yyyy-mm-dd hh:ii'});
                $.post('ServletFuncion', {idFuncion: <%= request.getParameter("idFuncion")%>}, function (responseJson) {
                    if (<%= request.getParameter("idFuncion")%> != null) {
                        $.each(responseJson, function (index, item) {
                            var formattedDate = new Date(item.fechaYHora);
                            var y = formattedDate.getFullYear();
                            var m = formattedDate.getMonth();
                            var d = formattedDate.getDate();
                            var h = formattedDate.getHours();
                            var min = formattedDate.getMinutes();
                            m += 1;  // JavaScript months are 0-11         
                            $('#txtFechaYHora').val(y + "-" + m + "-" + d + " " + h + ":" + min);
                            $('#txtPrecio').val(item.precio);
                            $('#txtDuracion').val(item.duracion);
                            $('#txtCine').val(item.sala.cine.nombre);
                            $('#txtSala').val(item.sala.numSala);
                            $('#txtPelicula').val(item.pelicula.nombre);
                        });
                    }
                });
                $('#prueba').click(function(){
                    console.log( $('#txtFechaYHora').val());
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
                    <div class="form-group col-md-3">
                        <label for="txtFechaYHora">Fecha y Hora</label>     
                        <input size="20" type="text" class="form_datetime form-control" id="txtFechaYHora" placeholder="Fecha Y Hora" name="fechaYHora" required>           
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
                        <label for="txtPelicula">Pelicula</label>
                        <select class="form-control" id="txtPelicula" placeholder="Pelicula" name="pelicula" required>
                            <option value="">Seleccionar...</option>      
                            <option value="Peli">Peli</option>      
                            <option value="Dos">Dos</option>
                        </select>
                    </div>
                    <input type="hidden" name="guardar" value="guardar">
                    <button type="submit" class="btn btn-primary btn-lg">Guardar</button>
                    <input type="button" id="prueba">
                </div> 
            </form>
        </div>

    </body>
</html>
