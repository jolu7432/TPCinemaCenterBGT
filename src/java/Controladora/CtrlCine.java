/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladora;

import Dao.BDCine;
import Modelo.Cine;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author hernan
 */
public class CtrlCine {
     private BDCine datosCines = BDCine.getInstance();    

     public void altaPelicula(Cine cine) throws SQLException{
         datosCines.alta(cine);
     }

    public void bajaPelicula(int cine) throws SQLException{
         datosCines.baja(cine);
    }

     public ArrayList listarCines() throws SQLException{
         return datosCines.listado();
     }
     
      public ArrayList listarCinesActivos() throws SQLException{
         return datosCines.listadoActivos();
     }
     
     public Cine existe(int idCine) throws SQLException{
         Cine aux = new Cine(idCine);
         return (Cine)datosCines.existe(aux);
     }
     
    
}
