/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jorge
 */
@WebServlet(name = "ServletValidaLoginRol", urlPatterns = {"/ServletValidaLoginRol"})
public class ServletValidaLoginRol extends HttpServlet {

    Hashtable urlNoAdmin;

    public ServletValidaLoginRol() {
        urlNoAdmin = new Hashtable();
        //Agregar las URL que puede ingresar un usuario comun
        urlNoAdmin.put("/altaPelicula.jsp", "/altaPelicula.jsp");
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
            throws ServletException, IOException {
        Usuario user = new Usuario();
        HttpSession sesion = request.getSession(true);
        user = (Usuario) sesion.getAttribute("usuarioLog");
        if (user.getId() == 0) {
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=principal.jsp'>");
                out.println("<title>Servlet NewServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("</body>");
                out.println("</html>");
            }
        } else {
            if (!user.isAdministrador()) {
                String url = request.getServletPath();
                if (urlNoAdmin.get(url) == null) {
                    response.setContentType("text/html;charset=UTF-8");
                    try (PrintWriter out = response.getWriter()) {
                        /* TODO output your page here. You may use following sample code. */
                        out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0;URL=error.jsp'>");
                        out.println("<title>Servlet NewServlet</title>");
                        out.println("</head>");
                        out.println("<body>");                       
                        out.println("</body>");
                        out.println("</html>");
                    }
                } 
            }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
