/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLES;

import DAO.UsuariosDao;
import DTO.FuncionarioRolDto;
import DTO.FuncionariosDto;
import Modelo.Mailer;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Diego
 */
public class ControlUsuarios extends HttpServlet {

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

            HttpSession miSession = request.getSession();
            FuncionarioRolDto objDto = new FuncionarioRolDto();
            FuncionariosDto objDtoF = new FuncionariosDto();
            UsuariosDao objDao = new UsuariosDao();

            if (request.getParameter("boton").equals("Buscar")) {

                //objDto=objDao.ConsultarUno(Integer.parseInt(request.getParameter("cedula")));
                objDtoF = objDao.ConsultarUno2(Integer.parseInt(request.getParameter("cedula1")));
                objDto = objDao.ConsultarUno(Integer.parseInt(request.getParameter("cedula1")));

                if (objDto.getUsuarioLogin() != null) {
                    miSession.setAttribute("Obj", objDto);
                    miSession.setAttribute("Obj2", objDtoF);
                    miSession.setAttribute("cedula2", request.getParameter("cedula1"));
                    response.sendRedirect("/ProyectoSimva/spanish/administrador/user.jsp");
                } else if (objDtoF.getNombre1() != null) {
                    miSession.setAttribute("Obj2", objDtoF);
                    miSession.setAttribute("cedula2", request.getParameter("cedula1"));
                    response.sendRedirect("/ProyectoSimva/spanish/administrador/usuario.jsp");
                } else {
                    response.sendRedirect("/ProyectoSimva/spanish/administrador/user.jsp");
                }

            }

            if (request.getParameter("boton").equals("Enviar")) {

                objDto.setIdRol(Integer.parseInt(request.getParameter("rol")));
                objDto.setUsuarioLogin(request.getParameter("usuario"));
                objDto.setContraseña(request.getParameter("contrasenia"));
                objDto.setNumeroDocumento(Integer.parseInt(request.getParameter("cedula1")));
                objDto.setFechaCreacion(request.getParameter("fecha"));

                String Estado = objDao.IngresarUsuario(objDto);

                miSession.setAttribute("mensaje", Estado);

                String para = "diegoarm2394@hotmail.com";
                String sujeto = "Registro exitoso";
                String mensaje = Estado;

                Mailer.send(para, sujeto, mensaje);

                response.sendRedirect("/ProyectoSimva/spanish/administrador/user.jsp");

            } else if (request.getParameter("boton").equals("Eliminar")) {

                int pos = Integer.parseInt(request.getParameter("pos"));
                objDao.Eliminar(pos);

                RequestDispatcher Rd = request.getRequestDispatcher("usuarios.jsp?men=1");
                //   Rd = getServletContext().getRequestDispatcher("/index.jsp?mensaje=1");
                Rd.forward(request, response);

            } else if (request.getParameter("boton").equals("Actualizar")) {

                objDto.setIdRol(Integer.parseInt(request.getParameter("rol")));
                objDto.setUsuarioLogin(request.getParameter("usuario"));
                objDto.setContraseña(request.getParameter("contrasenia"));
                objDto.setNumeroDocumento(Integer.parseInt(request.getParameter("cedula1")));
                objDto.setFechaCreacion("2015-01-01");

                String Estado = objDao.Actualizarcata(objDto);
                //request.setAttribute("mensaje",Estado); 
                out.print(Estado);

                response.sendRedirect("/ProyectoSimva/spanish/administrador/usuarios_1.jsp");
                //request.getRequestDispatcher("/ProyectoSimva/spanish/administrador/usuarios_1.jsp?mensaje="+Estado).forward(request, response);
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
