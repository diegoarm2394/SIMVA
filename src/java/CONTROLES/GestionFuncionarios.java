/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLES;

import DAO.FuncionariosDao;
import DTO.FuncionariosDto;
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
public class GestionFuncionarios extends HttpServlet {

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
          
            String funci ="";

            FuncionariosDto ObjDtoFunci = new FuncionariosDto();
            FuncionariosDao ObjDaoFunci = new FuncionariosDao();
            
            if(request.getParameter("enviar").equals("Guardar")){
                
                ObjDtoFunci.setNumeroDocumento(Integer.parseInt(request.getParameter("numeroDocumento")));
                ObjDtoFunci.setIdCiudad(Integer.parseInt(request.getParameter("ciudadDocumento")));
                ObjDtoFunci.setIdGrados(Integer.parseInt(request.getParameter("grado")));
                ObjDtoFunci.setApellido1(request.getParameter("apellido1"));
                ObjDtoFunci.setApellido2(request.getParameter("apellido2"));
                ObjDtoFunci.setNombre1(request.getParameter("nombre1"));
                ObjDtoFunci.setNombre2(request.getParameter("nombre2"));
                ObjDtoFunci.setFechaNacimiento(request.getParameter("campoFechaNacimiento"));
                ObjDtoFunci.setIdRh(Integer.parseInt(request.getParameter("idRh")));
                ObjDtoFunci.setTelefono(request.getParameter("telefono"));
                ObjDtoFunci.setMovil(request.getParameter("movil"));
                ObjDtoFunci.setIndicativo(request.getParameter("indicativo"));
                ObjDtoFunci.setLicenciaConduccion(request.getParameter("licenciaConduccion"));
                ObjDtoFunci.setVencimientoLicencia(request.getParameter("vencimientoCategoria"));
                ObjDtoFunci.setIdCategoria(Integer.parseInt(request.getParameter("categoria")));
                ObjDtoFunci.setFechaAlta(request.getParameter("fechaAlta"));
                ObjDtoFunci.setEmail(request.getParameter("email"));
                ObjDtoFunci.setfotoFuncionario(request.getParameter("fotoFuncionario"));
                //ObjDtoFunci.setFotoFuncionario(request.getParameter("fotoFuncionario"));
                 //ObjDtoFunci.serequest.getParameter("direccionResidencia");
                //ObjDtoFunci.setIdCiudad(Integer.parseInt(request.getParameter("ciudadResidencia")));
                
                funci = ObjDaoFunci.IngresarFuncionario(ObjDtoFunci);
                
            }else if (request.getParameter("enviar").equals("Consultar")) {
                //ObjDtoFunci.setNumeroDocumento(Integer.parseInt(request.getParameter("numeroDocumento")));
              
                
                
                
                
               // funci  = ObjDaoFunci.IngresarFuncionario(ObjDtoFunci);
              
                //response.sendRedirect("/ProyectoSimva/spanish/asignacion/listadoFuncionarios.jsp?funci="+funci);
            }
            /*else if (request.getParameter("enviar").equals("Eliminar"))
            {
                int Pos = Integer.parseInt(request.getParameter("pos"));
                Funci = ObjDaoFunci.Eliminar(Pos);
            }
            */
               response.sendRedirect("/ProyectoSimva/spanish/asignacion/formFuncionario.jsp?funci="+funci);
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
