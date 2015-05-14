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
public class TiposVehiculoDto {
    private int idTiposVehiculo;
    private String descripcionTipoVehiculo;

    public TiposVehiculoDto() {
    }
    
   public TiposVehiculoDto(int idTiposVehiculo, String descripcionTipoVehiculo) {
        this.idTiposVehiculo = idTiposVehiculo;
        this.descripcionTipoVehiculo = descripcionTipoVehiculo;
    }

    public int getIdTiposVehiculo() {
        return idTiposVehiculo;
    }

    public void setIdTiposVehiculo(int idTiposVehiculo) {
        this.idTiposVehiculo = idTiposVehiculo;
    }

    public String getDescripcionTipoVehiculo() {
        return descripcionTipoVehiculo;
    }

    public void setDescripcionTipoVehiculo(String descripcionTipoVehiculo) {
        this.descripcionTipoVehiculo = descripcionTipoVehiculo;
    }
    
    
}
