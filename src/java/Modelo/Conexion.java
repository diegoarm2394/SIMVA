/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Josarta
 */
public class Conexion {
    
  static Connection con = null;
 
 
 
private static void Conexion() {
  try {
   
   String driver = "com.mysql.jdbc.Driver";
   String url = "jdbc:mysql://localhost:3306/";
   String basededatos ="simva";
   String usuario = "root";
   String clave = "";
    
   Class.forName(driver).newInstance();
   con = DriverManager.getConnection(url+basededatos, usuario,clave);
    } catch (InstantiationException | IllegalAccessException
     | ClassNotFoundException | SQLException e) {
    e.printStackTrace();
    }
 }
 
 
public static Connection getInstace() {
        if (con == null) {
            Conexion();
        }
        return con;
    } 


 public void cerrarConexion(){
  try {
   con.close();
  } catch (SQLException e) {
   e.printStackTrace();
  }
 }

  
}