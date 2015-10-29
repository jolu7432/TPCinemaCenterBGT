/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Bruno, Jorge, Hernan
 */
public class Reserva {
    private int idReserva;
    private Usuario user;
    private int butaca;
    private boolean confirmacion;
    private Funcion funcion;

    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public Usuario getUser() {
        return user;
    }

    public void setUser(Usuario user) {
        this.user = user;
    }

    public int getButaca() {
        return butaca;
    }

    public void setButaca(int butaca) {
        this.butaca = butaca;
    }

    public boolean isConfirmacion() {
        return confirmacion;
    }

    public void setConfirmacion(boolean confirmacion) {
        this.confirmacion = confirmacion;
    }

    public Funcion getFuncion() {
        return funcion;
    }

    public void setFuncion(Funcion funcion) {
        this.funcion = funcion;
    }

    public Reserva(int idReserva, Usuario user, int butaca, boolean confirmacion, Funcion funcion) {
        this.idReserva = idReserva;
        this.user = user;
        this.butaca = butaca;
        this.confirmacion = confirmacion;
        this.funcion = funcion;
    }

    public Reserva(int idReserva) {
        this.idReserva = idReserva;
    }
    
    
    
}
