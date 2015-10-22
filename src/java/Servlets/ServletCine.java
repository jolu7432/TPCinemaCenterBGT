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
import javax.servlet.RequestDispatcher;
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
    
    private Cine cine;
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
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String idCineEditar = request.getParameter("idC");
        String idCine = request.getParameter("idCine");
        if(request.getParameter("nombre") != null)
        {
            cine = new Cine(0, request.getParameter("nombre"), request.getParameter("direccion"), true );           
            if(idCineEditar.equals(""))
            {
                try {
                    ctrlCine.altaCine(cine);
                } catch (SQLException ex) {
                Logger.getLogger(ServletRegistro.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            else
            {
                cine.setIdCine(Integer.parseInt(idCineEditar));
                ctrlCine.modificaCine(cine);
            }
                RequestDispatcher rd = request.getRequestDispatcher("/abmCine.jsp");
                rd.forward(request, response);
            
        }   
        if(request.getParameter("borrar") != null)
        {
            ctrlCine.bajaCine(Integer.parseInt(request.getParameter("borrar")));
            RequestDispatcher rd = request.getRequestDispatcher("/abmCine.jsp");
            rd.forward(request, response);
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
