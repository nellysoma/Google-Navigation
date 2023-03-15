/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author harmony
 */
public class Location {
    
    private String locationId;
    private String nameOfLocaton;
    private String latitude;
    private String longitude;
    private String city;
    private String state;
    private String country;
    
    public String setLocationId(String locationId){
        
        this.locationId = locationId;
        
        return  this.locationId;
    }
    
    public String getLocationId(){
        
        return  this.locationId;
    }
    
    public String setNameOfLocaton(String nameOfLocaton){
        
        this.nameOfLocaton = nameOfLocaton;
        
        return  this.nameOfLocaton;
    }
    
    public String getNameOfLocaton(){
        
        return  this.nameOfLocaton;
    }
    
    public String setLatitude(String latitude){
        
        this.latitude = latitude;
        
        return  this.latitude;
    }
    
    public String getLatitude(){
        
        return  this.latitude;
    }
    
    public String setLongitude(String longitude){
        
        this.longitude = longitude;
        
        return  this.longitude;
    }
    
    public String getLongitude(){
        
        return  this.longitude;
    }
    
    public String setCity(String city){
        
        this.city = city;
        
        return  this.city;
    }
    
    public String getCity(){
        
        return  this.city;
    }
    
    public String setState(String state){
        
        this.state = state;
        
        return  this.state;
    }
    
    public String getState(){
        
        return  this.state;
    }
    
    public String setCountry(String country){
        
        this.country = country;
        
        return  this.country;
    }
    
    public String getCountry(){
        
        return  this.country;
    }
    
}
