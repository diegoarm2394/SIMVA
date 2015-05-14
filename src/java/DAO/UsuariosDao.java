/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.FuncionarioRolDto;
import DTO.FuncionariosDto;
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
public class UsuariosDao {
    
        Connection con = Conexion.getInstace();    
        PreparedStatement stmt =null;
        ResultSet rs =null ;
        FuncionarioRolDto unusuarionew = new FuncionarioRolDto();
            
        
    public String IngresarUsuario (FuncionarioRolDto inusu) throws SQLException, ClassNotFoundException,
            SQLException{
    {
       //boolcean resul = false;
       String rta="";
        try 
        {   
            stmt = con.prepareStatement("INSERT INTO  funcionariorol (idRol, numeroDocumento, usuarioLogin, contraseña, fechaCreacion )  VALUES(?,?,?,?,?);");
            stmt.setInt(1,inusu.getIdRol());
            stmt.setInt(2,inusu.getNumeroDocumento());
            stmt.setString(3,inusu.getUsuarioLogin());
            stmt.setString(4,inusu.getContraseña());
            stmt.setString(5,inusu.getFechaCreacion());

            
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
                throw sqle;
            }
            // Aplicar a todas las consultas de todos los DAO (Sirve para cerrar la session que se inicia al relaizar la consulta)
        
//                finally {
//            
//            if (con!=null){
//                try{
//                    con.close();
//                } catch (SQLException e){
//                    e.printStackTrace();
//                }
//            }
//        }
    return rta;
    }
    }
    
    public ArrayList<FuncionarioRolDto> ConsultarTodos() {

        ArrayList<FuncionarioRolDto> listado=new ArrayList<FuncionarioRolDto>();
      
        try 
        {
            stmt = con.prepareStatement("SELECT * FROM funcionariorol ");
            rs = stmt.executeQuery();
            
               
            while (rs.next())
                
            {
                FuncionarioRolDto unaliadonew =new FuncionarioRolDto();
                unaliadonew.setIdFuncionarioRol(rs.getInt("idFuncionarioRol"));
                unaliadonew.setIdRol(rs.getInt("idRol"));
                unaliadonew.setNumeroDocumento(rs.getInt("numeroDocumento"));
                unaliadonew.setUsuarioLogin(rs.getString("usuarioLogin"));
                unaliadonew.setContraseña(rs.getString("contraseña"));
                unaliadonew.setFechaCreacion(rs.getString("fechaCreacion"));
                
                listado.add(unaliadonew);
            }
                 
        }
        catch (SQLException sql){ 
              
            }
              return listado;
              
         }
 public String Eliminar(int Documento)
    {
       //boolean resul = false;
       String rta="";
        try 
        {
            stmt = con.prepareStatement("DELETE FROM funcionariorol WHERE numeroDocumento = ?");
            stmt.setInt(1,Documento);
            
            
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
 public String Actualizarcata(FuncionarioRolDto re1)
       
    {
       //boolean resul = false;
       String rta="";
        try 
        {
            stmt = con.prepareStatement("UPDATE funcionariorol SET  idRol=?, usuarioLogin=?, contraseña=?,  fechaCreacion=?  WHERE  numeroDocumento=?;");
            
            
            stmt.setInt(1,re1.getIdRol());
            stmt.setString(2,re1.getUsuarioLogin());
            stmt.setString(3,re1.getContraseña());
            stmt.setString(4,re1.getFechaCreacion());
            stmt.setInt(5,re1.getNumeroDocumento());

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

  
 
public FuncionarioRolDto ConsultarUno(int Documento) {
    
   
     FuncionarioRolDto unaliadonew =new FuncionarioRolDto();
                
      
        try 
        {
            stmt = con.prepareStatement("SELECT  * FROM funcionariorol where numeroDocumento=?");
             stmt.setInt(1,Documento);
            
            
            rs = stmt.executeQuery();
            
            while (rs.next())
                
            {
                
                unaliadonew.setIdFuncionarioRol(rs.getInt("idFuncionarioRol"));
                unaliadonew.setIdRol(rs.getInt("idRol"));
                unaliadonew.setNumeroDocumento(rs.getInt("numeroDocumento"));
                unaliadonew.setUsuarioLogin(rs.getString("usuarioLogin"));
                unaliadonew.setContraseña(rs.getString("contraseña"));
                unaliadonew.setFechaCreacion(rs.getString("fechaCreacion"));               
                
                            }
                 
        }
        catch (SQLException sql){ 
              
            }
              return unaliadonew;
              
         } 


public FuncionariosDto ConsultarUno2(int Documento) {
    
   
     FuncionariosDto unaliadonew =new FuncionariosDto();
                
      
        try 
        {
            stmt = con.prepareStatement("SELECT  * FROM funcionarios where numeroDocumento=?");
             stmt.setInt(1,Documento);
            
            
            rs = stmt.executeQuery();
            
            while (rs.next())
                
            {
                
                unaliadonew.setNombre1(rs.getString("nombre1"));
                unaliadonew.setNombre2(rs.getString("nombre2"));
                unaliadonew.setApellido1(rs.getString("apellido1"));
                unaliadonew.setApellido2(rs.getString("apellido2"));               
                
                            }
                 
        }
        catch (SQLException sql){ 
              
            }
              return unaliadonew;
              
         }
}

  
