/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLES;

import DAO.TiposVehiculoDao;
import DTO.TiposVehiculoDto;
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
public class GestionTiposVehiculos extends HttpServlet {

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

            String Estado = "";
            TiposVehiculoDto ObjDtoTive = new TiposVehiculoDto();
            TiposVehiculoDao ObjDaoTive = new TiposVehiculoDao();
            //ArrayList<CiudadesDto> listado=new ArrayList<CiudadesDto>();

            if (request.getParameter("boton").equals("Guardar")) {
                ObjDtoTive.setIdTiposVehiculo(Integer.parseInt(request.getParameter("idTiposVehiculo")));
                ObjDtoTive.setDescripcionTipoVehiculo(request.getParameter("descripcionTipoVehiculo"));

                Estado = ObjDaoTive.IngresarTipoVehiculo(ObjDtoTive);

            } else if (request.getParameter("boton").equals("consultar")) {

            } else if (request.getParameter("boton").equals("Eliminar")) {
                int Pos = Integer.parseInt(request.getParameter("pos"));
                Estado = ObjDaoTive.EliminarTipoVehiculo(Pos);

            
        }else if (request.getParameter("boton").equals("Actualizar")) {
         }
        response.sendRedirect("/ProyectoSimva/spanish/asignacion/formTiposVehiculo.jsp?Estado=" + Estado);
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
