<%-- 
    Document   : admin
    Created on : Dec 5, 2015, 6:56:59 PM
    Author     : harmony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin Page</title>
        
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" media="all">
        
        <!-- Bootstrap core JAVASCRIPT -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        
    </head>
    <body style="padding-top: 50px;">
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">University of Port Harcourt Campus Navigation</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>
        
        
        
        <div class="container">
            
            <div class="row"> 
                <center><img src="images/uniport.jpg" width="114" height="125" alt="uniport"/></center>  
            </div>
            
            <div class="row">
                
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <center><p><strong><h4>University of Port Harcourt</h4></strong></p></center>
                    <center><p><strong><h4>Campus Gallery with Navigation Features</h4></strong></p></center>
                </div>
                <div class="col-md-4"></div>
                
            </div>
            
            <div class="row" style="padding-top: 10px;">
                
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <h4><strong>Add New Location</strong></h4>    
                </div>
                <div class="col-md-4"></div>
                
            </div>
            
            <div class="row" style="padding-top: 10px;">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    
                    <form role="form" method="post" action="/photogallery/Administrator?admin_action=register_location" enctype="multipart/form-data">
                        <div class="row">
                            
                            <div class="col-md-4">
                            <label  for="name_of_location">Name Of Location</label>
                            </div>
                            
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="name_of_location">
                            </div>
                            
                        </div>
                        <br />
                        <div class="row">
                            
                            <div class="col-md-4">
                            <label  for="latitude">Latitude</label>
                            </div>
                            
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="latitude">
                            </div>
                        </div>
                         <br />
                         <div class="row">
                            
                            <div class="col-md-4">
                            <label  for="longitude">Longitude</label>
                            </div>
                            
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="longitude">
                            </div>
                         </div>
                         <br />
                         <div class="row">
                            
                            <div class="col-md-4">
                            <label  for="city">City</label>
                            </div>
                            
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="city" value="Port Harcourt" readonly>
                            </div>
                         </div>
                         <br />
                         <div class="row">
                            
                            <div class="col-md-4">
                            <label  for="state">State</label>
                            </div>
                            
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="state" value="Rivers" readonly>
                            </div>
                         </div>
                         <br />
                         <div class="row">
                            
                            <div class="col-md-4">
                            <label  for="country">Country</label>
                            </div>
                            
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="country" value="Nigeria" readonly>
                            </div>
                         </div>
                         <br />
                         
                         <div class="row">
                            
                            <div class="col-md-4">
                            <label  for="photo">Image</label>
                            </div>
                            
                            <div class="col-md-4">
                                <input type="file" class="form-control" name="photo">
                            </div>
                         </div>
                         <br />
                          
                        <div class="row">
                            
                            <div class="col-md-2"></div>
                            
                            <div class="col-md-4">
                                <button class="btn btn-primary">Add Location</button>
                            </div>
                            
                            <div class="col-md-2"></div>
                         </div>
                         
                        </div>
                    </form>
                    
                </div>
                <div class="col-md-2"></div>
            </div>
        </div>
        
    </body>
</html>
