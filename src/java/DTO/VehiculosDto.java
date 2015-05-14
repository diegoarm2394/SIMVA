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
public class VehiculosDto {
    private String placa;
    private int idTiposVehiculo;
    private int idMarcas;
    private int idTiposCombustibles;
    private int modelo;
    private int idEstadosVehiculo;
    private String fechaEstado;
    private int idColorVehiculo;
    private int idEmpleoVehiculo;
    private String sigla;
    private String vin;
    private String motor;
    private int cilindraje;
    private int licenciaTransito;
    private int seguroObligatorio;
    private String vencimientoSeguro;
    private int seguroResponsabilidad;
    private String vencimientoResponsabilidad;
    private int revisionTecnomecanica;
    private String vencimientoTecnomecanica;
    private String fotoVehiculo;

    public VehiculosDto(String placa, int idTiposVehiculo, int idMarcas, int idTiposCombustibles, int idEstadosVehiculo, String fechaEstado, int idColorVehiculo, int idEmpleoVehiculo, String sigla, String vin, String motor, int cilindraje, int licenciaTransito, int seguroObligatorio, String vencimientoSeguro, int seguroResponsabilidad, String vencimientoResponsabilidad, int revisionTecnomecanica, String vencimientoTecnomecanica, String fotoVehiculo) {
        this.placa = placa;
        this.idTiposVehiculo = idTiposVehiculo;
        this.idMarcas = idMarcas;
        this.idTiposCombustibles = idTiposCombustibles;
        this.idEstadosVehiculo = idEstadosVehiculo;
        this.fechaEstado = fechaEstado;
        this.idColorVehiculo = idColorVehiculo;
        this.idEmpleoVehiculo = idEmpleoVehiculo;
        this.sigla = sigla;
        this.vin = vin;
        this.motor = motor;
        this.cilindraje = cilindraje;
        this.licenciaTransito = licenciaTransito;
        this.seguroObligatorio = seguroObligatorio;
        this.vencimientoSeguro = vencimientoSeguro;
        this.seguroResponsabilidad = seguroResponsabilidad;
        this.vencimientoResponsabilidad = vencimientoResponsabilidad;
        this.revisionTecnomecanica = revisionTecnomecanica;
        this.vencimientoTecnomecanica = vencimientoTecnomecanica;
        this.fotoVehiculo = fotoVehiculo;
    }

    public VehiculosDto() {
    }
   
    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public int getIdTiposVehiculo() {
        return idTiposVehiculo;
    }

    public void setIdTiposVehiculo(int idTiposVehiculo) {
        this.idTiposVehiculo = idTiposVehiculo;
    }

    public int getIdMarcas() {
        return idMarcas;
    }

    public void setIdMarcas(int idMarcas) {
        this.idMarcas = idMarcas;
    }

    public int getIdTiposCombustibles() {
        return idTiposCombustibles;
    }

    public void setIdTiposCombustibles(int idTiposCombustibles) {
        this.idTiposCombustibles = idTiposCombustibles;
    }
    
    public int getModelo() {
        return modelo;
    }

    public void setModelo(int modelo) {
        this.modelo = modelo;
    }

    public int getIdEstadosVehiculo() {
        return idEstadosVehiculo;
    }

    public void setIdEstadosVehiculo(int idEstadosVehiculo) {
        this.idEstadosVehiculo = idEstadosVehiculo;
    }

    public String getFechaEstado() {
        return fechaEstado;
    }

    public void setFechaEstado(String fechaEstado) {
        this.fechaEstado = fechaEstado;
    }

    public int getIdColorVehiculo() {
        return idColorVehiculo;
    }

    public void setIdColorVehiculo(int idColorVehiculo) {
        this.idColorVehiculo = idColorVehiculo;
    }

    public int getIdEmpleoVehiculo() {
        return idEmpleoVehiculo;
    }

    public void setIdEmpleoVehiculo(int idEmpleoVehiculo) {
        this.idEmpleoVehiculo = idEmpleoVehiculo;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public String getMotor() {
        return motor;
    }

    public void setMotor(String motor) {
        this.motor = motor;
    }

    public int getCilindraje() {
        return cilindraje;
    }

    public void setCilindraje(int cilindraje) {
        this.cilindraje = cilindraje;
    }

    public int getLicenciaTransito() {
        return licenciaTransito;
    }

    public void setLicenciaTransito(int licenciaTransito) {
        this.licenciaTransito = licenciaTransito;
    }

    public int getSeguroObligatorio() {
        return seguroObligatorio;
    }

    public void setSeguroObligatorio(int seguroObligatorio) {
        this.seguroObligatorio = seguroObligatorio;
    }

    public String getVencimientoSeguro() {
        return vencimientoSeguro;
    }

    public void setVencimientoSeguro(String vencimientoSeguro) {
        this.vencimientoSeguro = vencimientoSeguro;
    }

    public int getSeguroResponsabilidad() {
        return seguroResponsabilidad;
    }

    public void setSeguroResponsabilidad(int seguroResponsabilidad) {
        this.seguroResponsabilidad = seguroResponsabilidad;
    }

    public String getVencimientoResponsabilidad() {
        return vencimientoResponsabilidad;
    }

    public void setVencimientoResponsabilidad(String vencimientoResponsabilidad) {
        this.vencimientoResponsabilidad = vencimientoResponsabilidad;
    }

    public int getRevisionTecnomecanica() {
        return revisionTecnomecanica;
    }

    public void setRevisionTecnomecanica(int revisionTecnomecanica) {
        this.revisionTecnomecanica = revisionTecnomecanica;
    }

    public String getVencimientoTecnomecanica() {
        return vencimientoTecnomecanica;
    }

    public void setVencimientoTecnomecanica(String vencimientoTecnomecanica) {
        this.vencimientoTecnomecanica = vencimientoTecnomecanica;
    }

    public String getFotoVehiculo() {
        return fotoVehiculo;
    }

    public void setFotoVehiculo(String fotoVehiculo) {
        this.fotoVehiculo = fotoVehiculo;
    }
    
    
    
}
