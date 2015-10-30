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
            var global; //variable para almacenar datos de la funcion a editar.
            function cargarComboCines() {
                $.post('ServletCargaComboBox', {Accion: "Cines"}, function (responseJson) {
                    $.each(responseJson, function (index, item) {
                        $('<option value="' + item.idCine + '">').text(item.nombre).appendTo($('#chkCine'));
                    });
                });
            }
            ;
            function cargarComboSalas(Cine) {
                $.post('ServletCargaComboBox', {Accion: "Salas", idCine: Cine}, function (responseJson) {
                    $('#chkSala').find('option:gt(0)').remove();
                    $('#chkPelicula').find('option:gt(0)').remove();
                    if (Cine != "") {
                        $.each(responseJson, function (index, item) {
                            $('<option value="' + item.idSala + '">').text(item.numSala).appendTo($('#chkSala'));
                        });
                    }
                });
            }
            ;
            function cargarComboPeliculas(Sala) {
                $.post('ServletCargaComboBox', {Accion: "Peliculas"}, function (responseJson) {
                    $('#chkPelicula').find('option:gt(0)').remove();
                    if (Sala != "") {
                        $.each(responseJson, function (index, item) {
                            $('<option value="' + item.idPelicula + '">').text(item.nombre).appendTo($('#chkPelicula'));
                        });
                    }
                });
            }
            ;
            function cargarCamposForm(item) {
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
                $('#chkCine').val(item.sala.cine.idCine);
                $('#chkSala').val(item.sala.idSala);
                $('#chkPelicula').val(item.pelicula.idPelicula);
            }
            ;
            $(document).ready(function () {
                $(".form_datetime").datetimepicker({format: 'yyyy-mm-dd hh:ii'});
                cargarComboCines();
                $('#chkCine').change(function () {
                    $('#chkSala').val(''); //seleccionar el primer item del combo Sala
                    cargarComboSalas($('#chkCine').val());
                });
                $('#chkSala').change(function () {
                    $('#chkPelicula').val(''); //seleccionar el primer item del combo Pelicula
                    cargarComboPeliculas($('#chkSala').val());
                });

                if (<%= request.getParameter("idFuncion")%> != null) {
                    $('[name=accion]').val('editar');
                    $('[name=idFuncionEditar]').val(<%= request.getParameter("idFuncion")%>);
                    $.post('ServletFuncion', {idFuncion: <%= request.getParameter("idFuncion")%>}, function (responseJson) {
                        $.each(responseJson, function (index, item) {
                            cargarComboSalas(item.sala.cine.idCine);
                            cargarComboPeliculas(item.sala.idSala);
                            global = item;
                        });
                        setTimeout ('cargarCamposForm(global)', 500); //tiempo que tarda en cargar los datos de la funcion a editar
                    });
                }

                $('#btnGuardar').click(function () {
                    if ($('#txtFechaYHora').val() == "" || $('#txtPrecio').val() == "" || $('#txtDuracion').val() == "" || $('#chkCine').val() == "" || $('#chkSala').val() == "" || $('#chkPelicula').val() == "") {
                        return true;
                    }
                    $.post('ServletValidaFuncion', {idFuncion: <%= request.getParameter("idFuncion")%>, idCine: $('#chkCine').val(), idSala: $('#chkSala').val(), FechaYHora: $('#txtFechaYHora').val(), Duracion: $('#txtDuracion').val()}, function (responseJson) {
                        if (responseJson.length != 0) {
                            text = "";
                            $.each(responseJson, function (index, item) {
                                text += "Cine:" + item.sala.cine.nombre + " - Sala:" + item.sala.numSala + " - Titulo:" + item.pelicula.nombre + " - Fecha:" + item.fechaYHora;
                            });
                            $('#msg').text('Los Datos no son Validos debido a las siguientes funciones:' + text).show().fadeOut(10000);
                        } else {
                            $('form').submit();
                        }
                    });
                    return false;
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
                        <label for="chkCine">Cine</label>                      
                        <select class="form-control" id="chkCine" placeholder="Cine" name="cine" required>
                            <option value="">Seleccionar...</option> 
                        </select>
                    </div>                
                    <div class="form-group">
                        <label for="chkSala">Sala</label>                       
                        <select class="form-control" id="chkSala" placeholder="Sala" name="sala" required>
                            <option value="">Seleccionar...</option> 
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="chkPelicula">Pelicula</label>
                        <select class="form-control" id="chkPelicula" placeholder="Pelicula" name="pelicula" required> 
                            <option value="">Seleccionar...</option> 
                        </select>
                    </div>
                    <input type="hidden" name="accion" value="guardar">
                    <input type="hidden" name="idFuncionEditar" value="">
                    <button type="submit" id="btnGuardar" class="btn btn-primary btn-lg">Guardar</button>
                    <div id="msg"></div>
                </div> 
            </div>           
        </form>
    </body>  
</html>
