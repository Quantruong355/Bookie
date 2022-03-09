/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author Acer
 */
public class Category implements Serializable{
    private int genreid;
    private String catename;
    
    public Category(){
        
    }
    
    public Category(int genreid, String catename){
        this.genreid = genreid;
        this.catename = catename;
    }

    public int getGenreid() {
        return genreid;
    }

    public void setGenreid(int genreid) {
        this.genreid = genreid;
    }

    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        this.catename = catename;
    }
    
}
