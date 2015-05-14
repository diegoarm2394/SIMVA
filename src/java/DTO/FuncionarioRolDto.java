/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author andres
 */
public class FuncionarioRolDto {
    private int idFuncionarioRol;
    private int idRol;
    private int numeroDocumento;
    private String usuarioLogin;
    private String contraseña;
    private String fechaCreacion;
    private String nombre;
    private String apellido;

    public FuncionarioRolDto() {
    }
    
    public FuncionarioRolDto(int idFuncionarioRol, int idRol, int numeroDocumento, String usuarioLogin, String contraseña, String fechaCreacion) {
        this.idFuncionarioRol = idFuncionarioRol;
        this.idRol = idRol;
        this.numeroDocumento = numeroDocumento;
        this.usuarioLogin = usuarioLogin;
        this.contraseña = contraseña;
        this.fechaCreacion = fechaCreacion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    
    
    public int getIdFuncionarioRol() {
        return idFuncionarioRol;
    }

    public void setIdFuncionarioRol(int idFuncionarioRol) {
        this.idFuncionarioRol = idFuncionarioRol;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public int getNumeroDocumento() {
        return numeroDocumento;
    }

    public void setNumeroDocumento(int numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
    }

    public String getUsuarioLogin() {
        return usuarioLogin;
    }

    public void setUsuarioLogin(String usuarioLogin) {
        this.usuarioLogin = usuarioLogin;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(String fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
    
}
