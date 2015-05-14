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
public class MarcasDto {
    private int idMarcas;
    private String descripcionMarcaVehiculo;

    public MarcasDto() {
    }
    
    public MarcasDto(int idMarcas, String descripcionMarcaVehiculo) {
        this.idMarcas = idMarcas;
        this.descripcionMarcaVehiculo = descripcionMarcaVehiculo;
    }

    public int getIdMarcas() {
        return idMarcas;
    }

    public void setIdMarcas(int idMarcas) {
        this.idMarcas = idMarcas;
    }

    public String getDescripcionMarcaVehiculo() {
        return descripcionMarcaVehiculo;
    }

    public void setDescripcionMarcaVehiculo(String descripcionMarcaVehiculo) {
        this.descripcionMarcaVehiculo = descripcionMarcaVehiculo;
    }
    
}
