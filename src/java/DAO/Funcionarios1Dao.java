/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.AsignacionesDto;
import DTO.FuncionariosDto;
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
public class Funcionarios1Dao {
    
    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;

    public String crearFuncionarios(FuncionariosDto funcionarios) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("INSERT INTO Funcionarios VALUES(?,?,?,?);");
            stmt.setString(1, funcionarios.getApellido1());
            stmt.setString(2, funcionarios.getApellido2());
            stmt.setString(3, funcionarios.getNombre1());
            stmt.setString(4, funcionarios.getNombre2());
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

    public String eliminarFuncionarios(String apellido1, String apellido2, String nombre1, String nombre2) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("DELETE FROM Funcionarios  WHERE apellido1, apellido2, nombre1, nombre2 = ?");
            stmt.setString(1, apellido1);
            stmt.setString(2, apellido2);
            stmt.setString(3, nombre1);
            stmt.setString(4, nombre2);

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

    public ArrayList<FuncionariosDto> consultarTodos() {

        ArrayList<FuncionariosDto> listado = new ArrayList<FuncionariosDto>();

        try {
            stmt = con.prepareStatement("SELECT * FROM Funcionarios ");
            rs = stmt.executeQuery();

            while (rs.next()) {
                
                FuncionariosDto Funcionarios = new FuncionariosDto();                
                Funcionarios.setApellido1(rs.getString("persona"));
                Funcionarios.setApellido2(rs.getString("persona"));
                Funcionarios.setNombre1(rs.getString("persona"));
                Funcionarios.setNombre2(rs.getString("persona"));
      
                listado.add(Funcionarios);
            }

        } catch (SQLException sqle) {

        }
        return listado;
    }

    public FuncionariosDto consultar(String apellido1, String apellido2, String nombre1, String nombre2) {

        FuncionariosDto Funcionarios = new FuncionariosDto();

        try {
            stmt = con.prepareStatement("SELECT * FROM Funcionarios where apellido1, apellido2, nombre1, nombre2 = ? ");
            stmt.setString(1, apellido1);
            stmt.setString(1, apellido2);
            stmt.setString(1, nombre1);
            stmt.setString(1, nombre2);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Funcionarios.setApellido1(apellido1);rs.getString("apellido1");
                Funcionarios.setApellido2(apellido2);rs.getString("apellido2");
                Funcionarios.setNombre1(nombre1);rs.getString("nombre1");
                Funcionarios.setNombre2(nombre2);rs.getString("nombre2");
            }

        } catch (SQLException sqle) {
            Logger.getAnonymousLogger().log(Level.SEVERE, sqle.getMessage(), sqle);
        }
        return Funcionarios;
    }

    public String actualizar(FuncionariosDto Funcionarios) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("UPDATE descripcionTipoVhiculo SET Tipo=?, adf;");

             stmt.setString(1, Funcionarios.getApellido1());
             stmt.setString(2, Funcionarios.getApellido2());
             stmt.setString(3, Funcionarios.getNombre1());
             stmt.setString(4, Funcionarios.getNombre2());
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

    
    public FuncionariosDto consultarPorDocumento(int documento){
        FuncionariosDto funcionario = new FuncionariosDto();
        
        
        try {
            stmt = con.prepareStatement("select * from funcionarios where numeroDocumento =?");
            stmt.setInt(1, documento);
            rs = stmt.executeQuery();
            System.out.printf("Inicializo consulta de funcionario con el documento :" + documento);
            
            while (rs.next()) {
                funcionario.setApellido1(rs.getString("apellido1"));
                funcionario.setApellido2(rs.getString("apellido2"));
                funcionario.setNombre1(rs.getString("nombre1"));
                funcionario.setNombre2(rs.getString("nombre2"));
                funcionario.setEmail(rs.getString("eMail"));
                funcionario.setNumeroDocumento(rs.getInt("numeroDocumento"));
                funcionario.setIdGrados(rs.getInt("idGrados"));
            }

        } catch (SQLException sqle) {
            Logger.getAnonymousLogger().log(Level.SEVERE, sqle.getMessage(), sqle);
        }
        return funcionario;
    }
    
    
    
}
