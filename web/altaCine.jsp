<%-- 
    Document   : altaCine
    Created on : 14-oct-2015, 20:16:21
    Author     : hernan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuarioLog" class="Modelo.Usuario" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Alta de Cines</title>  
    <script>
        $(document).ready(function () {
           $.post('ServletCine', {idCine: <%= request.getParameter("idCine")%>}, function (responseJson) {
                if (<%= request.getParameter("idCine")%> != null) {
                    $.each(responseJson, function (index, item) {
                        $('#txtNombre').val(item.nombre);
                        $('#txtDireccion').val(item.direccion);
                        $('#idC').val(<%= request.getParameter("idCine") %>);
                        
                    });
                }
            });

        }); 
    </script>
</head>
    <body>   
        <jsp:include page="ServletValidaLoginRol" flush="true"/> 
        <div id="rcorners" class="container">           
            <form method="post" action="ServletCine" >           
                <div class="col-md-8">
                    <center><h1>Alta de Cine</h1></center>
                    <div class="form-group col-md-2">
                        <label for="txtNombre">Nombre</label>
                        <input type="text" class="form-control" id="txtNombre" placeholder="Nombre" name="nombre" required autofocus>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="txtDireccion">Direccion</label>
                        <input type="text" class="form-control" id="txtDireccion" placeholder="Dirección" name="direccion" required>
                    </div>
                    <input type="hidden" name="idC" id="idC" >
                    <button type="submit" class="btn btn-primary btn-lg">Guardar</button>
                </div> 
            </form>
        </div>

    </body>
</html>
