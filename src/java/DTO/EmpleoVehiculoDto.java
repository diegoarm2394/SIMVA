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
public class EmpleoVehiculoDto {
    private int idEmpleoVehiculo;
    private String descripcionEmpleVehiculo;

    public EmpleoVehiculoDto() {
    }
    
    public EmpleoVehiculoDto(int idEmpleoVehiculo, String descripcionEmpleVehiculo) {
        this.idEmpleoVehiculo = idEmpleoVehiculo;
        this.descripcionEmpleVehiculo = descripcionEmpleVehiculo;
    }

    public int getIdEmpleoVehiculo() {
        return idEmpleoVehiculo;
    }

    public void setIdEmpleoVehiculo(int idEmpleoVehiculo) {
        this.idEmpleoVehiculo = idEmpleoVehiculo;
    }

    public String getDescripcionEmpleVehiculo() {
        return descripcionEmpleVehiculo;
    }

    public void setDescripcionEmpleVehiculo(String descripcionEmpleVehiculo) {
        this.descripcionEmpleVehiculo = descripcionEmpleVehiculo;
    }
    
}
