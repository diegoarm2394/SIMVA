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
public class GradosDto {
    private int idGrados;
    private String descripcionGrado;

    public GradosDto() {
    }
    
    public GradosDto(int idGrados, String descripcionGrado) {
        this.idGrados = idGrados;
        this.descripcionGrado = descripcionGrado;
    }

    public int getIdGrados() {
        return idGrados;
    }

    public void setIdGrados(int idGrados) {
        this.idGrados = idGrados;
    }

    public String getDescripcionGrado() {
        return descripcionGrado;
    }

    public void setDescripcionGrado(String descripcionGrado) {
        this.descripcionGrado = descripcionGrado;
    }
    
    
}
