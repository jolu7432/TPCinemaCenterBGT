/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladora.CtrlCine;
import Modelo.Cine;
import com.google.gson.Gson;
import java.io.IOException;
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
 * @author herna
 */
@WebServlet(name = "ServletCine", urlPatterns = {"/ServletCine"})
public class ServletCine extends HttpServlet {

    CtrlCine ctrlCine;

    public ServletCine() {
        this.ctrlCine = new CtrlCine();
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
        
            String idCine = request.getParameter("idCine");
            if(idCine.equals("0"))
            {
                Cine nuevo = new Cine(datosPelicula.get("nombre").toString(), datosPelicula.get("direccion").toString(), Integer.parseInt(datosCine.get("duracion").toString()), datosPelicula.get("descripcion").toString(), true, urlImg);
                ctrlPelicula.altaPelicula(nueva);
                RequestDispatcher aux = request.getRequestDispatcher("/abmCine.jsp");
                aux.include(request, response);
            }
            ArrayList<Cine> list = null;
            boolean flag = false;
            if (idCine == null) {
                list = ctrlCine.listarCines();
                flag = true;
            } else {
                if (!idCine.equals("0")) {
                    list = new ArrayList<>();
                    list.add(ctrlCine.existe(Integer.parseInt(idCine)));
                    flag = true;
                }
            }
            if (flag) {
                String json = new Gson().toJson(list);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
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
        } catch (SQLException ex) {
            Logger.getLogger(ServletCine.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ServletCine.class.getName()).log(Level.SEVERE, null, ex);
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
