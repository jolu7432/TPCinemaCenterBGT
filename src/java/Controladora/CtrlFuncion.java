/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladora;

import Modelo.Funcion;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Jorge
 */
public class CtrlFuncion {
    private BDFunciones datosFunciones
    
     public void altaFuncion(Funcion peli) throws SQLException{
         datosFuncion.alta(peli);
     }

    public void bajaFuncion(int fun) throws SQLException{
         datosFuncion.baja(fun);
    }

     public ArrayList listarFunciones() throws SQLException{
         return datosFuncion.listado();
     }    
     
     public Funcion existe(int idFuncion) throws SQLException{
         Funcion fun = new Funcion(idFuncion);
         return (Funcion)datosFuncion.existe(fun);
     }
    
}
