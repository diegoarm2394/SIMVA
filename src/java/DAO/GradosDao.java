/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.GradosDto;
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
public class GradosDao {

    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;

    public String IngresarGrado(GradosDto inGra) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("INSERT INTO grados VALUES(?,?);");
            stmt.setInt(1, inGra.getIdGrados());
            stmt.setString(2, inGra.getDescripcionGrado());
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
    
    public String EliminarGrado(int Valor) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("DELETE FROM grados  WHERE idGrados=?");
            stmt.setInt(1, Valor);

            int resultado = stmt.executeUpdate();
            if (resultado == 0) {
                //resul=false;
                rta = "Fallo al eliminar el Grado";
            } else {
                rta = "Registro eliminado Exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }

    public ArrayList<GradosDto> ConsultarGradosTodos() {
        ArrayList<GradosDto> listadoGrados = new ArrayList<GradosDto>();
        try {
            stmt = con.prepareStatement("SELECT * FROM grados ");
            rs = stmt.executeQuery();
            while (rs.next()) {
                GradosDto unGradonew = new GradosDto();
                unGradonew.setIdGrados(rs.getInt("idGrados"));
                unGradonew.setDescripcionGrado(rs.getString("descripcionGrado"));
                listadoGrados.add(unGradonew);
            }
        } catch (SQLException sqle) {
        }
        return listadoGrados;
    }
    public String ActualizarGrados(GradosDto actuGra) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("UPDATE grados SET idGrados=?, descripcionGrado=?, WHERE idGrados=?;");

            stmt.setInt(1, actuGra.getIdGrados());
            stmt.setString(2, actuGra.getDescripcionGrado());

            int resultado = stmt.executeUpdate();
            if (resultado == 0) {

                rta = "Fallo al actualizar el Grado";
            } else {
                rta = "Registro actualizado Exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }

}
