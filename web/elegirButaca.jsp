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
        <form>
            <label>Cantidad de butacas:</label>
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
            $(document).ready(function () {
                    $.post('ServletFuncion',{ idFuncion: <%= request.getParameter("idFuncion") %> }, function (responseJson) {
                        $.each(responseJson, function (index, item) {
                            for (i = 0; i < item.sala.fila; i++) {
                                $('<br>').appendTo($('#salita'));
                                var tr = $('<tr>').appendTo($('#salita'));
                                for (f = 0; f < item.sala.columna ; f++) {
                                    var td = $('<td>').appendTo(tr); 
                                    $('<img src="img/butacaD.png">').appendTo(td); 
                                    //lo puse para armar la sala pero habria q fijarse las butacas ocupadas y ponerle la img butacaOcu.png
                                    // admas de todo lo demas je
                                }
                            }
                        });
                    });  
            });
        </script>
        
</html>
