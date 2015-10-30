<%-- 
    Document   : elegirButaca
    Created on : 29-oct-2015, 13:33:20
    Author     : Jorge, Hernan y Bruno :)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body align="center">
            <%--    <jsp:include page="ServletValidaLoginRol?UrlPage=<%= request.getRequestURL()%>" flush="true"/> --%>
        <div id="menu">  
            <jsp:include page="menu.jsp"/>           
        </div> 

       
        <h1>Elegir Butaca</h1>
            <form method="post" action="#">
                <div class="row">
                <div class="col-md-12">
                    <div class="col-md-10" id="salita">

                    </div>
                    <div class="col-md-2">

                    </div>
                </div>
        
                </div>
            
            </form>
    </body>
        <script>
            var funcion;
            function traerSala(idSala)
            {
                var sala;
                $.post('ServletSala',{ idSala: idSala }, function (responseJson) {
                    $.each(responseJson, function (index, item) {
                        sala = item;
                    });
                });
                return sala;
            };
            function traerFuncion(idFuncion)
            {
                $.post('ServletFuncion',{ idFuncion: idFuncion}, function (responseJson) {
                    $.each(responseJson, function (index, item) {
                        funcion = item;
                    });
                });
            };      
            
            function traerReservas(idFuncion)
            {
                $.post('ServletReservar',{ idFuncion: idFuncion}, function (responseJson) {
                    var listaReservas = [];
                    $.each(responseJson, function (index, item) {
                         listaReservas.push(item);
                    });
                });
                return listaReservas;
            };             
            
            
            $(document).ready(function () {
                traerFuncion(<%= request.getParameter("idFuncion") %>);
                console.log(funcion);
                var sala = traerSala();
                            // falta que te traiga la sala que seria item.sala
                            // y hacer el metodo que te traiga las reservas de esa funcion item.reserva                            
                var numButaca;
                for (i = 0; i < sala.fila; i++) {
                    $('<br>').appendTo($('#salita'));
                    var tr = $('<tr>').appendTo($('#salita'));
                    for (f = 0; f < sala.columna ; f++) {
                        var td = $('<td>').appendTo(tr); 
                        numButaca++;
                        if(reserva.butaca === numButaca)
                            $('<img src="img/butacaOcu.png">').appendTo(td); 
                        else
                            $('<img src="img/butacaD.png">').appendTo(td); 

                    }
                }
            });  
            
        </script>
        
</html>
