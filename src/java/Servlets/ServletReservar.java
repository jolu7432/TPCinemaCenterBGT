/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladora.CtrlFuncion;
import Controladora.CtrlReservas;
import Controladora.CtrlUsuario;
import Modelo.Reserva;
import Modelo.Usuario;
import com.google.gson.Gson;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hernan
 */
@WebServlet(name = "ServletReservar", urlPatterns = {"/ServletReservar"})
public class ServletReservar extends HttpServlet {

    CtrlReservas ctrlReservas;
    CtrlFuncion ctrlFuncion;
    CtrlUsuario ctrlUsuario;
    String[] butacasReserva;

    public ServletReservar() {
	this.ctrlReservas = new CtrlReservas();
	this.ctrlFuncion = new CtrlFuncion();
	this.ctrlUsuario = new CtrlUsuario();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException, SQLException, Exception {
	String accion = request.getParameter("accion");
	String idReserva = request.getParameter("idReserva");
	String idFuncion = request.getParameter("idFuncion");
	String idUsuario = request.getParameter("idUsuario");
	String butacas = request.getParameter("ReservaButacas");
	ArrayList<Reserva> list = null;
	boolean flag = false;
	Usuario user = null;
	if (request.getParameter("user") != null) {
	    user = ctrlUsuario.traePorId(Integer.parseInt(request.getParameter("user")));
	}
	if (butacas != null) {
	    butacasReserva = new String[butacas.split("-").length];
	    butacasReserva = butacas.split("-");
	    ArrayList<Reserva> reservas = new ArrayList<Reserva>();
	    for (String aux : butacasReserva) {
		reservas.add(new Reserva(user, Integer.parseInt(aux), true, ctrlFuncion.existe(Integer.parseInt(idFuncion))));
	    }
	    ctrlReservas.altaReserva(reservas);
	} else {
	    if (request.getParameter("borrar") != null) {
		Reserva resBorrar = ctrlReservas.existe(Integer.parseInt(request.getParameter("borrar")));
		ctrlReservas.bajaReserva(resBorrar);
	    } else {
		if (request.getParameter("idUsuario") != null) {
		    list = ctrlReservas.listarXUsuario(Integer.parseInt(idUsuario));
		    flag = true;
		} else {
		    if (idReserva == null) {
			if (idFuncion != null) {
			    list = ctrlReservas.listarXFuncion(Integer.parseInt(idFuncion)); // faltaHacerlo la idea esta! creo... jeje
			    flag = true;
			}
		    }
		}

	    }
	    if (flag) {
		String json = new Gson().toJson(list);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	    }

	    //            list = ctrlFuncion.listarFuncionesXPelicula(Integer.parseInt(request.getParameter("idPelicula")));
	    //            flag = true;
	    //            } else {
	}
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	try {
	    processRequest(request, response);
	} catch (Exception ex) {
	    Logger.getLogger(ServletReservar.class.getName()).log(Level.SEVERE, null, ex);
	}
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	try {
	    processRequest(request, response);
	} catch (Exception ex) {
	    Logger.getLogger(ServletReservar.class.getName()).log(Level.SEVERE, null, ex);
	}
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
	return "Short description";
    }// </editor-fold>

}
