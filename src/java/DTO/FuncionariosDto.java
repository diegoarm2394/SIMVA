/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Jairo
 */
public class FuncionariosDto {
    
    private int numeroDocumento;
    private int idCiudad;
    private int idGrados;
    private String  apellido1;
    private String  apellido2;
    private String  nombre1;
    private String  nombre2;
    private String  fechaNacimiento;
    private int idRh;
    private String  telefono;
    private String movil;
    private String indicativo;
    private String licenciaConduccion;
    private String vencimientoLicencia;
    private int idCategoria;
    private String  fechaAlta;
    private String  email;
    private String  fotoFuncionario;
    
    public int getNumeroDocumento(){
        return numeroDocumento;
    }
    
    public void setNumeroDocumento(int numeroDocumento){
        this.numeroDocumento = numeroDocumento; 
    }
           
    
    public int getIdGrados() {
        return idGrados;
    }

    public void setIdGrados(int idGrados) {
        this.idGrados = idGrados;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public String getNombre1() {
        return nombre1;
    }

    public void setNombre1(String nombre1) {
        this.nombre1 = nombre1;
    }

    public String getNombre2() {
        return nombre2;
    }

    public void setNombre2(String nombre2) {
        this.nombre2 = nombre2;
    }

    public int getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(int idCiudad) {
        this.idCiudad = idCiudad;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public int getIdRh() {
        return idRh;
    }

    public void setIdRh(int idRh) {
        this.idRh = idRh;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getMovil() {
        return movil;
    }

    public void setMovil(String movil) {
        this.movil = movil;
    }

    public String getIndicativo() {
        return indicativo;
    }

    public void setIndicativo(String indicativo) {
        this.indicativo = indicativo;
    }

    public String getLicenciaConduccion() {
        return licenciaConduccion;
    }

    public void setLicenciaConduccion(String licenciaConduccion) {
        this.licenciaConduccion = licenciaConduccion;
    }
    
    public String getVencimientoLicencia(){
        return vencimientoLicencia;

    }
    
    public void setVencimientoLicencia(String vencimientoLicencia){
        this.vencimientoLicencia = vencimientoLicencia;
    }


    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getFechaAlta() {
        return fechaAlta;
    }

    public void setFechaAlta(String fechaAlta) {
        this.fechaAlta = fechaAlta;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getfotoFuncionario() {
        return fotoFuncionario;
    }

    public void setfotoFuncionario(String fotoFuncionario) {
        this.fotoFuncionario = fotoFuncionario;
    }

    public FuncionariosDto(int numeroDocumento, int idCiudad, int idGrados, String apellido1, String apellido2, String nombre1, String nombre2, String fechaNacimiento, int idRh, String telefono, String movil, String indicativo, String licenciaConduccion, String vencimientoLicencia, int idCategoria, String fechaAlta, String email, String fotoFuncionario) {
        this.numeroDocumento = numeroDocumento;
        this.idCiudad = idCiudad;
        this.idGrados = idGrados;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.nombre1 = nombre1;
        this.nombre2 = nombre2;
        this.fechaNacimiento = fechaNacimiento;
        this.idRh = idRh;
        this.telefono = telefono;
        this.movil = movil;
        this.indicativo = indicativo;
        this.licenciaConduccion = licenciaConduccion;
        this.vencimientoLicencia = vencimientoLicencia;
        this.idCategoria = idCategoria;
        this.fechaAlta = fechaAlta;
        this.email = email;
        this.fotoFuncionario = fotoFuncionario;
    }

    public FuncionariosDto() {
    }
    
    
    
}
