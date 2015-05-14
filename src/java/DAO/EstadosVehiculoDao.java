/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.EstadosVehiculoDto;
import Modelo.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Jairo
 */
public class EstadosVehiculoDao {

    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;

    public String IngresarEstadosVehiculo(EstadosVehiculoDto ingEst) {
        //boolean result = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("INSERT INTO estadosVehiculo VALUES(?,?);");
            stmt.setInt(1, ingEst.getIdEstadosVehiculo());
            stmt.setString(2, ingEst.getDescripcionEstadoVehiculo());
            int resultado = stmt.executeUpdate();
            if (resultado == 0) {
                //result=false;
                rta = "Fallo el ingreso del registro Estados vehículo";
            } else {
                rta = "Registro Estados Vehículo ingresado exitosamente";
          }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
return rta;
}

         public String EliminarEstadosVehiculo(int Valor) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("DELETE FROM estadosVehiculo  WHERE idEstadosVehiculo=?");
            stmt.setInt(1, Valor);

            int resultado = stmt.executeUpdate();
            if (resultado == 0) {
                //resul=false;
                rta = "Fallo al eliminar el Estado del Vehículo";
            } else {
                rta = "Registro Estado del Vehiculo eliminado Exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }

    public ArrayList<EstadosVehiculoDto> ConsultarEstadosVehiculoTodos() {
        ArrayList<EstadosVehiculoDto> listadoEstadosVehiculo = new ArrayList<EstadosVehiculoDto>();
        try {
            stmt = con.prepareStatement("SELECT * FROM estadosVehiculo");
            rs = stmt.executeQuery();
            while (rs.next()) {
                EstadosVehiculoDto unEstadoVehiculonew = new EstadosVehiculoDto();
                unEstadoVehiculonew.setIdEstadosVehiculo(rs.getInt("idEstadosVehiculo"));
                unEstadoVehiculonew.setDescripcionEstadoVehiculo(rs.getString("descripcionEstadoVehiculo"));
                listadoEstadosVehiculo.add(unEstadoVehiculonew);
            }
        } catch (SQLException sqle) {
        }
        return listadoEstadosVehiculo;
    }

    public String ActualizarEstadosVehiculo(EstadosVehiculoDto actuEst) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("UPDATE estadosVehiculo SET idEstadosVehiculo=?, descripcionEstadoVehiculo=?, WHERE idEstadosVehiculo=?;");

            stmt.setInt(1, actuEst.getIdEstadosVehiculo());
            stmt.setString(2, actuEst.getDescripcionEstadoVehiculo());

            int resultado = stmt.executeUpdate();
            if (resultado == 0) {

                rta = "Fallo al actualizar el Estado del Vehículo";
            } else {
                rta = "Registro Estado del Vehículo actualizado Exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }

}
