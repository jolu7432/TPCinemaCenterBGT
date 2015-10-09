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
 * @author Jorge
 */
public class CtrlLogin {
    private BDUsuarios datosUsuarios = BDUsuarios.getInstance();
    
    public Usuario validaUsuario(Usuario user) throws SQLException{        
       return (Usuario)datosUsuarios.existe(user);
    }
    
    public void registraUsuario(Usuario user) throws SQLException {
        datosUsuarios.alta(user);
    }
    
    public ArrayList listarUsuarios() throws SQLException{
        return datosUsuarios.listado();
    }
}
