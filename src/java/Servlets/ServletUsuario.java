/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controladora.CtrlLogin;
import Controladora.CtrlUsuario;
import Modelo.Usuario;
import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author microtik
 */
@WebServlet(name = "ServletUsuario", urlPatterns = {"/ServletUsuario"})
public class ServletUsuario extends HttpServlet {

    private CtrlUsuario ctrlUsuario;
    private CtrlLogin ctrlLogin;
    private Usuario user;

    public ServletUsuario() {
	ctrlUsuario = new CtrlUsuario();
	ctrlLogin = new CtrlLogin();
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
	response.setContentType("text/html;charset=UTF-8");
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (isMultipart) {
	    cargaUsuario(request, response);
	} else if (request.getParameter("borrar") != null) {
	    String iduser = request.getParameter("borrar");
	    ctrlUsuario.bajaUsuario(Integer.parseInt(iduser));
	    response.setIntHeader("Refresh", 0);
	} else {
	    listaUsuario(request, response);
	}
    }

    private void cargaUsuario(HttpServletRequest request, HttpServletResponse response) throws FileUploadException, Exception {
	FileItemFactory file_factory = new DiskFileItemFactory();
	ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
	List items = servlet_up.parseRequest(request);
	String urlImg = "";
	Hashtable datosUsuario = new Hashtable();
	HttpSession valida = null;
	for (int i = 0; i < items.size(); i++) {
	    FileItem item = (FileItem) items.get(i);
	    if (!item.isFormField()) {
		urlImg = item.getName();
		if (!urlImg.equals("")) {
		    String dir = getServletContext().getRealPath("/");
		    String dir2 = dir.replaceAll("web", "img");
		    String dir3 = dir2.replaceAll("build", "web");
		    dir3.concat("imgUsuarios/");
		    File fileFoto = new File(dir3, item.getName());
		    item.write(fileFoto);
		}
	    } else {
		datosUsuario.put(item.getFieldName(), item.getString());
	    }
	}
	String adm = (String) datosUsuario.get("administrador");
	boolean esAdm = false;
	if (adm != null) {
	    esAdm = true;
	}
	if (urlImg.equals("")) {
	    urlImg = (String) datosUsuario.get("imgdefecto");
	}
	user = new Usuario(0, (String) datosUsuario.get("nombre"), (String) datosUsuario.get("apellido"), Integer.parseInt((String) datosUsuario.get("dni")), esAdm, (String) datosUsuario.get("user"), (String) datosUsuario.get("pass"), (String) datosUsuario.get("email"), (String) datosUsuario.get("telefono"), urlImg);
	RequestDispatcher rd = getServletContext().getRequestDispatcher("/ServletValidaUser?user=" + user.getUser() + "&email=" + user.getEmail());
	rd.include(request, response);
	valida = request.getSession(true);
	if (valida.getAttribute("usuarioValid") == null) {
	    try {
		ctrlUsuario.registraUsuario(user);
	    } catch (SQLException ex) {
		Logger.getLogger(ServletRegistro.class.getName()).log(Level.SEVERE, null, ex);
	    }
	} else {
	    Usuario aux = (Usuario) valida.getAttribute("usuarioValid");
	    user.setId(aux.getId());
	    ctrlUsuario.modificarUsuario(user);
	}
	RequestDispatcher rdfw = request.getRequestDispatcher("/abmUsuario.jsp");
	rdfw.forward(request, response);
	valida.invalidate();
    }

    private void listaUsuario(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
	String idUsuario = request.getParameter("id");
	ArrayList<Usuario> list = null;
	boolean flag = false;
	if (idUsuario == null) {
	    flag = true;
	} else {
	    if (!idUsuario.equals("0")) {
		list = new ArrayList<>();
		list.add(ctrlUsuario.traePorId(Integer.parseInt(idUsuario)));
		flag = true;
	    } else {
		list = ctrlUsuario.listarUsuarios();
	    }
	    if (flag) {
		String json = new Gson().toJson(list);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
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
	try {
	    processRequest(request, response);
	} catch (Exception ex) {
	    Logger.getLogger(ServletUsuario.class.getName()).log(Level.SEVERE, null, ex);
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
	    Logger.getLogger(ServletUsuario.class.getName()).log(Level.SEVERE, null, ex);
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
