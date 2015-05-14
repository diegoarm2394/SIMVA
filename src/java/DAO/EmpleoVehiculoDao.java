/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.EmpleoVehiculoDto;
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
public class EmpleoVehiculoDao {

    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;

    public String IngresarEmpleoVehiculo(EmpleoVehiculoDto ingEmp) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("INSERT INTO empleovehiculo VALUES(?,?);");
            stmt.setInt(1, ingEmp.getIdEmpleoVehiculo());
            stmt.setString(2, ingEmp.getDescripcionEmpleVehiculo());
            int resultado = stmt.executeUpdate();
            if (resultado == 0) {
                //resul=false;
                rta = "Fallo el ingreso del registro Empleo Vehículo";
            } else {
                rta = "Registro Empleo Vehiculo ingresado exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }

    public String EliminarEmpleoVehiculo(int Valor) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("DELETE FROM empleoVehiculo  WHERE idEmpleoVehiculo=?");
            stmt.setInt(1, Valor);

            int resultado = stmt.executeUpdate();
            if (resultado == 0) {
                //resul=false;
                rta = "Fallo al eliminar el Empleo del Vehículo";
            } else {
                rta = "Registro Empleo del Vehiculo eliminado Exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }

    public ArrayList<EmpleoVehiculoDto> ConsultarEmpleoVehiculoTodos() {
        ArrayList<EmpleoVehiculoDto> listadoEmpleoVehiculo = new ArrayList<EmpleoVehiculoDto>();
        try {
            stmt = con.prepareStatement("SELECT * FROM empleoVehiculo");
            rs = stmt.executeQuery();
            while (rs.next()) {
                EmpleoVehiculoDto unEmpleoVehiculonew = new EmpleoVehiculoDto();
                unEmpleoVehiculonew.setIdEmpleoVehiculo(rs.getInt("idEmpleoVehiculo"));
                unEmpleoVehiculonew.setDescripcionEmpleVehiculo(rs.getString("descripcionEmpleoVehiculo"));
                listadoEmpleoVehiculo.add(unEmpleoVehiculonew);
            }
        } catch (SQLException sqle) {
        }
        return listadoEmpleoVehiculo;
    }

    public String ActualizarEmpleoVehiculo(EmpleoVehiculoDto actuEmp) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("UPDATE empleoVehiculo SET idEmpleoVehiculo=?, descripcionEmpleoVehiculo=?, WHERE idEmpleoVehiculo=?;");

            stmt.setInt(1, actuEmp.getIdEmpleoVehiculo());
            stmt.setString(2, actuEmp.getDescripcionEmpleVehiculo());

            int resultado = stmt.executeUpdate();
            if (resultado == 0) {

                rta = "Fallo al actualizar el Empleo del Vehículo";
            } else {
                rta = "Registro Empleo del Vehículo actualizado Exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }

}
