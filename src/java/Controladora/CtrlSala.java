/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladora;

import Dao.BDSala;
import Modelo.Sala;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Jorge
 */
public class CtrlSala {

    private BDSala datosSalas = BDSala.getInstance();
    
    public void altaSala(Sala peli) throws SQLException {
	datosSalas.alta(peli);
    }
    
    public void modificaSala(Sala peli) throws SQLException {
	datosSalas.modificar(peli);
    }
    
    public void bajaSala(Sala peli) throws SQLException {
	datosSalas.baja(peli);
    }
    
    public ArrayList listarSalas() throws SQLException {
	return datosSalas.listado();
    }
    
     public ArrayList listarSalasAdmin() throws SQLException {
	return datosSalas.listadoAdmin();
    }
     
    public ArrayList listarSalasXCine(int idCine) throws SQLException {
	return datosSalas.listadoXCine(idCine);
    }
    
    public Sala existe(int idSala) throws SQLException {
	Sala aux = new Sala(idSala);
	return (Sala) datosSalas.existe(aux);
    }
    
}
