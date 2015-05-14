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
public class RhDto {
    private int idRh;
    private String descripcionRh;

    public RhDto() {
    }
     
    public RhDto(int idRh, String descripcionRh) {
        this.idRh = idRh;
        this.descripcionRh = descripcionRh;
    }

    public int getIdRh() {
        return idRh;
    }

    public void setIdRh(int idRh) {
        this.idRh = idRh;
    }

    public String getDescripcionRh() {
        return descripcionRh;
    }

    public void setDescripcionRh(String descripcionRh) {
        this.descripcionRh = descripcionRh;
    }
    
}
