/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.ColorVehiculoDto;
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
public class ColorVehiculoDao {
    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    public String IngresarColorVehiculo(ColorVehiculoDto inCol) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("INSERT INTO colorvehiculo VALUES(?,?);");
            stmt.setInt(1, inCol.getIdColorVehiculo());
            stmt.setString(2, inCol.getDescripcionColorVehiculo());
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
    
    public String EliminarColorVehiculo(int Valor) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("DELETE FROM colorvehiculo  WHERE IdColorVehiculo=?");
            stmt.setInt(1, Valor);

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

    public ArrayList<ColorVehiculoDto> ConsultarColorVehiculosTodos() {
        ArrayList<ColorVehiculoDto> listadoColorVehiculos = new ArrayList<ColorVehiculoDto>();
        try {
            stmt = con.prepareStatement("SELECT * FROM colorvehiculo ");
            rs = stmt.executeQuery();
            while (rs.next()) {
                ColorVehiculoDto unColornew = new ColorVehiculoDto();
                unColornew.setIdColorVehiculo(rs.getInt("idColorVehiculo"));
                unColornew.setDescripcionColorVehiculo(rs.getString("descripcionColorVehiculo"));
                listadoColorVehiculos.add(unColornew);
            }
        } catch (SQLException sqle) {
        }
        return listadoColorVehiculos;
    }

    public String ActualizarColorVehiculo(ColorVehiculoDto actuCol) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("UPDATE colorvehiculo SET idColorVehiculo=?, descripcionColorVehiculo=?, WHERE idColorVehiculo=?;");

            stmt.setInt(1, actuCol.getIdColorVehiculo());
            stmt.setString(2, actuCol.getDescripcionColorVehiculo());

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
    

