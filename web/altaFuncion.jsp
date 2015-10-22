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
                $.post('ServletCargaComboBox', {Accion: "Cines"}, function (responseJson) {
                    $.each(responseJson, function (index, item) {
                        $('<option value="' + item.idCine + '">').text(item.nombre).appendTo($('#chkCine'));
                    });
                });
                $('#chkCine').change(function () {
                    $('#chkSala').val('');
                    $.post('ServletCargaComboBox', {Accion: "Salas", idCine: $('#chkCine').val()}, function (responseJson) {
                        if ($('#chkCine').val() != "") {
                            $.each(responseJson, function (index, item) {
                                $('<option value="' + item.idSala + '">').text(item.numSala).appendTo($('#chkSala'));
                            });
                        } else {
                            $('#chkSala').find('option:gt(0)').remove();
                            $('#chkPelicula').find('option:gt(0)').remove();
                        }
                    });
                });
                $('#chkSala').change(function () {
                    $('#chkPelicula').val('');
                    $.post('ServletCargaComboBox', {Accion: "Peliculas", idSala: $('#chkSala').val()}, function (responseJson) {
                        if ($('#chkSala').val() != "") {
                            $.each(responseJson, function (index, item) {
                                $('<option value="' + item.idPelicula + '">').text(item.nombre).appendTo($('#chkPelicula'));
                            });
                        } else {
                            $('#chkPelicula').find('option:gt(0)').remove();
                        }
                    });
                });
            });
        </script>
    </head>
    <body>   
        <jsp:include page="ServletValidaLoginRol?UrlPage=<%= request.getRequestURL()%>" flush="true"/> 
        <form method="post" action="ServletFuncion" >   
            <div id="rcorners" class="container">   
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
                        <select class="form-control" id="chkCine" placeholder="Cine" name="cine" required>
                            <option value="">Seleccionar...</option> 
                        </select>
                    </div>                
                    <div class="form-group">
                        <label for="txtSala">Sala</label>                       
                        <select class="form-control" id="chkSala" placeholder="Sala" name="sala" required>
                            <option value="">Seleccionar...</option> 
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="txtPelicula">Pelicula</label>
                        <select class="form-control" id="chkPelicula" placeholder="Pelicula" name="pelicula" required> 
                            <option value="">Seleccionar...</option> 
                        </select>
                    </div>
                    <input type="hidden" name="guardar" value="guardar">
                    <button type="submit" class="btn btn-primary btn-lg">Guardar</button>                 
                </div> 
            </div>
        </form>
    </body>
</html>
