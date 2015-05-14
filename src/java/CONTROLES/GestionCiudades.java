/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLES;

import DAO.CiudadesDao;
import DTO.CiudadesDto;
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
@WebServlet(name = "GestionCiudades", urlPatterns = {"/GestionCiudades"})
public class GestionCiudades extends HttpServlet {

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
            CiudadesDto ObjDtoC = new CiudadesDto();
            CiudadesDao ObjDaoC = new CiudadesDao();
            //ArrayList<CiudadesDto> listado=new ArrayList<CiudadesDto>();

            if (request.getParameter("boton").equals("enviar")) {
                ObjDtoC.setIdCiudad(Integer.parseInt(request.getParameter("idCiudad")));
                ObjDtoC.setNombreCiudad(request.getParameter("nombreCiudad"));

                Estado = ObjDaoC.IngresarCiudad(ObjDtoC);

                //HttpSession miSession = request.getSession(true);
                //miSession.setAttribute("IdCiudad", out);
                //request.getRequestDispatcher("Ciudades.jsp").forward(request, response);
                //response.sendRedirect("/spanish/administrador/Ciudades.jsp");
                //RequestDispatcher RD = request.getRequestDispatcher("/spanish/administrador/Ciudades.jsp");
                //RD.forward(request, response);
            } else if (request.getParameter("boton").equals("consultar")) {

            //String Listado = ObjDaoC.ConsultarTodos(1);
                //out.print(Listado);
            } else if (request.getParameter("boton").equals("Eliminar")) {
                int Pos = Integer.parseInt(request.getParameter("pos"));
                Estado = ObjDaoC.EliminarCiudad(Pos);

//            request.getRequestDispatcher("Ciudades.jsp").forward(request, response);
                //RequestDispatcher RD = request.getRequestDispatcher("/spanish/administrador/Ciudades.jsp");
                //RD.forward(request, response);
            } else if (request.getParameter("boton").equals("Actualizar")) {
            // int Pos = Integer.parseInt(request.getParameter("pos"));
                // Estado = ObjDaoC.Actualizar(ObjDtoC);            
                // response.sendRedirect("/ProyectoSimva/spanish/administrador/Ciudades.jsp");

            }
            response.sendRedirect("/ProyectoSimva/spanish/asignacion/Ciudades.jsp?Estado=" + Estado);
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
