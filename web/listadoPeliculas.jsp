<%-- 
    Document   : listadoPeliculas
    Created on : 05-oct-2015, 1:27:29
    Author     : Jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuarioLog" class="Modelo.Usuario" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.1/css/jquery.dataTables.css">       
        <script type="text/javascript" charset="UTF-8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.1/jquery.dataTables.min.js"></script>        
        <script>
            $(document).ready(function () {
                $.post('ServletPelicula', function (responseJson) {
                    $.each(responseJson, function (index, item) {
                        var tr = $('<tr>').appendTo($('#tbody'));
                        $('<td>').text(item.nombre).appendTo(tr);
                        $('<td>').text(item.director).appendTo(tr);
                        $('<td>').text(item.duracion).appendTo(tr);
                        $('<td>').text(item.descripcion).appendTo(tr);
                        $('<td>').text(item.estado).appendTo(tr);
                        var img = $('<td>').appendTo(tr);
                        var div = $('<div id=d2"' + index + '" class="thumbnail">').appendTo(img);
                        $('<img src="img/' + item.urlImagen + '" alt="..." class="img-circle" style="height: 100px" ">').appendTo(div);
                        var accion = $('<td class="center">').appendTo(tr);
                        $('<button id="' + item.idPelicula + '" title="Editar" class="btn14 mr5 editar"><img src="iconos/editar.png" alt="Editar">').appendTo(accion);
                        $('<button id="' + item.idPelicula + '" title="Borrar" class="btn14 mr5 removeBtn borrar" data-entity-id="21589"><img src="iconos/remove.png" alt="Borrar">').appendTo(accion);
                    });
                    $('#example').dataTable();
                    $('.editar').click(function () {
                        $('#altaPelicula').val('Subir Pelicula');
                        $('#formAltaPelicula').text('');
                        $('#altaPelicula').val('Cancelar');
                        $('#formAltaPelicula').load('altaPelicula.jsp?idPelicula=' + this.id);
                    });
                    $('.borrar').click(function () {
                        //alert('prueba de boton borrar');
                        $.post('ServletPelicula', {borrar: +this.id});
                        location.reload();
                    });
                });
            });
        </script>
        <style>
            .editar{

            }
            .borrar{

            }
            .btn14 {
                border: 1px solid #d5d5d5;               
                padding: 6px 8px;
                display: inline-block;
            }
            .mr5 {
                margin-right: 5px;
            }
        </style>

    </head>
    <body> 
        <jsp:include page="ServletValidaLoginRol" flush="true"/> 
        <div class="table-responsive">
            <table id="example" class="dataTable" cellspacing="0" width="100%">
                <thead>
                    <tr>                        
                        <th>Nombre</th>
                        <th>Director</th>
                        <th>Duracion</th>
                        <th>Descripcion</th>
                        <th>Estado</th>
                        <th>Imagen</th>
                        <th>Accion</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>                        
                        <th>Nombre</th>
                        <th>Director</th>
                        <th>Duracion</th>
                        <th>Descripcion</th>
                        <th>Estado</th>
                        <th>Imagen</th>
                        <th>Accion</th>
                    </tr>
                </tfoot>
                <tbody id="tbody">                   
                </tbody>
            </table>
        </div>    
    </body>
</html>
