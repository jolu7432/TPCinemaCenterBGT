/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Modelo.Pelicula;
import com.sun.org.apache.xpath.internal.axes.AxesWalker;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author hernan
 */
public class BDPeliculas implements IBD{
    private static BDPeliculas instance = null;

    public static BDPeliculas getInstance() {
        if (instance == null) {
            instance = new BDPeliculas();
        }
        return instance;
    }

    public BDPeliculas() {
    }
    

    @Override
    public void alta(Object dato) throws SQLException {
        Conexion oCon = new Conexion();
        oCon.getConexion();
        Pelicula aux = (Pelicula) dato;
        String insert = "INSERT INTO peliculas(nombre, director, duracionPeli, descripcion, estado,UrlImagen) VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement sentencia = (PreparedStatement) oCon.getConexion().prepareStatement(insert);
            sentencia.setString(1, aux.getNombre());  
            sentencia.setString(2, aux.getDirector());
            sentencia.setInt(3, aux.getDuracion());
            sentencia.setString(4, aux.getDescripcion());
            sentencia.setBoolean(5, aux.isEstado());
            sentencia.setString(6, aux.getUrlImagen());           
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void modificar(Object dato) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object existe(Object dato) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList listado() throws SQLException {
        
        Pelicula resp = null;
        Conexion oCon = new Conexion();
        ResultSet rs = null;
        ArrayList listaPeliculas = new ArrayList();
        oCon.getConexion();
        String consulta = "SELECT * FROM peliculas where Estado = 1";      
        try {
            PreparedStatement sentencia = (PreparedStatement) oCon.getConexion().prepareStatement(consulta);
            rs = sentencia.executeQuery();            
            while (rs.next()) {
                resp = new Pelicula(rs.getInt("idPelicula"), rs.getString("Nombre"), rs.getString("Director"), rs.getInt("DuracionPeli"), rs.getString("Descripcion"), rs.getBoolean("Estado"), rs.getString("UrlImagen"));
                listaPeliculas.add(resp);
            }
            rs.close();
            sentencia.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            oCon.close();
            return listaPeliculas;
        }
        
    }
    
}
