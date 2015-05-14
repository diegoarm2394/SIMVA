/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.FuncionariosDto;
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
public class FuncionariDao {
   
    Connection con = Conexion.getInstace();
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    public String IngresarFuncionario(FuncionariosDto ingFunci)
    {
        String rta="";
        try
        {
            stmt = con.prepareStatement("INSERT INTO  funcionarios (numeroDocumento, idCiudad, "
                    + "idGrados,apellido1, apellido2, nombre1, nombre2, fechaNacimiento, "
                    + "idRh, telefono, movil, indicativo, licenciaConduccion,"
                    + "vencimientoLicencia, idCategoria, fechaAlta, eMail,fotoFuncionario) "
                    + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                    //+ "VALUES(?,?,?,?,null,?,null,null,?,?,?,null,null,null,null,?,null,null)");
            stmt.setInt(1, ingFunci.getNumeroDocumento());
            stmt.setInt(2, ingFunci.getIdCiudad());
            stmt.setInt(3, ingFunci.getIdGrados());
            stmt.setString(4, ingFunci.getApellido1());
            stmt.setString(5, ingFunci.getApellido2());
            stmt.setString(6, ingFunci.getNombre1());
            stmt.setString(7, ingFunci.getNombre2());
            stmt.setString(8, ingFunci.getFechaNacimiento());
            stmt.setInt(9, ingFunci.getIdRh());
            stmt.setString(10, ingFunci.getTelefono());
            stmt.setString(11, ingFunci.getMovil());
            stmt.setString(12, ingFunci.getIndicativo());
            stmt.setString(13, ingFunci.getLicenciaConduccion());
            stmt.setString(14, ingFunci.getVencimientoLicencia());
            stmt.setInt(15, ingFunci.getIdCategoria());
            stmt.setString(16, ingFunci.getFechaAlta());
            stmt.setString(17, ingFunci.getEmail());
            stmt.setString(18, ingFunci.getfotoFuncionario());
            
            int resultado = stmt.executeUpdate();
                if(resultado==0){
                    rta="Fallo el ingreso del funcionario";
                    System.out.println("Fallo el ingreso del funcionario");
                }
                else
                {
                    rta="Funcionario insertado exitosamente";
                    System.out.println("Funcionario insertado exitosamente");
                }
        }
        catch (SQLException sqle)
            {
                rta=sqle.getMessage();
            }  
        return rta;
    
    }
    public String Eliminar(int eliFunci)
    {
        String rta="";
        try 
        {
            stmt = con.prepareStatement("DELETE FROM funcionarios  WHERE numeroDocumento=?");
            stmt.setInt(1,eliFunci);
        
                int resultado = stmt.executeUpdate();
                    if(resultado==0)
                    {
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
    
     public ArrayList<FuncionariosDto> ConsultarTodos() {
    
     
     
     ArrayList<FuncionariosDto> listado=new ArrayList<FuncionariosDto>();
      
        try 
        {
            stmt = con.prepareStatement("SELECT * FROM Funcionarios");
            rs = stmt.executeQuery();
            
               
            while (rs.next())
                
            {
                FuncionariosDto unFuncionarioNew = new FuncionariosDto();
                unFuncionarioNew.setNumeroDocumento(rs.getInt("numeroDocumento"));
                unFuncionarioNew.setIdCiudad(rs.getInt("ciudadDocumento"));
                unFuncionarioNew.setApellido1(rs.getString("apellido1"));
                unFuncionarioNew.setApellido2(rs.getString("apellido2"));
                unFuncionarioNew.setNombre1(rs.getString("nombre1"));
                unFuncionarioNew.setNombre2(rs.getString("nombre2"));
                unFuncionarioNew.setFechaNacimiento(rs.getString("campoFechaNacimiento"));
                unFuncionarioNew.setIdRh(rs.getInt("idRh"));
                unFuncionarioNew.setTelefono(rs.getString("telefono"));
                unFuncionarioNew.setMovil(rs.getString("movil"));
                unFuncionarioNew.setIndicativo(rs.getString("indicativo"));
                unFuncionarioNew.setLicenciaConduccion(rs.getString("licenciaConduccion"));
                unFuncionarioNew.setVencimientoLicencia(rs.getString("vencimientoCategoria"));
                unFuncionarioNew.setIdCategoria(rs.getInt("categoria"));
                unFuncionarioNew.setFechaAlta(rs.getString("fechaAlta"));
                unFuncionarioNew.setEmail(rs.getString("email"));
                unFuncionarioNew.setfotoFuncionario(rs.getString("fotoFuncionario"));
                listado.add(unFuncionarioNew);       
                        
            }
                 
        }
        catch (SQLException sqle){ 
              
            }
              return listado;
         }
     public String Actualizar(FuncionariosDto actuFunci)
    {
        String rta="";
        try 
        {
            stmt = con.prepareStatement("UPDATE funcionarios SET numeroDocumento = ?, "
                    + "idCiudad = ?,idGrados = ?, apellido1 = ?, apellido2 = ?, nombre1 = ?, "
                    + "nombre2 = ?, fechaNacimiento = ?, idRh = ?, telefono = ?, movil = ?, "
                    + "indicativo = ?, licenciaConduccion = ?, vencimientoLicencia = ?, "
                    + "idCategoria = ?, fechaAlta = ?, eMail = ?,fotoFuncionario = ?, "
                    + "WHERE numeroDocumento=?;");
        
            stmt.setInt(1, actuFunci.getNumeroDocumento());
            stmt.setInt(2,actuFunci.getIdCiudad());
            stmt.setInt(3, actuFunci.getIdGrados());
            stmt.setString(2,actuFunci.getEmail());
            
            
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
            
 
    
}
