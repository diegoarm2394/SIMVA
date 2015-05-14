/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.CategoriasDto;
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
public class CategoriasDao {

    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;

    public String IngresarCategoria(CategoriasDto inCate) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("INSERT INTO categorias VALUES(?,?);");
            stmt.setInt(1, inCate.getIdCategoria());
            stmt.setString(2, inCate.getDescripcionCategoria());
            int resultado = stmt.executeUpdate();
            if (resultado == 0) {
                //resul=false;
                rta = "Fallo el ingreso de la Categoria";
            } else {
                rta = "Registro Categoria ingresado exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }

    public String EliminarCategoria(int Valor) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("DELETE FROM categorias  WHERE idCategoria=?");
            stmt.setInt(1, Valor);

            int resultado = stmt.executeUpdate();
            if (resultado == 0) {
                //resul=false;
                rta = "Fallo al eliminar la Categoria";
            } else {
                rta = "Registro Categoria eliminado Exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }

    public ArrayList<CategoriasDto> ConsultarCategoriasTodas() {
        ArrayList<CategoriasDto> listadoCategorias = new ArrayList<CategoriasDto>();
        try {
            stmt = con.prepareStatement("SELECT * FROM categorias ");
            rs = stmt.executeQuery();
            while (rs.next()) {
                CategoriasDto unaCategorianew = new CategoriasDto();
                unaCategorianew.setIdCategoria(rs.getInt("idCategoria"));
                unaCategorianew.setDescripcionCategoria(rs.getString("descripcionCategoria"));
                listadoCategorias.add(unaCategorianew);
            }
        } catch (SQLException sqle) {
        }
        return listadoCategorias;
    }

    public String ActualizarCategorias(CategoriasDto actuCate) {
        //boolean resul = false;
        String rta = "";
        try {
            stmt = con.prepareStatement("UPDATE categorias SET idCategoria=?, descripcionCategorias=?, WHERE idCategoria=?;");

            stmt.setInt(1, actuCate.getIdCategoria());
            stmt.setString(2, actuCate.getDescripcionCategoria());

            int resultado = stmt.executeUpdate();
            if (resultado == 0) {

                rta = "Fallo al actualizar la Categoria de la licencia de Conducción";
            } else {
                rta = "Registro de la Categoria de la licencia de Conducción actualizado Exitosamente";
            }
        } catch (SQLException sqle) {
            rta = sqle.getMessage();
        }
        return rta;
    }

}
