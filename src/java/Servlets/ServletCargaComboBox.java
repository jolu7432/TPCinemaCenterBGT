/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladora.CtrlCine;
import Controladora.CtrlPelicula;
import Controladora.CtrlSala;
import Modelo.Cine;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(name = "ServletCargaComboBox", urlPatterns = {"/ServletCargaComboBox"})
public class ServletCargaComboBox extends HttpServlet {

    CtrlCine ctrlCine;
    CtrlPelicula ctrlPelicula;
    CtrlSala ctrlSala;

    public ServletCargaComboBox() {
        this.ctrlCine = new CtrlCine();
        this.ctrlPelicula = new CtrlPelicula();
        this.ctrlSala = new CtrlSala();
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
        String accion = request.getParameter("Accion");
        String dato;
        ArrayList<Object> list = null;
        switch (accion) {
            case "Cines":
                list = ctrlCine.listarCinesActivos();
                break;
            case "Salas":
                dato = request.getParameter("idCine");
                if (!dato.equals("")) {
                    list = ctrlSala.listarSalasXCine(Integer.parseInt(dato));
                }
                break;
            case "Peliculas":
                dato = request.getParameter("idSala");
                if (!dato.equals("")) {
                    list = ctrlPelicula.listarPeliculasXSala(Integer.parseInt(dato));
                }
                break;
            default:
                break;

        }
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
            Logger.getLogger(ServletCargaComboBox.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ServletCargaComboBox.class.getName()).log(Level.SEVERE, null, ex);
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
