/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.AsignacionesDto;
import DTO.TiposVehiculoDto;
import Modelo.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author andres
 */
public class Asignaciones1Dao {
    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;

    public String crearAsignacion(AsignacionesDto asignacion) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("INSERT INTO Asignacion VALUES(?);");
            stmt.setString(1, asignacion.getFechaAsignacion());
                       
            int resultado = stmt.executeUpdate();
            if (resultado == 0) {
                //resul=false;
                rta = "Fallo el ingreso del registro";
            } else {
                rta = "Registro ingresado exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }

    public String eliminarAsignacion(String placa) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("DELETE FROM asignaciones  WHERE placa = ?");
            stmt.setString(1, placa);

            int resultado = stmt.executeUpdate();
            if (resultado == 0) {
                //resul=false;
                rta = "Fallo al eliminar";
            } else {
                rta = "Registro eliminado Exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }

    public ArrayList<AsignacionesDto> consultarTodos() {

        ArrayList<AsignacionesDto> listado = new ArrayList<AsignacionesDto>();

        try {
            stmt = con.prepareStatement("SELECT * FROM asignaciones ");
            rs = stmt.executeQuery();

            while (rs.next()) {
                
                AsignacionesDto asignacion = new AsignacionesDto();                
                asignacion.setFechaAsignacion(rs.getString("fecha_asignacion"));
      
                listado.add(asignacion);
            }

        } catch (SQLException sqle) {

        }
        return listado;
    }

    public AsignacionesDto consultar(String placa) {

        AsignacionesDto asignacion = new AsignacionesDto();

        try {
            stmt = con.prepareStatement("SELECT * FROM asignaciones where placa = ? ");
            stmt.setString(1, placa);
            rs = stmt.executeQuery();

            while (rs.next()) {
                asignacion.setNumeroDocumento(rs.getInt("numeroDocumento"));
            }

        } catch (SQLException sqle) {
            Logger.getAnonymousLogger().log(Level.SEVERE, sqle.getMessage(), sqle);
        }
        return asignacion;
    }

    public String actualizar(TiposVehiculoDto tiposVehiculo) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("UPDATE descripcionTipoVhiculo SET Tipo=?;");

             stmt.setString(1, tiposVehiculo.getDescripcionTipoVehiculo());
             //completar

            int resultado = stmt.executeUpdate();
            if (resultado == 0) {

                rta = "Fallo al actualizar";
            } else {
                rta = "Registro actualizado Exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }
    
}
