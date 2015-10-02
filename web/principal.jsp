<%-- 
    Document   : principal
    Created on : 25/09/2015, 13:45:58
    Author     : Jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuarioLog" class="Modelo.Usuario" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>
            $(document).ready(function () {
                $.get('Pelicula', function (responseJson) {
                    console.log(responseJson);
                    var $ul = $('<ul>').appendTo($('#pelis'));
                    $.each(responseJson, function (index, item) {
                        $('<li>').text(item).appendTo($ul);
                    });
                });
            });

        </script>
    </head>
    <body>
        <div id="menu">  
            <jsp:include page="menu.jsp"/>
        </div>
        <h1 align= "center" >Peliculas en Cartel</h1>
        <%= usuarioLog.getId()%>
        <%= usuarioLog.getNombre()%>
        <%= usuarioLog.getApellido()%>
        <%= usuarioLog.getDni()%>
        <% if (usuarioLog.isAdministrador()) {%>
        <%="sos administrador"%>
        <%} else {%>
        <%="no sos administrador"%>
        <%}%>
        <%= usuarioLog.getUser()%>
        <%= usuarioLog.getPass()%>
        <%= usuarioLog.getEmail()%>
        <%= usuarioLog.getTelefono()%> 

        <div class="row">
            <div id="pelis"></div>

            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <img src="img/matrix.png" alt="...">
                    <div class="caption">
                        <h3>Matrix</h3>
                        <p>¿Es el mundo lo que parece? Thomas Anderson (Keanu Reeves), programador de una importante empresa de software
                            y asaltador informático de alias Neo, averiguará que no. Con él contactará un extraño grupo encabezado por Morfeo (Lawrence Fishburne),
                            quien le mostrará la verdadera realidad que se esconde tras lo aparente: un mundo dominado por las máquinas, las cuales esclavizan a la
                            Humanidad para utilizar nuestros cuerpos como simple fuente de energía. ¿Pero, y nuestra mente, dónde se encuentra entonces? la respuesta
                            está en Matrix.</p>
                        <p><a href="#" class="btn btn-primary" role="button">Reservar</a> </p>
                    </div>
                </div>
            </div>            

                                <div class="col-sm-6 col-md-4">
                  <div class="thumbnail">
                    <img src="img/gladiador.png" alt="...">
                    <div class="caption">
                      <h3>Matrix</h3>
                      <p>¿Es el mundo lo que parece? Thomas Anderson (Keanu Reeves), programador de una importante empresa de software
                          y asaltador informático de alias Neo, averiguará que no. Con él contactará un extraño grupo encabezado por Morfeo (Lawrence Fishburne),
                          quien le mostrará la verdadera realidad que se esconde tras lo aparente: un mundo dominado por las máquinas, las cuales esclavizan a la
                          Humanidad para utilizar nuestros cuerpos como simple fuente de energía. ¿Pero, y nuestra mente, dónde se encuentra entonces? la respuesta
                          está en Matrix.</p>
                      <p><a href="#" class="btn btn-primary" role="button">Reservar</a> </p>
                    </div>
                  </div>
                </div>   

        </div>


    </body>
</html>
