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
    
     public void altaFuncion(Funcion peli) throws SQLException{
         datosFunciones.alta(peli);
     }

    public void bajaFuncion(int idFuncion) throws SQLException{
         datosFunciones.baja(idFuncion);
    }

     public ArrayList listarFunciones() throws SQLException{
         return datosFunciones.listado();
     }    
     
     public Funcion existe(int idFuncion) throws SQLException{ 
         Funcion aux = new Funcion(idFuncion);
         return (Funcion)datosFunciones.existe(aux);
     }
    
}
