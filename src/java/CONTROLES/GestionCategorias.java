/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLES;

import DAO.CategoriasDao;
import DAO.RhDao;
import DTO.CategoriasDto;
import DTO.RhDto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jairo
 */
public class GestionCategorias extends HttpServlet {

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
            CategoriasDto ObjDtoCate = new CategoriasDto();
            CategoriasDao ObjDaoCate = new CategoriasDao();

            if (request.getParameter("boton").equals("enviar")) {
                ObjDtoCate.setIdCategoria(Integer.parseInt(request.getParameter("idCategoria")));
                ObjDtoCate.setDescripcionCategoria(request.getParameter("descripcionCategoria"));

                Estado = ObjDaoCate.IngresarCategoria(ObjDtoCate);

            } else if (request.getParameter("boton").equals("consultar")) {

            } else if (request.getParameter("boton").equals("Eliminar")) {
                int Pos = Integer.parseInt(request.getParameter("pos"));
                Estado = ObjDaoCate.EliminarCategoria(Pos);
            } else if (request.getParameter("boton").equals("Actualizar")) {

            }
            response.sendRedirect("/ProyectoSimva/spanish/asignacion/formCategorias.jsp?Estado=" + Estado);
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
