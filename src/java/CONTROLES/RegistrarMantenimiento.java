/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLES;

import DAO.Mantenimiento1DAO;
import DTO.MantenimientosDto;
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
public class RegistrarMantenimiento extends HttpServlet {

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
            String Funcion ="";
            MantenimientosDto mantenimiento = new MantenimientosDto();
            Mantenimiento1DAO mantenimientoDao =new Mantenimiento1DAO();
            
            
            mantenimiento.setPlaca(request.getParameter("placa"));
            mantenimiento.setIdMantenimientos(Integer.parseInt(request.getParameter("idMantenimiento")));
            mantenimiento.setFechaIngresoMantenimiento(request.getParameter("campoFechaI"));
            mantenimiento.setIdTipoMantenimiento(Integer.parseInt(request.getParameter("estado")));
            mantenimiento.setFechaSalidaMantenimiento(request.getParameter("FechaF"));
            mantenimiento.setFechaProximoMantenimiento(request.getParameter("campoFechaP"));
            mantenimiento.setObservaciones(null);
            
            Funcion = mantenimientoDao.crearMantenimiento(mantenimiento);

            //Para mostrar el input y botón de consulta de placa 
            boolean creo = true;
            String mensaje = "";        
            String placa ="";

            if (placa != null) {

                int idMantenimiento = obtenerUltimoMantenimiento();
                placa = request.getParameter("placa");

                //Se agrega uno al mantenimiento
                idMantenimiento++;

                mensaje = crearMantenimiento(idMantenimiento, placa);

                System.out.print("Id de mantenimiento : " + idMantenimiento);
                mensaje += ". No." + idMantenimiento
                        + " Placas:" + placa;
                
               
                
            } else {
                creo = false;
                mensaje = "No se encontro el funcionario.";
            }

            request.getSession().setAttribute("tipoGrado", null);
            request.getSession().setAttribute("tipoVehiculo", null);
            request.getSession().setAttribute("documento", null);
            request.getSession().setAttribute("placa", null);
            request.getSession().setAttribute("idMantenimiento", null);
            request.getSession().setAttribute("apellido1", null);

            request.getSession().setAttribute("consulto", false);
            request.getSession().setAttribute("mensaje", mensaje);
            
            response.sendRedirect("/ProyectoSimva/spanish/mantenimiento/crearMant.jsp?Funcion="+Funcion);
            

        }catch(Exception e){
            e.printStackTrace();
        }

    }

    private int obtenerUltimoMantenimiento() {
        Mantenimiento1DAO mantenimientoDAO = new Mantenimiento1DAO();
        return mantenimientoDAO.obtenerUltimoMantenimiento();
    }

    private String crearMantenimiento(int idMantenimiento, String placa) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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