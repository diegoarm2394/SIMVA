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
public class ColorVehiculoDto {
    private int idColorVehiculo;
    private String descripcionColorVehiculo;

    public ColorVehiculoDto() {
    }
    
    

    public ColorVehiculoDto(int idColorVehiculo, String descripcionColorVehiculo) {
        this.idColorVehiculo = idColorVehiculo;
        this.descripcionColorVehiculo = descripcionColorVehiculo;
    }

    public int getIdColorVehiculo() {
        return idColorVehiculo;
    }

    public void setIdColorVehiculo(int idColorVehiculo) {
        this.idColorVehiculo = idColorVehiculo;
    }

    public String getDescripcionColorVehiculo() {
        return descripcionColorVehiculo;
    }

    public void setDescripcionColorVehiculo(String descripcionColorVehiculo) {
        this.descripcionColorVehiculo = descripcionColorVehiculo;
    }
    
    
}
