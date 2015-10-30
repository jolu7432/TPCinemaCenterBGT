<%-- 
    Document   : reservasUsuario
    Created on : 30-oct-2015, 13:42:42
    Author     : hernan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuarioLog" class="Modelo.Usuario" scope="session"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%--<jsp:include page="ServletValidaLoginRol?UrlPage=<%= request.getRequestURL()%>" flush="true"/> --%> 
        <div id="menu">  
            <jsp:include page="menu.jsp"/>
        </div>
        <script>
            $(document).ready(function () {
                $.post('ServletReservar',{ idUsuario: <%= usuarioLog.getId() %> }, function (responseJson) {
                    $.each(responseJson, function (index, item) {
                        var tr = $('<tr>').appendTo($('#tbody')); 
                        
                     
                        var formattedDate = new Date(item.funcion.fechaYHora);
                        var y = formattedDate.getFullYear();
                        var m = formattedDate.getMonth();
                        var d = formattedDate.getDate();
                        var h = formattedDate.getHours();
                        var min = formattedDate.getMinutes();
                        m += 1;  // JavaScript months are 0-11                    
                        $('<td>').text(y + "-" + m + "-" + d + " " + h + ":" + min).appendTo(tr);
                        $('<td>').text(item.butaca).appendTo(tr);                  
                        $('<td>').text(item.funcion.sala.cine.nombre).appendTo(tr);                  
                        $('<td>').text(item.funcion.sala.numSala).appendTo(tr);                                 
                    });
                });
            });

        </script>     
        <h1>Mis Reservas</h1>
        <div class="col-md-6">
            <table  class="table dataTable elemento " cellspacing="0" width="100%" >
                    <thead>
                        <tr style="background-color: #0088cc;">                        
                            <th>Dia de Funcion</th>
                            <th>Cantidad de Butacas</th>
                            <th>Cine</th>
                            <th>Sala</th>
                        </tr>
                    </thead>

                    <tbody id="tbody">                   
                    </tbody>
                </table>
        </div>
    </body>
</html>
