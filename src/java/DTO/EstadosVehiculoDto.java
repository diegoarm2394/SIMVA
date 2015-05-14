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
public class EstadosVehiculoDto {
    private int idEstadosVehiculo;
    private String descripcionEstadoVehiculo;

    public EstadosVehiculoDto() {
    }
  
    public EstadosVehiculoDto(int idEstadosVehiculo, String descripcionEstadoVehiculo) {
        this.idEstadosVehiculo = idEstadosVehiculo;
        this.descripcionEstadoVehiculo = descripcionEstadoVehiculo;
    }

    public int getIdEstadosVehiculo() {
        return idEstadosVehiculo;
    }

    public void setIdEstadosVehiculo(int idEstadosVehiculo) {
        this.idEstadosVehiculo = idEstadosVehiculo;
    }

    public String getDescripcionEstadoVehiculo() {
        return descripcionEstadoVehiculo;
    }

    public void setDescripcionEstadoVehiculo(String descripcionEstadoVehiculo) {
        this.descripcionEstadoVehiculo = descripcionEstadoVehiculo;
    }
    
    
}
