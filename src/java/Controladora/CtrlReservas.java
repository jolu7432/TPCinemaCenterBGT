/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladora;

import Dao.BDReservas;
import Modelo.Reserva;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author herna
 */
public class CtrlReservas {

    private BDReservas datosReservas = BDReservas.getInstance();

    public void altaReserva(ArrayList<Reserva> reservas) throws SQLException {
	datosReservas.altaMultiplesReservas(reservas);
    }

    public void bajaReserva(Reserva reserva) throws SQLException {
	datosReservas.baja(reserva);
    }

    public Reserva existe(int idReserva) throws SQLException {
	Reserva reserva = new Reserva(idReserva);
	return (Reserva) datosReservas.existe(reserva);
    }

    public ArrayList listarXFuncion(int idFuncion) throws SQLException {
	return datosReservas.listadoXFuncion(idFuncion);
    }
    
    public ArrayList listarXUsuario(int idUsuario) throws SQLException {
        return datosReservas.listadoXUsuario(idUsuario);
    }    

}
