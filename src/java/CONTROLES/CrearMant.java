/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLES;

import DAO.Asignaciones1Dao;
import DAO.CreaFichaMant1Dao;
import DAO.Funcionarios1Dao;
import DAO.Grados1Dao;
import DAO.Mantenimiento1DAO;
import DAO.TiposVehiculos1Dao;
import DAO.Vehiculo1Dao;
import DTO.AsignacionesDto;
import DTO.FuncionariosDto;
import DTO.GradosDto;
import DTO.MantenimientosDto;
import DTO.TiposVehiculoDto;
import DTO.VehiculosDto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author andres
 */
public class CrearMant extends HttpServlet {

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
            MantenimientosDto mantenimientoDTO = new MantenimientosDto();
            CreaFichaMant1Dao ObjDaoM = new CreaFichaMant1Dao();
            VehiculosDto vehiculoDTO = new VehiculosDto();
            GradosDto gradosDTO = new GradosDto();

            String placa = request.getParameter("placa");
            Logger.getAnonymousLogger().log(Level.INFO, "Encontro la placa:" + placa);

            //Para mostrar el input y botón de consulta de placa 
            boolean consulto = false;

            if (placa != null) {

                vehiculoDTO = buscarVehiculo(placa);

                if (vehiculoDTO != null) {
                    consulto = true;

                    AsignacionesDto asignacionDTO = buscarAsignacion(placa);

                    request.getSession().setAttribute("placa", placa);

                    //Variable que ejecuta el metodo obtenerUltimoMantenimiento para sumarle uno y mostrarlo en pantalla
                    int idMantenimiento = obtenerUltimoMantenimiento() + 1;
                    request.getSession().setAttribute("idMantenimiento", idMantenimiento);

                    //Va realizar la consulra del funcionario por el numero de documento obtenido en la busqueda de asignacion realizado por numero de placa
                    System.out.print("Numero de documento : " + asignacionDTO.getNumeroDocumento());
                    FuncionariosDto funcionarioDTO = buscarFuncionario(asignacionDTO.getNumeroDocumento());

                    //Imprime el numero de documento que se obtiene en la consulta realizada, con el metodo buscarFuncionario
                    System.out.print("Numero de funcionario : " + funcionarioDTO.getNumeroDocumento());
                    mantenimientoDTO.setCcMantenimiento(funcionarioDTO.getNumeroDocumento());
                    request.getSession().setAttribute("documento", asignacionDTO.getNumeroDocumento());

                    //Concatena la informacion de l funcionario
                    String nombreCompleto = funcionarioDTO.getNombre1() + " " + funcionarioDTO.getNombre2()
                            + " " + funcionarioDTO.getApellido1() + " " + funcionarioDTO.getApellido2();
                    request.getSession().setAttribute("apellido1", nombreCompleto);

                    TiposVehiculoDto tipoVehiculo = consultarTipoVehiculo(vehiculoDTO.getIdTiposVehiculo());
                    System.out.print("Tipo : " + tipoVehiculo.getDescripcionTipoVehiculo());
                    request.getSession().setAttribute("tipoVehiculo", tipoVehiculo.getDescripcionTipoVehiculo());

                    GradosDto tipoGrado = consultarGradosFuncionario(funcionarioDTO.getIdGrados());
                    System.out.print("Grado : " + tipoGrado.getDescripcionGrado());
                    request.getSession().setAttribute("tipoGrado", tipoGrado.getDescripcionGrado());

                    request.getSession().setAttribute("mensaje", null);

                } else {
                    request.getSession().setAttribute("tipoGrado", null);
                    request.getSession().setAttribute("tipoVehiculo", null);
                    request.getSession().setAttribute("mensaje", "No se encontró la placa: " + placa);
                    request.getSession().setAttribute("documento", null);
                    request.getSession().setAttribute("placa", null);
                    request.getSession().setAttribute("idMantenimiento", null);
                    request.getSession().setAttribute("apellido1", null);
                }

            }

            request.getSession().setAttribute("consulto", consulto);
            response.sendRedirect("/ProyectoSimva/spanish/mantenimiento/crearMant.jsp");

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

    //metodo reliazado por mi pero no me funciona
    public FuncionariosDto buscarFuncionarios(String apellido1, String apellido2, String nombre1, String nombre2) {
        Funcionarios1Dao dao = new Funcionarios1Dao();
        return dao.consultar(apellido1, apellido2, nombre1, nombre2);
    }

    public VehiculosDto buscarVehiculo(String placa) {
        Vehiculo1Dao dao = new Vehiculo1Dao();
        return dao.consultar(placa);
    }

    private AsignacionesDto buscarAsignacion(String placa) {
        Asignaciones1Dao dao = new Asignaciones1Dao();
        return dao.consultar(placa);
    }

    private FuncionariosDto buscarFuncionario(int numeroDocumento) {
        Funcionarios1Dao funcionario = new Funcionarios1Dao();
        return funcionario.consultarPorDocumento(numeroDocumento);
    }

    private int obtenerUltimoMantenimiento() {
        Mantenimiento1DAO mantenimientoDAO = new Mantenimiento1DAO();
        return mantenimientoDAO.obtenerUltimoMantenimiento();
    }

    private TiposVehiculoDto consultarTipoVehiculo(Integer idTipoVehiculo) {
        TiposVehiculos1Dao Tipos = new TiposVehiculos1Dao();
        return Tipos.consultar(idTipoVehiculo);
    }

    private GradosDto consultarGradosFuncionario(Integer idGrados) {
        Grados1Dao Grados = new Grados1Dao();
        return Grados.consultarGrados(idGrados);

    }

}
