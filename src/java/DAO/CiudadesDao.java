/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.CiudadesDto;
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
public class CiudadesDao {

    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;

    public String IngresarCiudad(CiudadesDto inciu) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("INSERT INTO ciudades VALUES(?,?);");
            stmt.setInt(1, inciu.getIdCiudad());
            stmt.setString(2, inciu.getNombreCiudad());
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

    public String EliminarCiudad(int Valor) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("DELETE FROM ciudades  WHERE idCiudad=?");
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

    public ArrayList<CiudadesDto> ConsultarCiudadesTodas() {
        ArrayList<CiudadesDto> listado = new ArrayList<CiudadesDto>();
        try {
            stmt = con.prepareStatement("SELECT * FROM ciudades ");
            rs = stmt.executeQuery();
            while (rs.next()) {
                CiudadesDto unaciudadnew = new CiudadesDto();
                unaciudadnew.setIdCiudad(rs.getInt("idCiudad"));
                unaciudadnew.setNombreCiudad(rs.getString("nombreCiudad"));
                listado.add(unaciudadnew);
            }
        } catch (SQLException sqle) {
        }
        return listado;
    }

    public String ActualizarCiudad(CiudadesDto actuCiu) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("UPDATE ciudades SET idCiudad=?, nombreCiudad=?, WHERE idCiudad=?;");

            stmt.setInt(1, actuCiu.getIdCiudad());
            stmt.setString(2, actuCiu.getNombreCiudad());

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
