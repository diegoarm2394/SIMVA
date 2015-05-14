/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.CiudadesDto;
import DTO.MantenimientosDto;
import Modelo.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author andres
 */
public class CreaFichaMant1Dao {

    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;

    public ArrayList<MantenimientosDto> ConsultarTodos(String placa) {

        ArrayList<MantenimientosDto> listado = new ArrayList<MantenimientosDto>();

//        try 
//        {
//            //stmt = con.prepareStatement("call Sp_Busqueda_Datos" placa);
//            rs = stmt.executeQuery();
//            
//               
//            while (rs.next())
//                
//            {
//                MantenimientosDto Matenimientosnew =new MantenimientosDto();
//                Matenimientosnew.set(rs.getInt("idCiudad"));
//                unaciudadnew.setNombreCiudad(rs.getString("nombreCiudad"));
//                listado.add(unaciudadnew);
//            }
//                 
//        }
//        catch (SQLException sqle){ 
//              
//            }
//              return listado;
//         }
//    }
        return null;
    }

}
