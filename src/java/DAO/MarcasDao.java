/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.MarcasDto;
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
public class MarcasDao {
    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    public String IngresarMarca(MarcasDto inMar) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("INSERT INTO marcas VALUES(?,?);");
            stmt.setInt(1, inMar.getIdMarcas());
            stmt.setString(2, inMar.getDescripcionMarcaVehiculo());
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
    
    public String EliminarMarca(int Valor) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("DELETE FROM marcas  WHERE idMarcas=?");
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

    public ArrayList<MarcasDto> ConsultarMarcasTodas() {
        ArrayList<MarcasDto> listadoMarcas = new ArrayList<MarcasDto>();
        try {
            stmt = con.prepareStatement("SELECT * FROM marcas ");
            rs = stmt.executeQuery();
            while (rs.next()) {
                MarcasDto unaMarcanew = new MarcasDto();
                unaMarcanew.setIdMarcas(rs.getInt("idMarcas"));
                unaMarcanew.setDescripcionMarcaVehiculo(rs.getString("descripcionMarcaVehiculo"));
                listadoMarcas.add(unaMarcanew);
            }
        } catch (SQLException sqle) {
        }
        return listadoMarcas;
    }

    public String ActualizarTipoVehiculo(MarcasDto actuMar) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("UPDATE marcas SET idMarcas=?, descripcionMarcaVehiculo=?, WHERE idMarcas=?;");

            stmt.setInt(1, actuMar.getIdMarcas());
            stmt.setString(2, actuMar.getDescripcionMarcaVehiculo());

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
    

