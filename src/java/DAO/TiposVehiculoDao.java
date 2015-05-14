/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.TiposVehiculoDto;
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
public class TiposVehiculoDao {
    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    public String IngresarTipoVehiculo(TiposVehiculoDto inTiVe) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("INSERT INTO tiposvehiculo VALUES(?,?);");
            stmt.setInt(1, inTiVe.getIdTiposVehiculo());
            stmt.setString(2, inTiVe.getDescripcionTipoVehiculo());
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
    
    public String EliminarTipoVehiculo(int Valor) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("DELETE FROM tiposvehiculo  WHERE idTiposVehiculo=?");
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

    public ArrayList<TiposVehiculoDto> ConsultarTiposVehiculoTodos() {
        ArrayList<TiposVehiculoDto> listadoTiposVehiculo = new ArrayList<TiposVehiculoDto>();
        try {
            stmt = con.prepareStatement("SELECT * FROM tiposvehiculo ");
            rs = stmt.executeQuery();
            while (rs.next()) {
                TiposVehiculoDto unTipoVehiculonew = new TiposVehiculoDto();
                unTipoVehiculonew.setIdTiposVehiculo(rs.getInt("idTiposVehiculo"));
                unTipoVehiculonew.setDescripcionTipoVehiculo(rs.getString("descripcionTipoVehiculo"));
                listadoTiposVehiculo.add(unTipoVehiculonew);
            }
        } catch (SQLException sqle) {
        }
        return listadoTiposVehiculo;
    }

    public String ActualizarTipoVehiculo(TiposVehiculoDto actuTiVe) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("UPDATE tiposvehiculo SET idTiposVehiculo=?, descripcionTipoVehiculo=?, WHERE idTiposVehiculo=?;");

            stmt.setInt(1, actuTiVe.getIdTiposVehiculo());
            stmt.setString(2, actuTiVe.getDescripcionTipoVehiculo());

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
