/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Controladora.CtrlUsuario;
import Controladora.CtrlFuncion;
import Modelo.Cine;
import Modelo.Funcion;
import Modelo.Pelicula;
import Modelo.Reserva;
import Modelo.Sala;
import Modelo.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Hernan, Bruno, Jorge
 */
public class BDReservas implements IBD {

    private static BDReservas instance = null;
    CtrlUsuario ctrlUsuario = new CtrlUsuario();
    CtrlFuncion ctrlFuncion = new CtrlFuncion();

    public static BDReservas getInstance() {
	if (instance == null) {
	    instance = new BDReservas();
	}
	return instance;
    }

    public BDReservas() {
    }

    @Override
    public void alta(Object dato) throws SQLException {
	Conexion oCon = new Conexion();
	oCon.getConexion();
	Reserva aux = (Reserva) dato;
	String insert = "INSERT INTO reservas(idUsuario, Butaca, Confirmacion, idFuncion) VALUES(?,?,?,?)";
	try {
	    PreparedStatement sentencia = (PreparedStatement) oCon.getConexion().prepareStatement(insert);
	    sentencia.setInt(1, aux.getUser().getId());
	    sentencia.setInt(2, aux.getButaca());
	    sentencia.setBoolean(4, aux.isConfirmacion());
	    sentencia.setInt(5, aux.getFuncion().getIdFuncion());
	    sentencia.execute();
	    sentencia.close();

	} catch (SQLException e) {
	    e.printStackTrace();
	} finally {
	    oCon.close();
	}
    }

    @Override
    public void baja(Object dato) throws SQLException {
	Conexion oCon = new Conexion();
	oCon.getConexion();
	String consulta = "DROP reservas where idReserva = " + ((Reserva) dato).getIdReserva();
	try {
	    PreparedStatement sentencia = (PreparedStatement) oCon.getConexion().prepareStatement(consulta);
	    sentencia.execute();
	    sentencia.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	} finally {
	    oCon.close();
	}
    }

    @Override
    public void modificar(Object dato) throws SQLException {

    }

    @Override
    public Object existe(Object dato) throws SQLException {
	Reserva resp = null;
	Conexion oCon = new Conexion();
	ResultSet rs = null;
	oCon.getConexion();
	String consulta = "SELECT * FROM reservas where idReserva =" + ((Reserva) dato).getIdReserva();
	try {
	    PreparedStatement sentencia = (PreparedStatement) oCon.getConexion().prepareStatement(consulta);
	    rs = sentencia.executeQuery();
	    while (rs.next()) {
		Usuario user = ctrlUsuario.traePorId(rs.getInt("idUsuario"));
		Funcion funcion = ctrlFuncion.existe(rs.getInt("idFuncion"));
		resp = new Reserva(rs.getInt("idReserva"), user, rs.getInt("Butaca"), rs.getBoolean("Confirmacion"), funcion);
	    }
	    rs.close();
	    sentencia.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	} finally {
	    oCon.close();
	    return resp;
	}
    }

    @Override
    public ArrayList listado() throws SQLException {
	return null;
    }

    public ArrayList listadoXUsuario(int user) throws SQLException {
	ArrayList listaReservas = new ArrayList();
	Conexion oCon = new Conexion();
	ResultSet rs = null;
	oCon.getConexion();
	String consulta = "SELECT idReserva, idUsuario, Count(*) as Butacas, Confirmacion, idFuncion FROM reservas where idUsuario =" + user + " group by idFuncion";
	try {
	    PreparedStatement sentencia = (PreparedStatement) oCon.getConexion().prepareStatement(consulta);
	    rs = sentencia.executeQuery();
	    while (rs.next()) {
                Funcion funcion = ctrlFuncion.existe(rs.getInt("idFuncion"));
                Reserva res = new Reserva(rs.getInt("idReserva"), null, rs.getInt("Butacas"), rs.getBoolean("Confirmacion"), funcion);
		listaReservas.add(res);
	    }
	    rs.close();
	    sentencia.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	} finally {
	    oCon.close();
	    return listaReservas;
	}
        
    }    

    public ArrayList listadoXFuncion(int idFuncion) throws SQLException {
	ArrayList listaReservas = new ArrayList();
	Usuario user = null;
	Conexion oCon = new Conexion();
	ResultSet rs = null;
	oCon.getConexion();
	String consulta = "SELECT * FROM reservas where idFuncion =" + idFuncion;
	try {
	    PreparedStatement sentencia = (PreparedStatement) oCon.getConexion().prepareStatement(consulta);
	    rs = sentencia.executeQuery();
	    while (rs.next()) {
		Reserva res = new Reserva(rs.getInt("idReserva"), null, rs.getInt("Butaca"), rs.getBoolean("Confirmacion"), null);
		listaReservas.add(res);
	    }
	    rs.close();
	    sentencia.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	} finally {
	    oCon.close();
	    return listaReservas;
	}
    }

    public void altaMultiplesReservas(ArrayList<Reserva> reservas) throws SQLException {
	Conexion oCon = new Conexion();
	oCon.getConexion();
	String insert = "INSERT INTO reservas(idUsuario, Butaca, Confirmacion, idFuncion) VALUES(?,?,?,?)";
	try {
	    for (Reserva aux : reservas) {
		PreparedStatement sentencia = (PreparedStatement) oCon.getConexion().prepareStatement(insert);
		sentencia.setInt(1, aux.getUser().getId());
		sentencia.setInt(2, aux.getButaca());
		sentencia.setBoolean(3, aux.isConfirmacion());
		sentencia.setInt(4, aux.getFuncion().getIdFuncion());
		sentencia.execute();
		sentencia.close();
	    }
	} catch (SQLException e) {
	    e.printStackTrace();
	} finally {
	    oCon.close();
	}
    }
}
