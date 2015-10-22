/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladora;

import Dao.BDPeliculas;
import Modelo.Pelicula;
import Servlets.ServletPelicula;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Jorge
 */
public class CtrlPelicula {

    private BDPeliculas datosPeliculas = BDPeliculas.getInstance();

    public void altaPelicula(Pelicula peli) throws SQLException {
        datosPeliculas.alta(peli);
    }

    public void bajaPelicula(int peli) throws SQLException {
        datosPeliculas.baja(peli);
    }

    public ArrayList listarPeliculas() throws SQLException {
        return datosPeliculas.listado();
    }

    public ArrayList listarPeliculasAdmin() throws SQLException {
        return datosPeliculas.listadoAdmin();
    }
    
    public ArrayList listarPeliculasXSala(int idSala) throws SQLException {
        return datosPeliculas.listadoXSala(idSala);
    }

    public Pelicula existe(int idPelicula) throws SQLException {
        Pelicula peli = new Pelicula(idPelicula);
        return (Pelicula) datosPeliculas.existe(peli);
    }

}
