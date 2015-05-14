/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.GradosDto;
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
public class Grados1Dao {
    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;

    public String crearGrados(GradosDto grados) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("INSERT INTO Grados VALUES(?);");
            stmt.setString(1, grados.getDescripcionGrado());
                       
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

    public String eliminarGrados(String descripcionGrado) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("DELETE FROM TiposVehiculo  WHERE descripcionGrado = ?");
            stmt.setString(1, descripcionGrado);

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

    public ArrayList<GradosDto> consultarTodosGrados() {

        ArrayList<GradosDto> listado = new ArrayList<GradosDto>();

        try {
            stmt = con.prepareStatement("select * from Grados ");
            rs = stmt.executeQuery();

            while (rs.next()) {
                
                GradosDto Grados = new GradosDto();
                
                Grados.setDescripcionGrado(rs.getString("tipo"));
                                
                listado.add(Grados);
            }

        } catch (SQLException sqle) {
            Logger.getAnonymousLogger().log(Level.SEVERE, sqle.getMessage(), sqle);
        }
        return listado;
    }

    public GradosDto consultarGrados (Integer idGrados) {
        
        
        GradosDto tipoGrados = new GradosDto();

        try {
            stmt = con.prepareStatement("select * from Grados where idGrados=?;");
            stmt.setInt(1, idGrados);
            rs = stmt.executeQuery();

            while (rs.next()) {
                tipoGrados.setDescripcionGrado(rs.getString("descripcionGrado"));
            }

        } catch (SQLException sqle) {
            sqle.printStackTrace();

        }
        return tipoGrados;
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
