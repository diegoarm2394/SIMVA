/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLES;

import DAO.AsignacionesDao;
import DTO.AsignacionesDto;
import DTO.VehiculosDto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jairo
 */
@WebServlet(name = "GestionAsignaciones", urlPatterns = {"/GestionAsignaciones"})
public class GestionAsignaciones extends HttpServlet {

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

            String Asig = "";

            AsignacionesDao ObjDaoAsig = new AsignacionesDao();
            AsignacionesDto ObjDtoAsig = new AsignacionesDto();

            if (request.getParameter("enviar").equals("Guardar")) {

                ObjDtoAsig.setIdAsignaciones(Integer.parseInt(request.getParameter("numeroActa")));
                ObjDtoAsig.setNumeroDocumento(Integer.parseInt(request.getParameter("numeroDocumento")));
                ObjDtoAsig.setPlaca(request.getParameter("placa"));
                ObjDtoAsig.setFechaAsignacion("fechaAsignacion");
                ObjDtoAsig.setFechaDesacignacion("fechaDesasignacion");
                ObjDtoAsig.setNovedadesVehiculos("novedadesVehiculo");

                Asig = ObjDaoAsig.IngresarAsignacion(ObjDtoAsig);
            } else if (request.getParameter("enviar").equals("Consultar")) {
            }
            response.sendRedirect("/ProyectoSimva/spanish/asignacion/formAsignacion.jsp?Asig=" + Asig);
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
