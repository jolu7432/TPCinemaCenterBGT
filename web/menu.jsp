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
    </head>
    <body>        
        <!-- <!% String aux = usuarioLog.getUser();
             if (aux.equals("jolu7432")) {%>
         <div class="dropdown">
             <h1>Jorge</h1> 
             <button type="button">Menú desplegable</button>
 
         </div> 
         <!% } else {%>
         <div class="dropdown">
             <h1>Hernan</h1> 
             <button type="button">Menú desplegable</button>
 
         </div> 
         <!% }%>
        -->
        <nav class="navbar-fixed-top"> 
            <div class="container-fluid">            
                <div class="navbar-right">
                    <form class="navbar-form" action="Login" method="post">
                        <% if (usuarioLog.getId() == 0) {%>                  
                        <label for="inputUsuario" >Usuario:</label>
                        <input type="text" id="inputUsuario" name="user"  class="form-control" placeholder="Ingrese usuario" required autofocus>
                        <label for="inputPassword" >Contraseña: </label>
                        <input type="password" name="pass" id="inputPassword" class="form-control" placeholder="Contraseña" required>
                        <button class="navbar-btn btn-primary " type="submit" name="ingresar" >Ingresar</button> 
                        <button class="navbar-btn btn-primary " type="button" name="registrar" ><a href="/registro.jsp">Registrar</a></button>                     
                         <input type="hidden" name="accion" value="logIn"/>.
                        <% } else {%>
                        <input type="hidden" name="accion" value="logOut"/>
                        <button class="navbar-btn btn-primary " type="submit" name="salir" >Salir</button>                  
                        <% }%>
                    </form>
                </div>  
            </div>
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"><h2 style="margin-top: 0px;" class="navbar-header">CinemaCenter</h2></a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
                            <li><a href="#">Link</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">Separated link</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">One more separated link</a></li>
                                </ul>
                            </li>
                        </ul>
                        <form class="navbar-form navbar-left" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search">
                            </div>
                            <button type="submit" class="btn btn-default">Submit</button>
                        </form>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#">Link</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">Separated link</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </nav>     



    </body>
</html>
