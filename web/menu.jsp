<%-- 
    Document   : menu
    Created on : 02/10/2015, 11:06:55
    Author     : Jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuarioLog" class="Modelo.Usuario" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="bootstrap/css/style.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>   
        <link href="bootstrap/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css"/>       
        <script src="bootstrap/js/bootstrap-datetimepicker.js" type="text/javascript"></script>
        <script src="bootstrap/js/locales/bootstrap-datetimepicker.ar.js" type="text/javascript"></script>
    </head>
    <body>       
        <nav class="navbar-default navbar-fixed-top">     
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-right">
                        <form class="navbar-form" action="ServletLogin" method="post">
                            <% if (usuarioLog.getId() == 0) {%>                  
                            <label for="inputUsuario" >Usuario:</label>
                            <input type="text" id="inputUsuario" name="user"  class="form-control" placeholder="Ingrese usuario" required autofocus>
                            <label for="inputPassword" >Contraseña: </label>
                            <input type="password" name="pass" id="inputPassword" class="form-control" placeholder="Contraseña" required>
                            <button class="navbar-btn btn-primary " type="submit" name="ingresar" >Ingresar</button> 
                            <button class="navbar-btn btn-primary " type="button" name="registrar" onclick="location.href = 'registro.jsp'">Registrar</button>                     
                            <input type="hidden" name="accion" value="logIn"/>               
                            <% }%>
                        </form>
                    </div>  
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="principal.jsp"><h2 style="margin-top: 0px;" class="navbar-header">CinemaCenter</h2></a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-left ">
                            <li class="btn-menu"><a href="principal.jsp">Peliculas<span class="sr-only">(current)</span></a></li>
                                <% if (usuarioLog.getId() != 0) {%>
                                <%if (usuarioLog.isAdministrador()) {%>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Herramientas Administrador<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li role="separator" class="divider"></li>
                                    <li><a href="abmPelicula.jsp">ABM Peliculas</a></li>
                                    <li><a href="abmUsuario.jsp">ABM Usuarios</a></li>
                                    <li><a href="abmFuncion.jsp">ABM Funcion</a></li>
                                    <li><a href="abmCine.jsp">ABM Cines</a></li>
                                    <li><a href="abmSala.jsp">ABM Salas</a></li>
                                </ul>
                            </li>
                            <%}
                                    }%>
                            <li class="btn-menu"><a href="busquedaAvanzada.jsp">Busqueda Avanzada</a></li>                                    

                        </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <% if (usuarioLog.getId() != 0) {%>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img src=<%= "img/imgUsuarios/" + usuarioLog.getUrlImg()%>  style="height: 40px; width: 30px"><%= " " + usuarioLog.getUser()%><span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="reservasUsuario.jsp">Mis Reservas</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li>  <form class="navbar-form" action="ServletLogin" method="post">
                                            <input type="hidden" name="accion" value="logOut"/>
                                            <button class="navbar-btn btn-primary" type="submit" name="salir" >Salir</button>
                                        </form></li>
                                </ul>
                            </li>
                            <%}%>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </nav>     
    </body>
</html>
