<%-- 
    Document   : busquedaAvanzada
    Created on : 26-oct-2015, 20:40:14
    Author     : Jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Busqueda Avanzada</title> 

    </head>    
    <body>
        <%--<jsp:include page="ServletValidaLoginRol?UrlPage=<%= request.getRequestURL()%>" flush="true"/> --%> 
        <div id="menu">  
            <jsp:include page="menu.jsp"/>
        </div>
        <h1 align= "center" >Busqueda Avanzada</h1> 
        <form>   
            <div id="rcorners" class="container">                
                <div class="col-md-10">
                    <div class="form-group">
                        <label for="chkCine">Cine</label>                      
                        <select class="form-control" id="chkCine" placeholder="Cine" name="cine">
                            <option value="">Seleccionar...</option> 
                        </select>
                    </div>                
                    <div class="form-group">
                        <label for="chkSala">Sala</label>                       
                        <select class="form-control" id="chkSala" placeholder="Sala" name="sala">
                            <option value="">Seleccionar...</option> 
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="chkPelicula">Pelicula</label>
                        <select class="form-control" id="chkPelicula" placeholder="Pelicula" name="pelicula"> 
                            <option value="">Seleccionar...</option> 
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="chkNumeroButacas">Numero Butacas</label>
                        <select class="form-control" id="chkFunciones" placeholder="NumeroButacas" name="numeroButacas"> 
                            <option value="">Seleccionar...</option> 
                            <option value="1">1</option> 
                            <option value="2">2</option> 
                            <option value="3">3</option> 
                            <option value="4">4</option> 
                            <option value="5">5</option> 
                            <option value="6">6</option> 
                            <option value="7">7</option> 
                            <option value="8">8</option> 
                            <option value="9">9</option> 
                            <option value="10">10</option> 
                            <option value="11">11</option> 
                            <option value="12">12</option>
                            <option value="13">13</option> 
                            <option value="14">14</option> 
                            <option value="15">15</option> 
                            <option value="16">16</option> 
                            <option value="17">17</option> 
                            <option value="18">18</option>                             
                            <option value="19">19</option> 
                            <option value="20">20</option> 
                        </select>
                    </div>                  
                    <button type="button" id="btnBuscar" class="btn btn-primary btn-lg">Buscar</button>                   
                </div> 
            </div>
        </form>
        <div class="table-responsive">
            <table id="example" class="dataTable" cellspacing="0" width="100%">
                <thead>
                    <tr>                        
                        <th>Fecha Y Hora</th>
                        <th>Precio</th>
                        <th>Duracion</th>
                        <th>Cine</th>
                        <th>Sala</th>
                        <th>Pelicula</th>  
                        <th>Butacas Disponibles</th>
                        <th>Accion</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>                        
                        <th>Fecha Y Hora</th>
                        <th>Precio</th>
                        <th>Duracion</th>
                        <th>Cine</th>
                        <th>Sala</th>
                        <th>Pelicula</th> 
                        <th>Butacas Disponibles</th> 
                        <th>Accion</th>
                    </tr>
                </tfoot>
                <tbody id="tbody">                   
                </tbody>
            </table>
        </div>    
    </body>
    <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.1/css/jquery.dataTables.css">       
    <script type="text/javascript" charset="UTF-8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.1/jquery.dataTables.min.js"></script>   
    <script>
        var idPelicula;
        function cargarComboCines() {
            $.post('ServletCargaComboBox', {Accion: "Cines"}, function (responseJson) {
                $.each(responseJson, function (index, item) {
                    $('<option value="' + item.idCine + '">').text(item.nombre).appendTo($('#chkCine'));
                });
            });
        }
        ;
        function cargarComboSalas() {
            $.post('ServletCargaComboBox', {Accion: "SalasTodas"}, function (responseJson) {
                $('#chkSala').find('option:gt(0)').remove();
                $('#chkPelicula').find('option:gt(0)').remove();
                $.each(responseJson, function (index, item) {
                    $('<option value="' + item.idSala + '">').text(item.numSala).appendTo($('#chkSala'));
                });
            });
        }
        ;
        function cargarComboPeliculas() {
            $.post('ServletCargaComboBox', {Accion: "Peliculas"}, function (responseJson) {
                $('#chkPelicula').find('option:gt(0)').remove();
                $.each(responseJson, function (index, item) {
                    $('<option value="' + item.idPelicula + '">').text(item.nombre).appendTo($('#chkPelicula'));
                });
            });
        }
        ;
        $(document).ready(function () {
            cargarComboCines();
            cargarComboSalas();
            cargarComboPeliculas();
            $('#btnBuscar').click(function () {
                $('#example td').remove();
                $.post('ServletFuncion', function (responseJson) {
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
                        $('<td>').text(item.pelicula.nombre).appendTo(tr);
                        $('<td>').text("0").appendTo(tr); //cantidad de butacas disponibles
                        var accion = $('<td class="center">').appendTo(tr);
                        $('<input type="button" id="' + item.idFuncion + '" title="Reservar" value="Reservar" class="btn btn-primary btn-lg reservar">').appendTo(accion);
                        // $('<button id="' + item.idFuncion + '" title="Borrar" class="btn14 mr5 removeBtn borrar" data-entity-id="21589"><img src="iconos/remove.png" alt="Borrar">').appendTo(accion);
                        idPelicula = item.pelicula.idPelicula;
                    });
                    $('#example').dataTable();
                });
            });
            $('#example').on('click', '.reservar', function () {
                //$('#altaFuncion').val('Alta Funcion');
                //$('#formAltaFuncion').text('');
                //$('#altaFuncion').val('Cancelar');
                //$('#formAltaFuncion').load('altaFuncion.jsp?idFuncion=' + this.id);
                location.href = "/TPCinemaCenterBGT/elegirButaca.jsp?idFuncion=" + this.id + "&idPelicula=" + idPelicula;
            });
        });
    </script>
    <style>
        .reservar{

        }        
    </style>
</html>
