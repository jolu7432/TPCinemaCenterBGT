/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author hernan
 */
public class Cine {
    private int idCine;
    private String nombre;
    private String direccion;
    private boolean estado;
    
    
    
    public int getIdCine() {
        return idCine;
    }

    public void setIdCine(int idCine) {
        this.idCine = idCine;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public Cine(int idCine, String nombre, String direccion, boolean estado) {
        this.idCine = 0;
        this.nombre = nombre;
        this.direccion = direccion;
        this.estado = estado;
    }
    
    public Cine(int idCine) {
        this.idCine = 0;
        this.nombre = "";
        this.direccion = "";
        this.estado = false;
    }
    
    public Cine() {
    }
    
    
}
