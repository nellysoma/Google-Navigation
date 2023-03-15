/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Location;

/**
 *
 * @author harmony
 */
public class DbConnection {
    
    private static final String DATABASE_URL = "jdbc:mysql://localhost/photo?serverTimezone=UTC";
   
    private static final String USERNAME = "root";
    
    private static final String PASSWORD = "root";
    
    private static  Connection connection = null;//manage connection
    
    private PreparedStatement insertLocation = null;
    
    private Statement lcationList = null;
    
    private ResultSet lcationListResult = null;
    
    //create a file input stream
    FileInputStream fis;
    
    public static void connectToDataBase() throws ClassNotFoundException{
        
        try{
            
            // Load (and therefore register) the  Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Get a Connection to the database
            connection = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
            
        }
        catch(SQLException error){
            
            error.printStackTrace();
            System.out.print("What is trying to say here is that, it could not connect to the database");
            
        }
    }
    
    private void closeConnection(Connection connection) {
        if (connection == null) {
            return;
        }
        try {
            connection.close();
        } catch (SQLException ex) {
        }
    }
    
    public void registerLocation(String name_of_location, String latitude, String longitude, String city, String state, 
             String country, String photo) throws ClassNotFoundException, FileNotFoundException{
        
        String latlng = latitude +","+longitude;
        
        try{ 
            
            connectToDataBase();
            
            File file = new File(photo);
            
            
            
        insertLocation = connection.prepareStatement("INSERT INTO location(name_of_location,latitude,longitude,city,state,"
                + "country,photo,latlng)VALUES(?,?,?,?,?,?,?,?)");
        
        insertLocation.setString(1, name_of_location);
        insertLocation.setString(2, latitude);
        insertLocation.setString(3, longitude);
        insertLocation.setString(4, city);
        insertLocation.setString(5, state);
        insertLocation.setString(6, country);
        
        fis = new FileInputStream(photo);

        insertLocation.setBinaryStream(7, (InputStream) fis, (int) (file.length()));
        
        insertLocation.setString(8, latlng);
        insertLocation.executeUpdate();
        
        }
        catch(SQLException error){
            
            error.printStackTrace();
            System.out.print("What is trying to say here is that, it could not register the school");
            closeConnection(connection);
        }
    }
    
    public List<Location> viewAllLocations() throws ClassNotFoundException {
        
        List<Location> result = new ArrayList();
        
        try {
            String sql = "SELECT * FROM location";
            
            connectToDataBase();
            
            lcationList = connection.createStatement();
            
            lcationListResult = lcationList.executeQuery(sql);
            
            
            while(lcationListResult.next()){
                
             Location location = new Location();
            
            location.setLocationId(lcationListResult.getString("location_id"));
            location.setNameOfLocaton(lcationListResult.getString("name_of_location"));
            location.setLatitude(lcationListResult.getString("latitude"));
            location.setLongitude(lcationListResult.getString("longitude"));
            location.setCity(lcationListResult.getString("city"));
            location.setState(lcationListResult.getString("state"));
            location.setCountry(lcationListResult.getString("country"));
            
            result.add(location);
            }   
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        
        return result;//new String[]{admissionNumber,admissionDate,firstName,middleName,lastName,dateofBirth,gender,nationality,state_of_origin,lga,religion};
    }
    
}
