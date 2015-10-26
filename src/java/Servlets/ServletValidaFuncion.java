/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladora.CtrlFuncion;
import Modelo.Cine;
import Modelo.Funcion;
import Modelo.Pelicula;
import Modelo.Sala;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jorge
 */
@WebServlet(name = "ServletValidaFuncion", urlPatterns = {"/ServletValidaFuncion"})
public class ServletValidaFuncion extends HttpServlet {

    CtrlFuncion ctrlFuncion;

    public ServletValidaFuncion() {
        this.ctrlFuncion = new CtrlFuncion();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String fechaRequest = request.getParameter("FechaYHora").replace(" ", "-").replace(":", "-");
        String[] f = fechaRequest.split("-");
        java.util.Date fecha = new Timestamp(Integer.parseInt(f[0]) - 1900, Integer.parseInt(f[1]) - 1, Integer.parseInt(f[2]), Integer.parseInt(f[3]), Integer.parseInt(f[4]), 0, 0);
        Cine cine = new Cine(Integer.parseInt(request.getParameter("idCine")));
        Funcion fun = new Funcion(0, fecha, Integer.parseInt(request.getParameter("Duracion")), 0, new Sala(Integer.parseInt(request.getParameter("idSala")), cine), null, true);
        if (!request.getParameter("idFuncion").equals("")) {
            fun.setIdFuncion(Integer.parseInt(request.getParameter("idFuncion")));
        }
        ArrayList<Funcion> list = ctrlFuncion.validaFuncion(fun);
        String json = new Gson().toJson(list);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
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
        } catch (SQLException ex) {
            Logger.getLogger(ServletValidaFuncion.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(ServletValidaFuncion.class.getName()).log(Level.SEVERE, null, ex);
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
