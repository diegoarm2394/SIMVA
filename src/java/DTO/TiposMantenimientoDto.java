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
public class TiposMantenimientoDto {
    private int idTiposMantenimiento;
    private String descripcionMantenimiento;

    public TiposMantenimientoDto(int idTiposMantenimiento, String descripcionMantenimiento) {
        this.idTiposMantenimiento = idTiposMantenimiento;
        this.descripcionMantenimiento = descripcionMantenimiento;
    }

    public int getIdTiposMantenimiento() {
        return idTiposMantenimiento;
    }

    public void setIdTiposMantenimiento(int idTiposMantenimiento) {
        this.idTiposMantenimiento = idTiposMantenimiento;
    }

    public String getDescripcionMantenimiento() {
        return descripcionMantenimiento;
    }

    public void setDescripcionMantenimiento(String descripcionMantenimiento) {
        this.descripcionMantenimiento = descripcionMantenimiento;
    }
    
    
}
