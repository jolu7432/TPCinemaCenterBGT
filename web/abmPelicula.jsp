<%-- 
    Document   : abmPelicula
    Created on : 02-oct-2015, 23:57:20
    Author     : Jorge
--%>

<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuarioLog" class="Modelo.Usuario" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ABM Pelicula</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>
            $(document).ready(function () {
                $.post('Pelicula', {idUsuario: <%= usuarioLog.getId()%>}, function (responseJson) {
                    var i = 1;
                    $.each(responseJson, function (index, item) {
                        var tr = $('<tr>').appendTo($('#tbody'));
                        var th = $('<th scope="row">' + i + '</th>').appendTo(tr);
                        $('<td>').text(item.nombre).appendTo(tr);
                        $('<td>').text(item.director).appendTo(tr);
                        $('<td>').text(item.duracion).appendTo(tr);
                        $('<td>').text(item.descripcion).appendTo(tr);
                        $('<td>').text(item.estado).appendTo(tr);
                        var img = $('<td>').text(item.imagen).appendTo(tr);
                        var div = $('<div id=d2"' + index + '" class="thumbnail">').appendTo(img);
                        $('<img src="img/' + item.urlImagen + '" alt="..." class=img-circle ">').appendTo(div);
                        var accion = $('<td class="center">').appendTo(tr);
                        $('<a href="" title="Edit" class="btn14 mr5"><img src="iconos/editar.png" alt="Edit">').appendTo(accion);
                        $('<a href="#" title="Remove" class="btn14 mr5 removeBtn" data-entity-id="21589"><img src="iconos/remove.png" alt="Remove">').appendTo(accion);
                        i++;
                    });
                });

                $('#altaPelicula').click(function () {
                   $('#formAltaPelicula').load('altaPelicula.jsp');                  
                });
            });

        </script>
        <style>
            .btn14 {
                border: 1px solid #d5d5d5;
                background: url(../images/leftNavBg.png) repeat-x 0 0;
                padding: 6px 8px;
                display: inline-block;
            }
            .mr5 {
                margin-right: 5px;
            }
        </style>
    </head>
    <body>       
        <div id="menu">  
            <jsp:include page="menu.jsp"/>
        </div>         
        <input type="button" id="altaPelicula" value="Subir Pelicula"/> 
        <div id="formAltaPelicula"></div>         
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nombre</th>
                        <th>Director</th>
                        <th>Duracion</th>
                        <th>Descripcion</th>
                        <th>Estado</th>
                        <th>Imagen</th>
                        <th>Accion</th>
                    </tr>
                </thead>
                <tbody id="tbody">                   
                </tbody>
            </table>
        </div>    
    </body>   
</html>
