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
        <form method="post" action="ServletFuncion" >   
            <div id="rcorners" class="container">                
                <div class="col-md-10">
                    <div class="form-group">
                        <label for="chkCine">Cine</label>                      
                        <select class="form-control" id="chkCine" placeholder="Cine" name="cine" required>
                            <option value="">Seleccionar...</option> 
                        </select>
                    </div>                
                    <div class="form-group">
                        <label for="chkSala">Sala</label>                       
                        <select class="form-control" id="chkSala" placeholder="Sala" name="sala" required>
                            <option value="">Seleccionar...</option> 
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="chkPelicula">Pelicula</label>
                        <select class="form-control" id="chkPelicula" placeholder="Pelicula" name="pelicula" required> 
                            <option value="">Seleccionar...</option> 
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="chkNumeroButacas">Numero Butacas</label>
                        <select class="form-control" id="chkFunciones" placeholder="NumeroButacas" name="numeroButacas" required> 
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
                    <button type="submit" id="btnBuscar" class="btn btn-primary btn-lg">Buscar</button>
                    <div id="msg"></div>
                </div> 
            </div>           

        </form>
    </body>
</html>
