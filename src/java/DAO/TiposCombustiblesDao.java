/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.TiposCombustiblesDto;
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
public class TiposCombustiblesDao {
    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    public String IngresarTiposCombustibles(TiposCombustiblesDto inCom) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("INSERT INTO tiposcombustibles VALUES(?,?);");
            stmt.setInt(1, inCom.getIdTiposCombustibles());
            stmt.setString(2, inCom.getDescripcionTipoCombustible());
            int resultado = stmt.executeUpdate();
            if (resultado == 0) {
                //resul=false;
                rta = "Fallo el ingreso del registro Tipo Combustible";
            } else {
                rta = "Registro Tipo Combustible ingresado exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }
    
    public String EliminarTiposCombustibles(int Valor) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("DELETE FROM tiposcombustibles  WHERE idTiposCombustibles=?");
            stmt.setInt(1, Valor);

            int resultado = stmt.executeUpdate();
            if (resultado == 0) {
                //resul=false;
                rta = "Fallo al eliminar el Tipo de Combustible";
            } else {
                rta = "Registro Tipo de Combustible eliminado Exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }

    public ArrayList<TiposCombustiblesDto> ConsultarTiposCombustiblesTodos() {
        ArrayList<TiposCombustiblesDto> listadoTiposCombustibles = new ArrayList<TiposCombustiblesDto>();
        try {
            stmt = con.prepareStatement("SELECT * FROM tiposcombustibles");
            rs = stmt.executeQuery();
            while (rs.next()) {
                TiposCombustiblesDto unTipoCombustiblenew = new TiposCombustiblesDto();
                unTipoCombustiblenew.setIdTiposCombustibles(rs.getInt("idTiposCombustibles"));
                unTipoCombustiblenew.setDescripcionTipoCombustible(rs.getString("descripcionTipoCombustible"));
                listadoTiposCombustibles.add(unTipoCombustiblenew);
            }
        } catch (SQLException sqle) {
        }
        return listadoTiposCombustibles;
    }

    public String ActualizarTiposCombustibles(TiposCombustiblesDto actuCom) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("UPDATE tiposcombustibles SET idTiposCombustibles=?, descripcionTipoCombustible=?, WHERE idTiposCombustibles=?;");

            stmt.setInt(1, actuCom.getIdTiposCombustibles());
            stmt.setString(2, actuCom.getDescripcionTipoCombustible());

            int resultado = stmt.executeUpdate();
            if (resultado == 0) {

                rta = "Fallo al actualizar el tipo de combustible";
            } else {
                rta = "Registro tipo de combustible actualizado Exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }
    
}
    

