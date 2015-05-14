/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.RhDto;
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
public class RhDao {
    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    public String IngresarRh(RhDto inRh) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("INSERT INTO rh VALUES(?,?);");
            stmt.setInt(1, inRh.getIdRh());
            stmt.setString(2, inRh.getDescripcionRh());
            int resultado = stmt.executeUpdate();
            if (resultado == 0) {
                //resul=false;
                rta = "Fallo el ingreso del registro Rh";
            } else {
                rta = "Registro Rh ingresado exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }
    
    public String EliminarRh(int Valor) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("DELETE FROM rh  WHERE idRh=?");
            stmt.setInt(1, Valor);

            int resultado = stmt.executeUpdate();
            if (resultado == 0) {
                //resul=false;
                rta = "Fallo al eliminar el Rh";
            } else {
                rta = "Registro Rh eliminado Exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }

    public ArrayList<RhDto> ConsultarRhTodos() {
        ArrayList<RhDto> listadoRh = new ArrayList<RhDto>();
        try {
            stmt = con.prepareStatement("SELECT * FROM rh ");
            rs = stmt.executeQuery();
            while (rs.next()) {
                RhDto unRhnew = new RhDto();
                unRhnew.setIdRh(rs.getInt("idRh"));
                unRhnew.setDescripcionRh(rs.getString("descripcionRh"));
                listadoRh.add(unRhnew);
            }
        } catch (SQLException sqle) {
        }
        return listadoRh;
    }
    public String ActualizarRh(RhDto actuRh) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("UPDATE rh SET idRh=?, descripcionRh=?, WHERE idRh=?;");

            stmt.setInt(1, actuRh.getIdRh());
            stmt.setString(2, actuRh.getDescripcionRh());

            int resultado = stmt.executeUpdate();
            if (resultado == 0) {

                rta = "Fallo al actualizar el Rh";
            } else {
                rta = "Registro Rh actualizado Exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }

}
    

