/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Date;

/**
 *
 * @author Jorge
 */
public class Funcion {    
    private Date fechaYHora;
    private int duracion;
    private float precio;
    private Sala sala;
    private Pelicula pelicula;   

    public Date getFechaYHora() {
        return fechaYHora;
    }

    public void setFechaYHora(Date fechaYHora) {
        this.fechaYHora = fechaYHora;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public Sala getSala() {
        return sala;
    }

    public void setSala(Sala sala) {
        this.sala = sala;
    }

    public Pelicula getPelicula() {
        return pelicula;
    }

    public void setPelicula(Pelicula pelicula) {
        this.pelicula = pelicula;
    }   
   

    public Funcion(Date fechaYHora, int duracion, float precio, Sala sala, Pelicula pelicula) {
        
        this.fechaYHora = fechaYHora;
        this.duracion = duracion;
        this.precio = precio;
        this.sala = sala;
        this.pelicula = pelicula;
    }
    
}
