/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladora.CtrlPelicula;
import Modelo.Pelicula;
import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Jorge
 */
@WebServlet(name = "ServletPelicula", urlPatterns = {"/ServletPelicula"})
public class ServletPelicula extends HttpServlet {
    
    CtrlPelicula ctrlPelicula;
    
    public ServletPelicula() {
	this.ctrlPelicula = new CtrlPelicula();
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
	    throws ServletException, IOException, SQLException, FileUploadException, Exception {
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (isMultipart) {
	    cargarPelicula(request, response);
	    
	} else if (request.getParameter("borrar") != null) {
	    String idPeli = request.getParameter("borrar");
	    ctrlPelicula.bajaPelicula(Integer.parseInt(idPeli));
	} else {
	    listarPeliculas(request, response);
	}
    }
    
    private void cargarPelicula(HttpServletRequest request, HttpServletResponse response) throws FileUploadException, Exception {
	FileItemFactory file_factory = new DiskFileItemFactory();
	ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
	List items = servlet_up.parseRequest(request);
	String urlImg = "";
	String mirar = "";
	Hashtable datosPelicula = new Hashtable();
	for (int i = 0; i < items.size(); i++) {
	    FileItem item = (FileItem) items.get(i);
	    if (!item.isFormField()) {
		urlImg = item.getName();
		if (!urlImg.equals("")) {
		    String dir = getServletContext().getRealPath("/");
		    String dir2 = dir.replaceAll("web", "img");
		    String dir3 = dir2.replaceAll("build", "web");
		    File fileFoto = new File(dir3, item.getName());
		    item.write(fileFoto);
		}
	    } else {
		//if(item.getFieldName().equals("chkestado"))
		mirar += " " + item.getFieldName();
		datosPelicula.put(item.getFieldName(), new String(item.getString().getBytes("iso-8859-1"), "UTF-8"));
	    }
	}
	if (urlImg.equals("")) {
	    urlImg = (String) datosPelicula.get("imgdefecto");
	}
	if (mirar != " ") {
	    mirar += " ";
	}
	Pelicula nueva = new Pelicula(datosPelicula.get("nombre").toString(), datosPelicula.get("director").toString(), Integer.parseInt(datosPelicula.get("duracion").toString()), datosPelicula.get("descripcion").toString(), true, urlImg);
	String estado = (String) datosPelicula.get("chbestado");
	boolean disponible = false;
	if (estado != null) {
	    disponible = true;
	    nueva.setEstado(disponible);
	}
	String mod = (String) datosPelicula.get("Modifica");
	if (mod == null) {
	    ctrlPelicula.altaPelicula(nueva);
	} else {
	    int id = Integer.parseInt((String) datosPelicula.get("Modifica"));
	    nueva.setIdPelicula(id);
	    ctrlPelicula.modificapelicula(nueva);
	}
	RequestDispatcher aux = request.getRequestDispatcher("/abmPelicula.jsp");
	aux.include(request, response);
    }
    
    private void listarPeliculas(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
	String idPelicula = request.getParameter("idPelicula");
	ArrayList<Pelicula> list = null;
	boolean flag = false;
	if (idPelicula == null) {
	    String url = request.getParameter("urlPage");
	    if (url != null) {
		list = ctrlPelicula.listarPeliculas();
	    } else {
		list = ctrlPelicula.listarPeliculasAdmin();
	    }
	    flag = true;
	} else {
	    if (!idPelicula.equals("0")) {
		list = new ArrayList<>();
		list.add(ctrlPelicula.existe(Integer.parseInt(idPelicula)));
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
	    Logger.getLogger(ServletPelicula.class.getName()).log(Level.SEVERE, null, ex);
	} catch (Exception ex) {
	    Logger.getLogger(ServletPelicula.class.getName()).log(Level.SEVERE, null, ex);
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
	    Logger.getLogger(ServletPelicula.class.getName()).log(Level.SEVERE, null, ex);
	} catch (Exception ex) {
	    Logger.getLogger(ServletPelicula.class.getName()).log(Level.SEVERE, null, ex);
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
