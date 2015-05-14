/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLES;

import DAO.FuncionarioDao;
import DAO.LoginDao;
import DTO.FuncionarioRolDto;
import DTO.FuncionariosDto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Diego
 */
@WebServlet(name = "GestionLogin", urlPatterns = {"/GestionLogin"})
public class GestionLogin extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
            FuncionarioDao ObjDao = new FuncionarioDao();
            FuncionarioRolDto ObjDto = new FuncionarioRolDto();
            FuncionariosDto ObjDtoF = new FuncionariosDto();
            LoginDao Login = new LoginDao();
            HttpSession miSession = request.getSession();
            
            boolean existeUsuario = false;
            String usuario = request.getParameter("usuario");
            String contrasenia = request.getParameter("clave");
            
            ObjDto.setUsuarioLogin(usuario);
            ObjDto.setContraseña(contrasenia);
            ObjDto = Login.Login(ObjDto);
            
            if(ObjDto.getUsuarioLogin().equals("No en contrado")){  
                String mensaje="1";
                miSession.setAttribute("mensaje", mensaje);
                response.sendRedirect("/ProyectoSimva/spanish/index-es.jsp");
            }else{
                
               miSession.setAttribute("usuario", ObjDto);
                
                if (ObjDto.getIdRol()==100){
                    response.sendRedirect("/ProyectoSimva/spanish/administrador.jsp");
                } else if (ObjDto.getIdRol()==200){
                    response.sendRedirect("/ProyectoSimva/spanish/asignacion.jsp");
                } else if (ObjDto.getIdRol()==300){
                    response.sendRedirect("/ProyectoSimva/spanish/mantenimiento.jsp");
                } else if (ObjDto.getIdRol()==400){
                    response.sendRedirect("/ProyectoSimva/spanish/administrador.jsp");
                }
                //De lo contrario vamos a la página errorLogin.jsp
               
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
