/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.AsignacionesDto;
import Modelo.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Jairo
 */
public class AsignacionesDao {
 Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
     public String IngresarAsignacion(AsignacionesDto ingAsig) {
        String rta = "";
        try {
            stmt = con.prepareStatement("INSERT INTO  asignaciones (idAsignaciones, numeroDocumento, "
                    + "placa, fechaAsignacion, fechaDesasignacion, novedadesVehiculo) "
                    + "VALUES(?,?,?,?,?,?)");
            //+ "VALUES(?,?,?,?,null,?,null,null,?,?,?,null,null,null,null,?,null,null)");
            //("call spInsertarFuncionarioPrueba");
            stmt.setInt(1, ingAsig.getIdAsignaciones());
            stmt.setInt(2, ingAsig.getNumeroDocumento());
            stmt.setString(3, ingAsig.getPlaca());
            stmt.setString(4, ingAsig.getFechaAsignacion());
            stmt.setString(5, ingAsig.getFechaDesacignacion());
            stmt.setString(6, ingAsig.getNovedadesVehiculos());
            

            int resultado = stmt.executeUpdate();
            if (resultado == 0) {
                rta = "Fallo el ingreso de la asignacion";
                System.out.println("Fallo el ingreso de la asignacion");
            } else {
                rta = "Asignacion  insertada exitosamente";
                System.out.println("Asignacion  insertada exitosamente");
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;

    }
}
