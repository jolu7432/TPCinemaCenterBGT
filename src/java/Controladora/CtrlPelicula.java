/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladora;

import Dao.BDPeliculas;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Jorge
 */
public class CtrlPelicula {
     private BDPeliculas datosPeliculas = BDPeliculas.getInstance();
     
     public ArrayList listarPeliculas() throws SQLException{
         return datosPeliculas.listado();
     }
    
}
