/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLES;

import DAO.FuncionarioDao;
import DAO.UsuariosDao;
import DTO.FuncionarioRolDto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Diego
 */
public class GestionUsuarios extends HttpServlet {

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
            
           String Estado = "";
           
           HttpSession miSession = request.getSession();
           FuncionarioRolDto ObjDtoF = new FuncionarioRolDto();
           FuncionarioDao ObjDaoF = new FuncionarioDao();
           UsuariosDao objDao = new UsuariosDao();
            int id=0;
            if (request.getParameter("boton").equals("enviar")){
                
            ObjDtoF.setIdFuncionarioRol(id);
            ObjDtoF.setIdRol(Integer.parseInt(request.getParameter("")));
            ObjDtoF.setNumeroDocumento(Integer.parseInt(request.getParameter("")));
            ObjDtoF.setUsuarioLogin(request.getParameter(""));
            ObjDtoF.setContraseña(request.getParameter(""));
            ObjDtoF.setFechaCreacion(request.getParameter(""));
            
            
          Estado = ObjDaoF.IngresarUsuario(ObjDtoF);
            response.sendRedirect("/ProyectoSimva/spanish/administrador/usuarios.jsp?Estado="+Estado);
                //HttpSession miSession = request.getSession(true);
                //miSession.setAttribute("IdCiudad", out);
                
                //request.getRequestDispatcher("Ciudades.jsp").forward(request, response);
                //response.sendRedirect("/spanish/administrador/Ciudades.jsp");
                
                //RequestDispatcher RD = request.getRequestDispatcher("/spanish/administrador/Ciudades.jsp");
                
                //RD.forward(request, response);
            
            } else if (request.getParameter("boton").equals("Eliminar")){
             int Pos = Integer.parseInt(request.getParameter("pos"));
             Estado = ObjDaoF.Eliminar(Pos);
            response.sendRedirect("/ProyectoSimva/spanish/administrador/usuarios_1.jsp");
//            request.getRequestDispatcher("Ciudades.jsp").forward(request, response);
              //RequestDispatcher RD = request.getRequestDispatcher("/spanish/administrador/Ciudades.jsp");
                //RD.forward(request, response);
   
            } else if (request.getParameter("boton").equals("Buscar")){
                
                
                
                String cedula = request.getParameter("cedula");
                ObjDtoF.setNumeroDocumento(Integer.parseInt(request.getParameter("cedula")));                
                
                
                
                response.sendRedirect("/ProyectoSimva/spanish/administrador/usuarios.jsp?Estado="+Estado);
                
                
            
            } else if (request.getParameter("boton").equals("Consultar Todos")){

            response.sendRedirect("/ProyectoSimva/spanish/administrador/usuarios_1.jsp"); 
            
            } else if(request.getParameter("boton").equals("Actualizar")){
                
                ObjDtoF.setIdRol(Integer.parseInt(request.getParameter("rol")));
                ObjDtoF.setUsuarioLogin(request.getParameter("usuario"));
                ObjDtoF.setContraseña(request.getParameter("contrasenia"));
                ObjDtoF.setNumeroDocumento(Integer.parseInt(request.getParameter("cedula")));
                ObjDtoF.setFechaCreacion(request.getParameter("fecha"));
         
                
             Estado = objDao.Actualizarcata(ObjDtoF);
            
            out.print(Estado);
            
            request.getRequestDispatcher("usuarios_4.jsp?mensaje="+Estado).forward(request, response);
                
                
                
                
            //int Pos = Integer.parseInt(request.getParameter("pos"));
            
           // miSession.setAttribute("Pos", Pos);
            
            //response.sendRedirect("/ProyectoSimva/spanish/administrador/usuarios_2.jsp"); 
                 
                 
            //Estado = ObjDaoF.ActualizarUsuario(ObjDtoF);
            
//            ObjDtoF.setIdFuncionarioRol(0);
//            ObjDtoF.setIdRol(Integer.parseInt(request.getParameter("idrol")));
//            ObjDtoF.setNumeroDocumento(Cedula);
//            ObjDtoF.setUsuarioLogin(request.getParameter("usuario"));
//            ObjDtoF.setContraseña(request.getParameter("contrasenia"));
//            ObjDtoF.setFechaCreacion(null);
            
            //response.sendRedirect("/ProyectoSimva/spanish/administrador/usuarios_2.jsp"); 
                 
            
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
