/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.CiudadesDto;
import DTO.FuncionarioRolDto;
import DTO.RolesDto;
import Modelo.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Diego
 */
public class FuncionarioDao {
    
    Connection con = Conexion.getInstace();    
    PreparedStatement stmt =null;
    ResultSet rs =null ;
    
    public String IngresarUsuario (FuncionarioRolDto inusu)
    {
       //boolean resul = false;
       String rta="";
        try 
        {   
            stmt = con.prepareStatement("INSERT INTO funcionariorol VALUES(?,?,?,?,?,?);");
            stmt.setInt(1,inusu.getIdFuncionarioRol());
            stmt.setInt(2,inusu.getIdRol());
            stmt.setInt(3,inusu.getNumeroDocumento());
            stmt.setString(4,inusu.getUsuarioLogin());
            stmt.setString(5,inusu.getContraseña());
            stmt.setString(6,inusu.getFechaCreacion());
            

                      
                int resultado = stmt.executeUpdate();
                    if(resultado==0)
                    {
                        //resul=false;
                        rta="Fallo el ingreso del registro";
                    }
                    else
                        {
                         rta="Registro ingresado exitosamente";
                        }   
        }
        catch (SQLException sqle) 
            { 
                rta=sqle.getMessage();
            }
    return rta;
    }
    
    public ArrayList<FuncionarioRolDto> ConsultarTodos() {
    
     
     
     ArrayList<FuncionarioRolDto> listado=new ArrayList<FuncionarioRolDto>();
      
        try 
        {
            stmt = con.prepareStatement("SELECT idFuncionarioRol, idRol, numeroDocumento, usuarioLogin, contraseña , fechaCreacion from funcionariorol;");
            rs = stmt.executeQuery();
            
               
            while (rs.next())
                
            {
                FuncionarioRolDto unusuarionew =new FuncionarioRolDto();
              
                unusuarionew.setIdFuncionarioRol(rs.getInt("idFuncionarioRol"));
                unusuarionew.setIdRol(rs.getInt("idRol"));
                unusuarionew.setNumeroDocumento(rs.getInt("numeroDocumento"));
                unusuarionew.setUsuarioLogin(rs.getString("usuarioLogin"));
                unusuarionew.setContraseña(rs.getString("contraseña"));
                unusuarionew.setFechaCreacion(rs.getString("fechaCreacion"));
                listado.add(unusuarionew);
            }
                 
        }
        catch (SQLException sqle){ 
              
            }
              return listado;
         }
    
    public String Eliminar(int Valor)
    {
       //boolean resul = false;
       String rta="";
        try 
        {
            stmt = con.prepareStatement("DELETE FROM funcionariorol WHERE idFuncionarioRol=?");
            stmt.setInt(1,Valor);
            
            
                int resultado = stmt.executeUpdate();
                    if(resultado==0)
                    {
                        //resul=false;
                        rta="Fallo al eliminar";
                    }
                    else
                        {
                         rta="Registro eliminado Exitosamente";
                        }   
        }
        catch (SQLException sqle) 
            { 
                rta=sqle.getMessage();
            }
    return rta;
    }
    
    public String ActualizarUsuario(FuncionarioRolDto actusu)
    {
       //boolean resul = false;
       String rta="";
        try 
        {
            stmt = con.prepareStatement("UPDATE funcionariorol SET idFuncionarioRol=?, idRol=?, usuarioLogin=?, contraseña=?, fechaCreacion=? WHERE numeroDocumento=?;");
        
            int id = 0;
            stmt.setInt(1,actusu.getIdRol());
            stmt.setInt(2,id);
            stmt.setString(3,actusu.getUsuarioLogin());
            stmt.setString(4,actusu.getContraseña());
            stmt.setString(5,actusu.getFechaCreacion());
            stmt.setInt(6,actusu.getNumeroDocumento());
            
            
   
            
                int resultado = stmt.executeUpdate();
                    if(resultado==0)
                    {
                        
                        rta="Fallo al actualizar";
                    }
                    else
                        {
                         rta="Registro actualizado Exitosamente";
                        }   
        }
        catch (SQLException sqle) 
            { 
                rta=sqle.getMessage();
            }
    return rta;
    }
    
   public ArrayList<FuncionarioRolDto> consulta(FuncionarioRolDto doc)
    {
       ArrayList<FuncionarioRolDto> listado=new ArrayList<FuncionarioRolDto>();
        try 
        {
         
            stmt = con.prepareStatement("select concat(nombre1,' ', nombre2) as nombre, concat(apellido1,' ', apellido2) as apellido from funcionarios where numeroDocumento=?");
             rs = stmt.executeQuery();
            
            stmt.setInt(1,doc.getNumeroDocumento());

            
   {
                FuncionarioRolDto unusuarionew =new FuncionarioRolDto();
              
                unusuarionew.setNombre(rs.getString("nombre"));
                unusuarionew.setApellido(rs.getString("apellido"));
  
                listado.add(unusuarionew);
            }
                 
        }
        catch (SQLException sqle){ 
              
            }
              return listado;
         }
}
