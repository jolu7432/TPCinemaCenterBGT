/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladora.CtrlCine;
import Controladora.CtrlSala;
import Modelo.Cine;
import Modelo.Sala;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author microtik
 */
@WebServlet(name = "ServletSala", urlPatterns = {"/ServletSala"})
public class ServletSala extends HttpServlet {
    
    private CtrlCine ctrlcine = null;
    private CtrlSala ctrlsala = null;

    public ServletSala() {
	ctrlcine = new CtrlCine();
	ctrlsala = new CtrlSala();
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
	    throws ServletException, IOException, SQLException {
	        String idSala = request.getParameter("idSala");
	if(request.getParameter("guardar") != null){
	    Cine c = ctrlcine.existe(Integer.parseInt(request.getParameter("cine")));
	    int num = Integer.parseInt(request.getParameter("numero"));
	    int col = Integer.parseInt(request.getParameter("columnas"));
	    int fil = Integer.parseInt(request.getParameter("filas"));
	    Sala s = new Sala(0,num, c,col,fil,true);
	    ctrlsala.altaSala(s);
	    RequestDispatcher rd = request.getRequestDispatcher("/abmSala.jsp");
                rd.forward(request, response);
	}
                
        ArrayList<Sala> list = null;
        boolean flag = false;
        if (idSala == null) {
            list = ctrlsala.listarSalas();
            flag = true;
        } else {
            if (!idSala.equals("0")) {
                list = new ArrayList<>();
                list.add(ctrlsala.existe(Integer.parseInt(idSala)));
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
	    Logger.getLogger(ServletSala.class.getName()).log(Level.SEVERE, null, ex);
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
	    Logger.getLogger(ServletSala.class.getName()).log(Level.SEVERE, null, ex);
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
