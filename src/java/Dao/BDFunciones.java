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
import java.util.Date;

/**
 *
 * @author Jorge
 */
public class BDFunciones implements IBD {

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
            // sentencia.setDate(1, new java.sql.Date(aux.getFechaYHora()));  
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
        Funcion fun = (Funcion) dato;
        String consulta = "UPDATE funciones set Estado = false where idFuncion =" + fun.getIdFuncion();
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
        Conexion oCon = new Conexion();
        oCon.getConexion();
        Funcion aux = (Funcion) dato;
        String update = "UPDATE funciones SET  FechaYHora = '" +aux.getFechaYHora() + "', Duracion = '" +aux.getDuracion() + "', Precio = " + aux.getPrecio() + "', idSala = '" +aux.getSala().getIdSala() + "', idPelicula = '" +aux.getPelicula().getIdPelicula() + "', Estado = '" +aux.isEstado() + " WHERE idFuncion = " + aux.getIdFuncion();
        try {
            PreparedStatement sentencia = (PreparedStatement) oCon.getConexion().prepareStatement(update);
            sentencia.execute();
            sentencia.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            oCon.close();
        }
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
        Funcion fun = (Funcion) dato;
        String consulta = "SELECT P.idPelicula,P.Nombre as NombrePeli,P.Director,P.DuracionPeli,P.Descripcion,P.Estado as EstadoPeli, P.UrlImagen,C.idCine,C.Nombre as NombreCine,C.Direccion,C.Estado as EstadoCine,S.idSala,S.NumSala,S.Columna,S.Fila,S.Estado as EstadoSala,funciones.idFuncion,funciones.FechaYHora,funciones.Duracion as DuracionFuncion,funciones.Precio FROM funciones inner join salas S on S.idSala = funciones.idSala inner join cines C on C.idCine = S.idCine inner join peliculas P on P.idPelicula = funciones.idPelicula where funciones.idFuncion =" + fun.getIdFuncion();
        try {
            PreparedStatement sentencia = (PreparedStatement) oCon.getConexion().prepareStatement(consulta);
            rs = sentencia.executeQuery();
            while (rs.next()) {
                peli = new Pelicula(rs.getInt("idPelicula"), rs.getString("NombrePeli"), rs.getString("Director"), rs.getInt("DuracionPeli"), rs.getString("Descripcion"), rs.getBoolean("EstadoPeli"), rs.getString("UrlImagen"));
                cine = new Cine(rs.getInt("idCine"), rs.getString("NombreCine"), rs.getString("Direccion"), rs.getBoolean("EstadoCine"));
                sala = new Sala(rs.getInt("idSala"), rs.getInt("NumSala"), cine, rs.getInt("Columna"), rs.getInt("Fila"), rs.getBoolean("EstadoSala"));
                Date newDate = rs.getTimestamp("FechaYHora"); 
                resp = new Funcion(rs.getInt("idFuncion"), newDate, rs.getInt("DuracionFuncion"), rs.getFloat("Precio"), sala, peli, rs.getBoolean("Estado"));
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
        Sala sala = null;
        Cine cine = null;
        Pelicula peli = null;
        Conexion oCon = new Conexion();
        ResultSet rs = null;
        ArrayList listaFunciones = new ArrayList();
        oCon.getConexion();
        String consulta = "SELECT P.idPelicula,P.Nombre as NombrePeli,P.Director,P.DuracionPeli,P.Descripcion,P.Estado as EstadoPeli, P.UrlImagen,C.idCine,C.Nombre as NombreCine,C.Direccion,C.Estado as EstadoCine,S.idSala,S.NumSala,S.Columna,S.Fila,S.Estado as EstadoSala,funciones.idFuncion,funciones.FechaYHora,funciones.Duracion as DuracionFuncion,funciones.Precio FROM funciones inner join salas S on S.idSala = funciones.idSala inner join cines C on C.idCine = S.idCine inner join peliculas P on P.idPelicula = funciones.idPelicula where funciones.Estado = 1";
        try {
            PreparedStatement sentencia = (PreparedStatement) oCon.getConexion().prepareStatement(consulta);
            rs = sentencia.executeQuery();
            while (rs.next()) {
                peli = new Pelicula(rs.getInt("idPelicula"), rs.getString("NombrePeli"), rs.getString("Director"), rs.getInt("DuracionPeli"), rs.getString("Descripcion"), rs.getBoolean("EstadoPeli"), rs.getString("UrlImagen"));
                cine = new Cine(rs.getInt("idCine"), rs.getString("NombreCine"), rs.getString("Direccion"), rs.getBoolean("EstadoCine"));
                sala = new Sala(rs.getInt("idSala"), rs.getInt("NumSala"), cine, rs.getInt("Columna"), rs.getInt("Fila"), rs.getBoolean("EstadoSala"));              
                Date newDate = rs.getTimestamp("FechaYHora");               
                resp = new Funcion(rs.getInt("idFuncion"), newDate, rs.getInt("DuracionFuncion"), rs.getFloat("Precio"), sala, peli, rs.getBoolean("Estado") );
                listaFunciones.add(resp);
            }
            rs.close();
            sentencia.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            oCon.close();
            return listaFunciones;
        }
    }
}
