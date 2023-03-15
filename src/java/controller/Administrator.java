/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DbConnection;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;;
import org.apache.commons.io.*;

import model.Location;


/**
 *
 * @author harmony
 */
@WebServlet(name = "Administrator", urlPatterns = {"/Administrator"})
public class Administrator extends HttpServlet {

    
    public void registerLocation(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, ServletException, IOException, org.apache.tomcat.util.http.fileupload.FileUploadException, FileUploadException{
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {

            String name_of_location = "";
            String latitude = "";
            String longitude = "";
            String city = "";
            String state = "";
            String country = "";
            String photo = "";
   
                    String rootPath = System.getProperty("catalina.home");
                    ServletContext servletContext= getServletContext();
                    String relativePath = servletContext.getInitParameter("fileUploads.dir");
                    File file = new File(rootPath + File.separator + relativePath);
                    if(!file.exists()) 
                        file.mkdirs();
                    
                    // Verify the content type
                    String contentType = request.getContentType();
                    
                    if ((contentType.indexOf("multipart/form-data") >= 0)) {
                        
                        // Create a factory for disk-based file items
                        DiskFileItemFactory fileFactory = new DiskFileItemFactory();
                        
                        File filesDir =  (File)(file);
                        
                        fileFactory.setRepository(filesDir);
                        
                        // Create a new file upload handler
                       ServletFileUpload upload = new ServletFileUpload(fileFactory);
                       
                           // Parse the request to get file items.
                           List<FileItem> fileItemsList = upload.parseRequest(request);
                           
                           // Process the uploaded items
                           Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
                           
                           while (fileItemsIterator.hasNext()) {
                               FileItem fileItem = fileItemsIterator.next();
                                if (fileItem.isFormField()) {
                                    String name = fileItem.getFieldName();
                                    String value = fileItem.getString();
                                    if (name.equals("name_of_location")) {
                                        name_of_location = value;
                                       }
                                    if (name.equals("latitude")) {
                                        latitude = value;    
                                    }
                                    if (name.equals("longitude")) {
                                        longitude = value;  
                                    } 
                                    if (name.equals("city")) {
                                        city = value;  
                                    } 
                                    if (name.equals("state")) {
                                        state = value;  
                                    } 
                                    if (name.equals("country")) {
                                        country = value;  
                                    } 
                                }else {
                                    
                                    File file1 = new File(rootPath + File.separator + relativePath+File.separator+fileItem.getName());
                                    photo = rootPath + File.separator + relativePath+File.separator+fileItem.getName();
                        try {
                            fileItem.write(file1);
                        } catch (Exception ex) {
                            //Logger.getLogger(RegisterStudent.class.getName()).log(Level.SEVERE, null, ex);
                        }
                                }
                           }   
                    }
                    DbConnection dbobject = new DbConnection();
                    dbobject.registerLocation(name_of_location, latitude, longitude, city, state, country,photo);
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/register_new_location_succesful.jsp");
                    rd.forward(request, response);
        } catch (ClassNotFoundException | FileNotFoundException  error) {
            error.printStackTrace();
            out.println(error); 
        }    
    }

    
    private void viewAllLocation(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, ServletException, IOException {

        DbConnection dbobject = new DbConnection();
        DbConnection dbobject1 = new DbConnection();

        List<Location> locationList = dbobject.viewAllLocations();
        List<Location> locationList1 = dbobject1.viewAllLocations();

        request.setAttribute("locationList", locationList);
        request.setAttribute("locationList1", locationList1);
        
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");

        rd.forward(request, response);
    }
    public void goToMapPage(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException{
        
        try{
           
            DbConnection dbobject = new DbConnection();
            DbConnection dbobject1 = new DbConnection();
            
            List<Location> locationList = dbobject.viewAllLocations();
            List<Location> locationList1 = dbobject1.viewAllLocations();
            
            request.setAttribute("locationList", locationList);
            request.setAttribute("locationList1", locationList1);
            
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/map.jsp");

            rd.forward(request, response);
            
        } catch (ServletException | IOException error) {
            error.printStackTrace();
            
        
    }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String admin_action = request.getParameter("admin_action");

            if (admin_action != null) {

                switch (admin_action) {
                    case "register_location":
                        registerLocation(request,response);
                        break;
                        
                    case "view_all_customer":
                    viewAllLocation(request,response);
                    break;
                        
                   case "go_to_map_page":
                    goToMapPage(request,response);
                    break;
                }

            }    
        } catch (Exception  error) {

            error.printStackTrace();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
