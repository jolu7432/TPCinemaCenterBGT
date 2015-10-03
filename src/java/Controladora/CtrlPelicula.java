/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladora;

import Dao.BDPeliculas;
import Servlets.ServletPelicula;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Jorge
 */
public class CtrlPelicula {
     private BDPeliculas datosPeliculas = BDPeliculas.getInstance();
     
     public void altaPelicula(ServletPelicula peli) throws SQLException{
         datosPeliculas.alta(peli);
     }
     
     public ArrayList listarPeliculas() throws SQLException{
         return datosPeliculas.listado();
     }
    
}
