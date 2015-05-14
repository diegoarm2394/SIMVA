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
public class MantenimientosDto {
    private int idMantenimientos;
    private String placa;
    private int idTipoMantenimiento;
    private String fechaIngresoMantenimiento;
    private String fechaSalidaMantenimiento;
    private String fechaProximoMantenimiento;
    private String observaciones;

    public int getCcMantenimiento() {
        return CcMantenimiento;
    }

    public void setCcMantenimiento(int CcMantenimiento) {
        this.CcMantenimiento = CcMantenimiento;
    }
    private int CcMantenimiento;

    public MantenimientosDto(int idMantenimientos, String placa, int idTipoMantenimiento, String fechaIngresoMantenimiento, String fechaSalidaMantenimiento, String fechaProximoMantenimiento, String observaciones) {
        this.idMantenimientos = idMantenimientos;
        this.placa = placa;
        this.idTipoMantenimiento = idTipoMantenimiento;
        this.fechaIngresoMantenimiento = fechaIngresoMantenimiento;
        this.fechaSalidaMantenimiento = fechaSalidaMantenimiento;
        this.fechaProximoMantenimiento = fechaProximoMantenimiento;
        this.observaciones = observaciones;
    }

    public MantenimientosDto() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getIdMantenimientos() {
        return idMantenimientos;
    }

    public void setIdMantenimientos(int idMantenimientos) {
        this.idMantenimientos = idMantenimientos;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public int getIdTipoMantenimiento() {
        return idTipoMantenimiento;
    }

    public void setIdTipoMantenimiento(int idTipoMantenimiento) {
        this.idTipoMantenimiento = idTipoMantenimiento;
    }

    public String getFechaIngresoMantenimiento() {
        return fechaIngresoMantenimiento;
    }

    public void setFechaIngresoMantenimiento(String fechaIngresoMantenimiento) {
        this.fechaIngresoMantenimiento = fechaIngresoMantenimiento;
    }

    public String getFechaSalidaMantenimiento() {
        return fechaSalidaMantenimiento;
    }

    public void setFechaSalidaMantenimiento(String fechaSalidaMantenimiento) {
        this.fechaSalidaMantenimiento = fechaSalidaMantenimiento;
    }

    public String getFechaProximoMantenimiento() {
        return fechaProximoMantenimiento;
    }

    public void setFechaProximoMantenimiento(String fechaProximoMantenimiento) {
        this.fechaProximoMantenimiento = fechaProximoMantenimiento;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
    
}
