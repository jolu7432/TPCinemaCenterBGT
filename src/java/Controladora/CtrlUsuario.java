/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladora;

import Dao.BDUsuarios;
import Modelo.Usuario;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author microtik
 */
public class CtrlUsuario {

    private BDUsuarios datosUsuarios = BDUsuarios.getInstance();

    public void registraUsuario(Usuario user) throws SQLException {
	datosUsuarios.alta(user);
    }

    public void modificarUsuario(Usuario user) throws SQLException {
	datosUsuarios.modificar(user);
    }

    public void bajaUsuario(int id) throws SQLException {
	datosUsuarios.baja(datosUsuarios.traePorId(id));
    }

    public ArrayList listarUsuarios() throws SQLException {
	return datosUsuarios.listado();
    }

    public Usuario traePorId(int id) throws SQLException {
	return datosUsuarios.traePorId(id);
    }

    public Usuario validaSIExiste(String user, String email) throws SQLException {
	return datosUsuarios.validaUser(user, email);
    }
}
