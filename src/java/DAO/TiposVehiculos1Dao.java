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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author andres
 */
public class TiposVehiculos1Dao {

    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;

    public String crearTipoVehiculo(TiposVehiculoDto TipoVehiculo) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("INSERT INTO TiposVehiculo VALUES(?);");
            stmt.setString(1, TipoVehiculo.getDescripcionTipoVehiculo());
                       
            int resultado = stmt.executeUpdate();
            if (resultado == 0) {
                //resul=false;
                rta = "Fallo el ingreso del registro";
            } else {
                rta = "Registro ingresado exitosamente";
            }
        } catch (SQLException ex) {
            rta = ex.getMessage();
            Logger.getAnonymousLogger().log(Level.SEVERE, ex.getMessage(), ex);
        }
        return rta;
    }

    public String eliminarTiposVehiculo(String descripcionTipoVehiculo) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("DELETE FROM TiposVehiculo  WHERE descripcionTipoVehiculo = ?");
            stmt.setString(1, descripcionTipoVehiculo);

            int resultado = stmt.executeUpdate();
            if (resultado == 0) {
                //resul=false;
                rta = "Fallo al eliminar";
            } else {
                rta = "Registro eliminado Exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
            Logger.getAnonymousLogger().log(Level.SEVERE, sqle.getMessage(), sqle);
        }
        return rta;
    }

    public ArrayList<TiposVehiculoDto> consultarTodos() {

        ArrayList<TiposVehiculoDto> listado = new ArrayList<TiposVehiculoDto>();

        try {
            stmt = con.prepareStatement("select * from tiposvehiculo ");
            rs = stmt.executeQuery();

            while (rs.next()) {
                
                TiposVehiculoDto tiposVehiculo = new TiposVehiculoDto();
                
                tiposVehiculo.setIdTiposVehiculo(rs.getInt("idTiposVehiculo"));
                tiposVehiculo.setDescripcionTipoVehiculo(rs.getString("descripcionTipoVehiculo"));
                                
                listado.add(tiposVehiculo);
            }

        } catch (SQLException sqle) {
            Logger.getAnonymousLogger().log(Level.SEVERE, sqle.getMessage(), sqle);
        }
        return listado;
    }

    public TiposVehiculoDto consultar(Integer idTipoVehiculo) {

        TiposVehiculoDto tipoVehiculo = new TiposVehiculoDto();

        try {
            stmt = con.prepareStatement("select * from TiposVehiculo where idTiposVehiculo = ?;");
            stmt.setInt(1, idTipoVehiculo);
            rs = stmt.executeQuery();

            while (rs.next()) {
                tipoVehiculo.setDescripcionTipoVehiculo(rs.getString("descripcionTipoVehiculo"));
            }

        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
        return tipoVehiculo;
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
