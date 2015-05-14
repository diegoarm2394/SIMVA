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
public class DireccionesDto {
    private int idDirecciones;
    private int numeroDocumento;
    private int idCiudad;
    private String tipoVial1;
    private int  numeroVial1;
    private String complemetoVial1;
    private String tipoVial2;
    private String complemetoVial2;

    public DireccionesDto(int idDirecciones, int numeroDocumento, int idCiudad, String tipoVial1, int numeroVial1, String complemetoVial1, String tipoVial2, String complemetoVial2) {
        this.idDirecciones = idDirecciones;
        this.numeroDocumento = numeroDocumento;
        this.idCiudad = idCiudad;
        this.tipoVial1 = tipoVial1;
        this.numeroVial1 = numeroVial1;
        this.complemetoVial1 = complemetoVial1;
        this.tipoVial2 = tipoVial2;
        this.complemetoVial2 = complemetoVial2;
    }

    public int getIdDirecciones() {
        return idDirecciones;
    }

    public void setIdDirecciones(int idDirecciones) {
        this.idDirecciones = idDirecciones;
    }

    public int getNumeroDocumento() {
        return numeroDocumento;
    }

    public void setNumeroDocumento(int numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
    }

    public int getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(int idCiudad) {
        this.idCiudad = idCiudad;
    }

    public String getTipoVial1() {
        return tipoVial1;
    }

    public void setTipoVial1(String tipoVial1) {
        this.tipoVial1 = tipoVial1;
    }

    public int getNumeroVial1() {
        return numeroVial1;
    }

    public void setNumeroVial1(int numeroVial1) {
        this.numeroVial1 = numeroVial1;
    }

    public String getComplemetoVial1() {
        return complemetoVial1;
    }

    public void setComplemetoVial1(String complemetoVial1) {
        this.complemetoVial1 = complemetoVial1;
    }

    public String getTipoVial2() {
        return tipoVial2;
    }

    public void setTipoVial2(String tipoVial2) {
        this.tipoVial2 = tipoVial2;
    }

    public String getComplemetoVial2() {
        return complemetoVial2;
    }

    public void setComplemetoVial2(String complemetoVial2) {
        this.complemetoVial2 = complemetoVial2;
    }
    
    
}
