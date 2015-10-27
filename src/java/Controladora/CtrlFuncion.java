/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladora;

import Dao.BDFunciones;
import Modelo.Funcion;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Jorge
 */
public class CtrlFuncion {

    private BDFunciones datosFunciones = BDFunciones.getInstance();

    public void altaFuncion(Funcion funcion) throws SQLException {
        datosFunciones.alta(funcion);
    }

    public void bajaFuncion(int idFuncion) throws SQLException {
        datosFunciones.baja(idFuncion);
    }
    
     public void modificaFuncion(Funcion funcion) throws SQLException{
         datosFunciones.modificar(funcion);
    }

    public ArrayList listarFunciones() throws SQLException {
        return datosFunciones.listado();
    }    
    
    public Funcion existe(int idFuncion) throws SQLException {
        Funcion aux = new Funcion(idFuncion);
        return (Funcion) datosFunciones.existe(aux);
    }
    
    public ArrayList validaFuncion(Funcion funcion) throws SQLException{       
        return datosFunciones.validaFuncion(funcion);
    }

}
