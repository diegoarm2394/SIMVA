/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.VehiculosDto;
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
public class VehiculosDao {
    
    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;

    public String IngresarVehiculo(VehiculosDto ingVehi) {
        String rta = "";
        try {
            stmt = con.prepareStatement("INSERT INTO  vehiculos (placa, idTiposVehiculo, "
                    + "idMarcas, idTiposCombustibles, modelo, idEstadosVehiculo, fechaEstado, idColorVehiculo,"
                    + "idEmpleoVehiculo, sigla, vin, motor, cilindraje, licenciaTransito, "
                    + "seguroObligatorio, vencimientoSeguro, seguroResponsabilidad,"
                    + "vencimientoResponsabilidad, revisionTecnomecanica, vencimientoTecnomecanica, fotoVehiculo) "
                    + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            //+ "VALUES(?,?,?,?,null,?,null,null,?,?,?,null,null,null,null,?,null,null)");
            //("call spInsertarFuncionarioPrueba");
            stmt.setString(1, ingVehi.getPlaca());
            stmt.setInt(2, ingVehi.getIdTiposVehiculo());
            stmt.setInt(3, ingVehi.getIdMarcas());
            stmt.setInt(4, ingVehi.getIdTiposCombustibles());
            stmt.setInt(5, ingVehi.getModelo());
            stmt.setInt(6, ingVehi.getIdEstadosVehiculo());
            stmt.setString(7, ingVehi.getFechaEstado());
            stmt.setInt(8, ingVehi.getIdColorVehiculo());
            stmt.setInt(9, ingVehi.getIdEmpleoVehiculo());
            stmt.setString(10, ingVehi.getSigla());
            stmt.setString(11, ingVehi.getVin());
            stmt.setString(12, ingVehi.getMotor());
            stmt.setInt(13, ingVehi.getCilindraje());
            stmt.setInt(14, ingVehi.getLicenciaTransito());
            stmt.setInt(15, ingVehi.getSeguroObligatorio());
            stmt.setString(16, ingVehi.getVencimientoSeguro());
            stmt.setInt(17, ingVehi.getSeguroResponsabilidad());
            stmt.setString(18, ingVehi.getVencimientoResponsabilidad());
            stmt.setInt(19, ingVehi.getRevisionTecnomecanica());
            stmt.setString(20, ingVehi.getVencimientoTecnomecanica());
            stmt.setString(21, ingVehi.getFotoVehiculo());

            int resultado = stmt.executeUpdate();
            if (resultado == 0) {
                rta = "Fallo el ingreso del Vehículo";
                System.out.println("Fallo el ingreso del Vehículo");
            } else {
                rta = "Vehículo insertado exitosamente";
                System.out.println("Vehículo insertado exitosamente");
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
}

    /**
     * public String ConsultarVehiculo(VehiculosDto conVehi){ String rta
     * = ""; try { stmt = con.prepareStatement("SELECT placa FROM
     * vehiculos " + "where placa = ?"); stmt.setInt(1,
     * conVehi.getPlaca());
     *
     * int resultadoConsulta = stmt.executeUpdate(); if (resultadoConsulta == 0)
     * { rta = "No Existe"; System.out.println("No Existe el Vehiculo"); }
     * else { rta = "Ya existe"; System.out.println("YA EXISTE"); } } catch
     * (SQLException sqle) { rta = sqle.getMessage(); } return rta;
     *
     * }*
     */
    public ArrayList<VehiculosDto> ConsultarVehiculo() {
        ArrayList<VehiculosDto> listadoVehiculos = new ArrayList<VehiculosDto>();
        try {
            stmt = con.prepareStatement("SELECT * FROM vehiculos WHERE placa=?");
            rs = stmt.executeQuery();

            while (rs.next()) {
                VehiculosDto unVehiculoNew = new VehiculosDto();
                unVehiculoNew.setPlaca(rs.getString("placa"));
                unVehiculoNew.setIdTiposVehiculo(rs.getInt("tipoVehiculo"));
                unVehiculoNew.setIdMarcas(rs.getInt("marcaVehiculo"));
                unVehiculoNew.setIdTiposCombustibles(rs.getInt("tiposCombustibles"));
                unVehiculoNew.setModelo(rs.getInt("modeloVehiculo"));
                unVehiculoNew.setIdEstadosVehiculo(rs.getInt("estadosVehiculo"));
                unVehiculoNew.setFechaEstado(rs.getString("fechaEstado"));
                unVehiculoNew.setIdColorVehiculo(rs.getInt("colorVehiculo"));
                unVehiculoNew.setIdEmpleoVehiculo(rs.getInt("empleoVehiculo"));
                unVehiculoNew.setSigla(rs.getString("sigla"));
                unVehiculoNew.setVin(rs.getString("vin"));
                unVehiculoNew.setMotor(rs.getString("motor"));
                unVehiculoNew.setCilindraje(rs.getInt("cilindraje"));
                unVehiculoNew.setLicenciaTransito(rs.getInt("licenciaTransito"));
                unVehiculoNew.setSeguroObligatorio(rs.getInt("seguroObligatorio"));
                unVehiculoNew.setVencimientoSeguro(rs.getString("vencimientoSeguro"));
                unVehiculoNew.setSeguroResponsabilidad(rs.getInt("seguroResponsabilidadCivil"));
                unVehiculoNew.setVencimientoResponsabilidad(rs.getString("vencimientoResponsabilidad"));
                unVehiculoNew.setRevisionTecnomecanica(rs.getInt("revisionTecnomecanica"));
                unVehiculoNew.setVencimientoTecnomecanica(rs.getString("vencimientoTecnomecanica"));
                unVehiculoNew.setFotoVehiculo(rs.getString("fotoVehiculo"));
                
                listadoVehiculos.add(unVehiculoNew);

            }

        } catch (SQLException sqle) {
        }
        return listadoVehiculos;
    }

    /**
     * public String Actualizar(VehiculosDto actuVehi) { String rta=""; try
     * { stmt = con.prepareStatement("UPDATE vehiculos SET placa =
     * ?, " + "idTiposVehiculo = ?,idMarcas = ?, idTiposCombustibles = ?, modelo = ?, idEstadosVehiculo
     * = ?, " + "fechaEstado = ?, idColorVehiculo = ?, idEmpleoVehiculo = ?, sigla = ?, vin
     * = ?, " + "motor = ?, cilindraje = ?, licenciaTransito =
     * ?, " + "seguroObligatorio = ?, vencimientoSeguro = ?, seguroResponsabilidad = ?,
     * vencimientoResponsabilidad = ?, revisionTecnomecanica=?, vencimientoTecnomecanica=?, fotoVehiculo=?"
     * + "WHERE placa=?;");
     *
     * stmt.setInt(1, actuVehi.getPlaca());
     * stmt.setInt(2,actuVehi.geIdTiposVehiculot()); stmt.setInt(3,
     * actuVehi.getIdMarcas()); stmt.setString(4,actuVehi.getidTiposCombustibles());
     *
     *
     * int resultado = stmt.executeUpdate(); if(resultado==0) {
     *
     * rta="Fallo al actualizar"; } else { rta="Registro actualizado
     * Exitosamente"; } } catch (SQLException sqle) { rta=sqle.getMessage(); }
     * return rta;*
     */
}
