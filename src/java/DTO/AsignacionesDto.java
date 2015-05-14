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
public class AsignacionesDto {
    private int idAsignaciones;
    private int numeroDocumento;
    private String placa;
    private String fechaAsignacion;
    private String fechaDesacignacion;
    private String novedadesVehiculos;

    public AsignacionesDto() {
    }
    
    

    public AsignacionesDto(int idAsignaciones, int numeroDocumento, String placa, String fechaAsignacion, String fechaDesacignacion, String novedadesVehiculos) {
        this.idAsignaciones = idAsignaciones;
        this.numeroDocumento = numeroDocumento;
        this.placa = placa;
        this.fechaAsignacion = fechaAsignacion;
        this.fechaDesacignacion = fechaDesacignacion;
        this.novedadesVehiculos = novedadesVehiculos;
    }

    public int getIdAsignaciones() {
        return idAsignaciones;
    }

    public void setIdAsignaciones(int idAsignaciones) {
        this.idAsignaciones = idAsignaciones;
    }

    public int getNumeroDocumento() {
        return numeroDocumento;
    }

    public void setNumeroDocumento(int numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getFechaAsignacion() {
        return fechaAsignacion;
    }

    public void setFechaAsignacion(String fechaAsignacion) {
        this.fechaAsignacion = fechaAsignacion;
    }

    public String getFechaDesacignacion() {
        return fechaDesacignacion;
    }

    public void setFechaDesacignacion(String fechaDesacignacion) {
        this.fechaDesacignacion = fechaDesacignacion;
    }

    public String getNovedadesVehiculos() {
        return novedadesVehiculos;
    }

    public void setNovedadesVehiculos(String novedadesVehiculos) {
        this.novedadesVehiculos = novedadesVehiculos;
    }
    
    
}
