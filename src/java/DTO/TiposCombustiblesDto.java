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
public class TiposCombustiblesDto {
    private int idTiposCombustibles;
    private String descripcionTipoCombustible;

    public TiposCombustiblesDto() {
    }
    
    

    public TiposCombustiblesDto(int idTiposCombustibles, String descripcionTipoCombustible) {
        this.idTiposCombustibles = idTiposCombustibles;
        this.descripcionTipoCombustible = descripcionTipoCombustible;
    }

    public int getIdTiposCombustibles() {
        return idTiposCombustibles;
    }

    public void setIdTiposCombustibles(int idTiposCombustibles) {
        this.idTiposCombustibles = idTiposCombustibles;
    }

    public String getDescripcionTipoCombustible() {
        return descripcionTipoCombustible;
    }

    public void setDescripcionTipoCombustible(String descripcionTipoCombustible) {
        this.descripcionTipoCombustible = descripcionTipoCombustible;
    }
    
}
