/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLES;

import DAO.TiposCombustiblesDao;
import DTO.TiposCombustiblesDto;
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
public class GestionTiposCombustibles extends HttpServlet {

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
                
            String tipoCombustible = "";
            
            TiposCombustiblesDto ObjDtoTico = new TiposCombustiblesDto();
            TiposCombustiblesDao ObjDaoTiCo = new TiposCombustiblesDao();
            
            if(request.getParameter("enviar").equals("Guardar")){
                ObjDtoTico.setIdTiposCombustibles(Integer.parseInt(request.getParameter("idTiposCombustibles")));
                ObjDtoTico.setDescripcionTipoCombustible(request.getParameter("descripcionTipoCombustible"));
                
                tipoCombustible = ObjDaoTiCo.IngresarTiposCombustibles(ObjDtoTico);
                
            }else if(request.getParameter("enviar").equals("Consultar")){
                
            }else if(request.getParameter("enviar").equals("Eliminar")){
                
                int Pos = Integer.parseInt(request.getParameter("pos"));
               
               tipoCombustible = ObjDaoTiCo.EliminarTiposCombustibles(Pos);
                
            }else if(request.getParameter("enviar").equals("Actualizar")){
                
            }
            response.sendRedirect("/ProyectoSimva/spanish/asignacion/formTiposCombustibles.jsp?tipoCombustible=" + tipoCombustible);
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
