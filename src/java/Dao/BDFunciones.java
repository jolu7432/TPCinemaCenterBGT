/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Modelo.Cine;
import Modelo.Funcion;
import Modelo.Pelicula;
import Modelo.Sala;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Jorge
 */
public class BDFunciones implements IBD{

    private static BDFunciones instance = null;

    public static BDFunciones getInstance() {
        if (instance == null) {
            instance = new BDFunciones();
        }
        return instance;
    }

    public BDFunciones() {
    }

   @Override
    public void alta(Object dato) throws SQLException {
        Conexion oCon = new Conexion();
        oCon.getConexion();
        Funcion aux = (Funcion) dato;
        String insert = "INSERT INTO funciones(FechaYHora, Duracion, Precio, idSala, idPelicula) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement sentencia = (PreparedStatement) oCon.getConexion().prepareStatement(insert);
            sentencia.setDate(1, aux.getFechaYHora());  
            sentencia.setInt(2, aux.getDuracion());
            sentencia.setFloat(3, aux.getPrecio());
            sentencia.setInt(4, aux.getSala().getIdSala());
            sentencia.setInt(5, aux.getPelicula().getIdPelicula());                      
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
        Funcion fun = (Funcion)dato; 
        String consulta = "UPDATE funciones set Estado = false where idSala ="+fun.getSala().getIdSala() + "and idPelicula ="+fun.getPelicula().getIdPelicula() +" and FechaYHora =" + fun.getFechaYHora();      
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object existe(Object dato) throws SQLException {
        Funcion resp = null;
        Sala sala = null;
        Cine cine = null;
        Pelicula peli = null;
        Conexion oCon = new Conexion();
        ResultSet rs = null;       
        oCon.getConexion();
        Funcion fun = (Funcion)dato;
        String consulta = "SELECT * FROM funciones inner join cines on idCine="+fun.getSala().getCine().getIdCine()+" inner join salas on idSala =" +fun.getSala().getIdSala()+" inner join peliculas on idPelicula="+fun.getPelicula().getIdPelicula() + "where idSala ="+fun.getSala().getIdSala() + "and idPelicula ="+fun.getPelicula().getIdPelicula() +" and FechaYHora =" + fun.getFechaYHora();      
        try {
            PreparedStatement sentencia = (PreparedStatement) oCon.getConexion().prepareStatement(consulta);
            rs = sentencia.executeQuery();            
            while (rs.next()) {
                peli = new Pelicula(rs.getInt("idPelicula"),rs.getString("Nombre"),rs.getString("Director"),rs.getInt("Duracion"),rs.getString("Descripcion"),rs.getBoolean("Estado"),rs.getString("UrlImagen"));
                cine = new Cine(rs.getInt("idCine"),rs.getString("Nombre"),rs.getString("Direccion"),rs.getBoolean("Estado"));
                sala = new Sala(rs.getInt("idSala"),rs.getInt("NumSala"),cine,rs.getInt("Columna"),rs.getInt("Fila"),rs.getBoolean("Estado"));
                resp = new Funcion(rs.getDate("FechaYHora"), rs.getInt("Duracion"), rs.getFloat("Precio"),sala, peli);
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
        
        Funcion resp = null;
        Conexion oCon = new Conexion();
        ResultSet rs = null;
        ArrayList listaPeliculas = new ArrayList();
        oCon.getConexion();
        String consulta = "SELECT * FROM funciones where Estado = 1";      
        try {
            PreparedStatement sentencia = (PreparedStatement) oCon.getConexion().prepareStatement(consulta);
            rs = sentencia.executeQuery();            
            while (rs.next()) {
                //resp = new Funcion(rs.getInt("idPelicula"), rs.getString("Nombre"), rs.getString("Director"), rs.getInt("DuracionPeli"), rs.getString("Descripcion"), rs.getBoolean("Estado"), rs.getString("UrlImagen"));
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
    
    public ArrayList listadoAdmin() throws SQLException {
        
        Funcion resp = null;
        Conexion oCon = new Conexion();
        ResultSet rs = null;
        ArrayList listaPeliculas = new ArrayList();
        oCon.getConexion();
        String consulta = "SELECT * FROM peliculas";      
        try {
            PreparedStatement sentencia = (PreparedStatement) oCon.getConexion().prepareStatement(consulta);
            rs = sentencia.executeQuery();            
            while (rs.next()) {
                //resp = new Funcion(rs.getInt("idPelicula"), rs.getString("Nombre"), rs.getString("Director"), rs.getInt("DuracionPeli"), rs.getString("Descripcion"), rs.getBoolean("Estado"), rs.getString("UrlImagen"));
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
