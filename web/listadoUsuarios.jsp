<%-- 
    Document   : listadoUsuarios
    Created on : Oct 9, 2015, 11:43:15 AM
    Author     : microtik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuarioLog" class="Modelo.Usuario" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.1/css/jquery.dataTables.css">       
        <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.1/jquery.dataTables.min.js"></script>   
        <link rel = "stylesheet" type = "text/css" href = "http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.1/css/jquery.dataTables.css">
        <script type = "text/javascript" charset = "UTF-8" src = "http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.1/jquery.dataTables.min.js" ></script>   
        <script>
            $(document).ready(function () {
                $.post('ServletRegistro', {idUsuario: <%= usuarioLog.getId()%>}, function (responseJson) {
                    $.each(responseJson, function (index, item) {
                        var tr = $('<tr>').appendTo($('#tbody'));
                        $('<td>').text(item.nombre).appendTo(tr);
                        $('<td>').text(item.apellido).appendTo(tr);
                        $('<td>').text(item.dni).appendTo(tr);
                        $('<td>').text(item.administrador).appendTo(tr);
                        $('<td>').text(item.user).appendTo(tr);
                        $('<td>').text(item.pass).appendTo(tr);
                        $('<td>').text(item.email).appendTo(tr);
                        $('<td>').text(item.telefono).appendTo(tr);
                        var img = $('<td>').appendTo(tr);
                        var div = $('<div id=d2"' + index + '" class="thumbnail">').appendTo(img);
                        $('<img src="img/imgUsuarios/' + item.urlImg + '" alt="..." class="img-circle" style="height: 100px" ">').appendTo(div);
                        var accion = $('<td class="center">').appendTo(tr);
                        $('<button id="' + item.id + '" title="Editar" class="btn14 mr5 editar"><img src="iconos/editar.png" alt="Editar">').appendTo(accion);
                        $('<button id="' + item.id + '" title="Borrar" class="btn14 mr5 removeBtn borrar" data-entity-id="21589"><img src="iconos/remove.png" alt="Borrar">').appendTo(accion);
                    });
                    $('#example').dataTable();
                    $('.editar').click(function () {
                        $('#altaUsuario').val('Subir Usuario');
                        $('#formAltaUsuario').text('');
                        $('#altaUsuario').val('Cancelar');
                        $('#formAltaUsuario').load('altaUsuario.jsp?id=' + this.id);
                    });
                    $('.borrar').click(function () {
                        //alert('prueba de boton borrar');
                        $.post('ServletUsuario', {borrar: +this.id});
                    });
                });
                $('#example')
                        .on('order.dt', function () {
                            eventFired('Order');
                        })
                        .on('search.dt', function () {
                            eventFired('Search');
                        })
                        .on('page.dt', function () {
                            eventFired('Page');
                        })
                        .DataTable();
                $('#example').finish(function () {
                    $('#altaUsuario').val('Subir Usuario');
                    $('#formAltaUsuario').text('');
                    $('#altaUsuario').val('Cancelar');
                    $('#formAltaUsuario').load('altaUsuario.jsp?id=' + this.id);
                });


            <%--$('#altaUsuario').click(function () {
                divAltaUsuario();
            });

                function divAltaUsuario() {
                    if ($('#altaUsuario').val() == 'Cancelar') {
                        $('#altaUsuario').val('Subir Usuario');
                        $('#formAltaUsuario').text('');
                    } else {
                        $('#altaUsuario').val('Cancelar');
                        $('#formAltaUsuario').load('registro.jsp');
                    }
                };--%>
            });
        </script>
        <style>
            .btn14 {
                border: 1px solid #d5d5d5;               
                padding: 6px 8px;
                display: inline-block;
            }
            .mr5 {
                margin-right: 5px;
            }
            .editar{

            }
            .borrar{

            }
        </style>


    </head>
    <body>
        <jsp:include page="ServletValidaLoginRol?UrlPage=<%= request.getRequestURL()%>" flush="true"/> 
        <div class="table-responsive">
            <table id="example" class="dataTable" cellspacing="0" width="100%">
                <thead>
                    <tr>                        
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>DNI</th>
                        <th>Es administrador?</th>
                        <th>User</th>
                        <th>Pass</th>
                        <th>Email</th>
                        <th>Telefono</th>
                        <th>Imagen</th>
                        <th>Accion</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>                        
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>DNI</th>
                        <th>Es administrador?</th>
                        <th>User</th>
                        <th>Pass</th>
                        <th>Email</th>
                        <th>Telefono</th>
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
