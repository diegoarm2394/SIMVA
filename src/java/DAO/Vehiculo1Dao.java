/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.VehiculosDto;
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
 * @author Diego
 */
public class Vehiculo1Dao {

    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;

    public String crearVehiculo(VehiculosDto vehiculo) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("INSERT INTO vehiculo VALUES(?, ?);");
            stmt.setString(1, vehiculo.getPlaca());
            stmt.setInt(2, vehiculo.getIdTiposVehiculo());
                       
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

    public String eliminarVehiculo(String placa) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("DELETE FROM vehiculos  WHERE placa = ?");
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

    public ArrayList<VehiculosDto> consultarTodos() {

        ArrayList<VehiculosDto> listado = new ArrayList<VehiculosDto>();

        try {
            stmt = con.prepareStatement("SELECT * FROM vehiculos ");
            rs = stmt.executeQuery();

            while (rs.next()) {
                
                VehiculosDto vehiculo = new VehiculosDto();
                
                vehiculo.setPlaca(rs.getString("placa"));
                vehiculo.setIdTiposVehiculo(rs.getInt("idTiposVehiculo"));
                
                listado.add(vehiculo);
            }

        } catch (SQLException sqle) {

        }
        return listado;
    }

    public VehiculosDto consultar(String placa) {

        

        try {
            stmt = con.prepareStatement("SELECT * FROM vehiculos where placa = ? ");
            stmt.setString(1, placa);
            rs = stmt.executeQuery();

            while (rs.next()) {
                VehiculosDto vehiculo = new VehiculosDto();
                vehiculo.setIdTiposVehiculo(rs.getInt("idTiposVehiculo"));
                vehiculo.setPlaca(rs.getString("placa"));
                return vehiculo;
            }

        } catch (SQLException sqle) {
            Logger.getAnonymousLogger().log(Level.SEVERE, sqle.getMessage(), sqle);
        }
        return null;
    }

    public String actualizar(VehiculosDto vehiculo) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("UPDATE vehiculo SET placa=?;");

             stmt.setString(1, vehiculo.getPlaca());
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
