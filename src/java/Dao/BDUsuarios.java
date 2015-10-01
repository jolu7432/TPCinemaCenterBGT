/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Modelo.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Jorge
 */
public class BDUsuarios implements IBD {

    private static BDUsuarios instance = null;

    public static BDUsuarios getInstance() {
        if (instance == null) {
            instance = new BDUsuarios();
        }
        return instance;
    }

    public BDUsuarios() {

    }

    @Override
    public void alta(Object dato) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void baja(Object dato) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void modificar(Object oldDato, Object newDato) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object existe(Object dato) throws SQLException {
        Usuario resp = null;
        Conexion oCon = new Conexion();
        ResultSet rs = null;
        oCon.getConexion();
        String insert = "SELECT * FROM usuarios where User='"+((Usuario)dato).getUser() + "' and Pass='"+((Usuario)dato).getPass()+"'";      
        try {
            PreparedStatement sentencia = (PreparedStatement) oCon.getConexion().prepareStatement(insert);
            rs = sentencia.executeQuery();            
            while (rs.next()) {
                resp = new Usuario(rs.getInt("idUsuario"), rs.getString("Nombre"), rs.getString("Apellido"), rs.getInt("DNI"),rs.getBoolean("Administrador"), rs.getString("User"), rs.getString("Pass"), rs.getString("email"), rs.getString("Telefono"));
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
