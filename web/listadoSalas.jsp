<%-- 
    Document   : listadoSalas
    Created on : Oct 23, 2015, 9:14:21 AM
    Author     : microtik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                $.post('ServletSala', function (responseJson) {
                    $.each(responseJson, function (index, item) {
                        var tr = $('<tr>').appendTo($('#tbody'));
                        $('<td>').text(item.numSala).appendTo(tr);
                        $('<td>').text(item.cine.nombre).appendTo(tr);
                        $('<td>').text(item.columna).appendTo(tr);
                        $('<td>').text(item.fila).appendTo(tr);
                        $('<td>').text(item.Estado).appendTo(tr);
                        var accion = $('<td class="center">').appendTo(tr);
                        $('<button id="' + item.idSala + '" title="Editar" class="btn14 mr5 editar"><img src="iconos/editar.png" alt="Editar">').appendTo(accion);
                        $('<button id="' + item.idSala + '" title="Borrar" class="btn14 mr5 removeBtn borrar" data-entity-id="21589"><img src="iconos/remove.png" alt="Borrar">').appendTo(accion);
                    });
                    $('#example').dataTable();            
                });
                $('#example').on('click', '.editar', function () {
                    $('#altaSala').val('Alta Sala');
                    $('#formAltaSala').text('');
                    $('#altaSala').val('Cancelar');
                    $('#formAltaSala').load('altaSala.jsp?idSala=' + this.id);
                });
                $('#example').on('click', '.borrar', function () {
                    $.post('ServletSala', {borrar: +this.id});
                    location.href = "/TPCinemaCenterBGT/abmSala.jsp";
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
        <jsp:include page="ServletValidaLoginRol?UrlPage=<%= request.getRequestURL()%>" flush="true"/>  
        <div class="table-responsive">
            <table id="example" class="dataTable" cellspacing="0" width="100%">
                <thead>
                    <tr>                        
                        <th>Numero de Sala</th>
                        <th>Cine</th>
                        <th>Columnas</th>
                        <th>Filas</th>
	      <th>Estado</th>
	      <th>Accion</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>                        
                        <th>Numero de Sala</th>
                        <th>Cine</th>
                        <th>Columnas</th>
                        <th>Filas</th>
	      <th>Estado</th>
	      <th>Accion</th>
                    </tr>
                </tfoot>
                <tbody id="tbody">                   
                </tbody>
            </table>
        </div>    
    </body>
</html>
