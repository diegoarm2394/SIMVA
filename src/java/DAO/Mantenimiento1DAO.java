/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.MantenimientosDto;
import Modelo.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author andres
 */
public class Mantenimiento1DAO {

    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;

    public String crearMantenimiento(MantenimientosDto mantenimiento) {
        String rta = "";
        try {
            stmt = con.prepareStatement("INSERT INTO Mantenimientos VALUES(?, ?, ?, ?, ?, ?, ?, ?,?);");
            
            stmt.setInt(1, mantenimiento.getIdMantenimientos());
            stmt.setString(2, mantenimiento.getPlaca());
            stmt.setInt(3, mantenimiento.getIdTipoMantenimiento());
            stmt.setString(4, mantenimiento.getFechaIngresoMantenimiento());
            stmt.setString(5, mantenimiento.getFechaSalidaMantenimiento());
            stmt.setString(6, mantenimiento.getFechaProximoMantenimiento());
            stmt.setString(7, mantenimiento.getObservaciones());
            stmt.setInt(8, mantenimiento.getCcMantenimiento());
            stmt.setInt(9, mantenimiento.getIdTipoMantenimiento());
            
            
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

    public int obtenerUltimoMantenimiento() {

        int ultimoValor = 0;

        try {

            stmt = con.prepareStatement("select max(idMantenimientos) as ultimo from Mantenimientos;	");
            rs = stmt.executeQuery();

            while (rs.next()) {
                ultimoValor = rs.getInt("ultimo");
            }
            System.out.printf("Valor obtenido de la columna id Mantenimiento : " + ultimoValor);

        } catch (SQLException sqle) {

            sqle.printStackTrace();

        }

        return ultimoValor;
    }

}
