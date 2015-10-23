/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladora.CtrlFuncion;
import Controladora.CtrlPelicula;
import Controladora.CtrlSala;
import Modelo.Funcion;
import Modelo.Pelicula;
import Modelo.Sala;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
 * @author Jorge
 */
@WebServlet(name = "ServletFuncion", urlPatterns = {"/ServletFuncion"})
public class ServletFuncion extends HttpServlet {
    
    CtrlFuncion ctrlFuncion;
    CtrlSala ctrlSala;
    CtrlPelicula ctrlPelicula;
    
    Funcion funcion;

    public ServletFuncion(){
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
        String idFuncionEditar = request.getParameter("idF");
        String idFuncion = request.getParameter("idFuncion");
        if(request.getParameter("nombre") != null)
        {
            Sala s = ctrlSala.existe(Integer.parseInt(request.getParameter("sala")));
            Pelicula p = ctrlPelicula.existe(Integer.parseInt(request.getParameter("pelicula")));
            funcion = new Funcion(0, Date.valueOf(request.getParameter("fechaYHora")), Integer.parseInt(request.getParameter("duracion")), Float.parseFloat(request.getParameter("precio")), s, p, Boolean.parseBoolean("estado"));           
            if(idFuncionEditar.equals(""))
            {
                try {
                    ctrlFuncion.altaFuncion(funcion);
                } catch (SQLException ex) {
                Logger.getLogger(ServletRegistro.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            else
            {
                funcion.setIdFuncion(Integer.parseInt(idFuncionEditar));
                ctrlFuncion.modificaFuncion(funcion);
            }
                RequestDispatcher rd = request.getRequestDispatcher("/abmCine.jsp");
                rd.forward(request, response);
            
        }   
        if(request.getParameter("borrar") != null)
        {
            ctrlFuncion.bajaFuncion(Integer.parseInt(request.getParameter("borrar")));
        }
        
        ArrayList<Funcion> list = null;
        boolean flag = false;
        if (idFuncion == null) {
            list = ctrlFuncion.listarFunciones();
            flag = true;
        } else {
            if (!idFuncion.equals("0")) {
                list = new ArrayList<>();
                list.add(ctrlFuncion.existe(Integer.parseInt(idFuncion)));
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
            Logger.getLogger(ServletFuncion.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ServletFuncion.class.getName()).log(Level.SEVERE, null, ex);
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
