<%-- 
    Document   : reservar
    Created on : 22/10/2015, 21:13:19
    Author     : Hernan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reserva</title>
    </head>
    <body>        
        <%--        <jsp:include page="ServletValidaLoginRol?UrlPage=<%= request.getRequestURL()%>" flush="true"/>  --%>
                <div id="menu">  
            <jsp:include page="menu.jsp"/>           
        </div> 
        <script>
            $(document).ready(function () {
                $.get('ServletPelicula',{ idPelicula: <%= request.getParameter("id") %>}, function (responseJson) {
                    $.each(responseJson, function (index, item) {                       
                        var div = $('<div class="col-md-12">').appendTo($('#pelicula'));                        
                        var div1= $('<div class="thumbnail">').appendTo(div);                        
                        $('<img src="img/'+item.urlImagen+'" alt="...">').appendTo(div1);
                        var div2= $('<div class="caption">').appendTo(div1);  
                        $('<h3>').text(item.nombre).appendTo(div2);
                        var p = $('<p>').text(item.descripcion).appendTo(div2);                   
                    });
                });
            });
        </script>        
        <div class="row">
            <div class="col-md-6 col-md-4 col-md-offset-1" id="pelicula">
                
            </div>
            
            <div class="col-md-6 contenedorExterior  " id="funciones">
                <div class="contenedorInterior">
                 <script>
            $(document).ready(function () {
                $.post('ServletFuncion',{ idPelicula: <%= request.getParameter("id") %>}, function (responseJson) {
                    $.each(responseJson, function (index, item) {
                        var tr = $('<tr>').appendTo($('#tbody'));                     
                        var formattedDate = new Date(item.fechaYHora);
                        var y = formattedDate.getFullYear();
                        var m = formattedDate.getMonth();
                        var d = formattedDate.getDate();
                        var h = formattedDate.getHours();
                        var min = formattedDate.getMinutes();
                        m += 1;  // JavaScript months are 0-11                    
                        $('<td>').text(y + "-" + m + "-" + d + " " + h + ":" + min).appendTo(tr);
                        $('<td>').text(item.precio).appendTo(tr);
                        $('<td>').text(item.duracion).appendTo(tr);
                        $('<td>').text(item.sala.cine.nombre).appendTo(tr);
                        $('<td>').text(item.sala.numSala).appendTo(tr);
                        var accion = $('<td class="center">').appendTo(tr);
                        $('<a href="elegirButaca.jsp?idFuncion=' + item.idFuncion  + '"  id="' + item.idFuncion + '"  class="btn btn-secondary reservar">Reservar</a>').appendTo(accion);
                       
                    });
                   // $('#example').dataTable();
                });
                //$('#example').on('click', '.reservar', function () {
                //    $('#altaFuncion').val('Alta Funcion');
                //    $('#formAltaFuncion').text('');
                //   $('#altaFuncion').val('Cancelar');
                //   $('#formAltaFuncion').load('reservar.jsp?idFuncion=' + this.id);
                //});
                //al hacer paginacion en la tabla
                //$('#example').on('page', function () {
                // alert('paginacion');
                //});
            });
        </script>
        <h3 align="center">Funciones</h3>
        <br>
        <br>
        <table id="example" class="table dataTable elemento " cellspacing="0" width="100%" >
                <thead>
                    <tr style="background-color: #0088cc;">                        
                        <th>Fecha Y Hora</th>
                        <th>Precio</th>
                        <th>Duracion</th>
                        <th>Cine</th>
                        <th>Sala</th>
                        <th>Reservar</th>
                    </tr>
                </thead>

                <tbody id="tbody">                   
                </tbody>
            </table>
            </div>
            </div>
                           
            
        </div>
        
    </body>   
</html>
