<%-- 
    Document   : index
    Created on : Jun 30, 2015, 11:59:46 AM
    Author     : harmony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
        <title>index Page</title>
        <!-- Custom styles for this template -->
    <link href="css/sticky-footer.css" rel="stylesheet">
      <%
    response.sendRedirect("/photogallery/Administrator?admin_action=go_to_map_page");
%> 
    </head>
    <body>
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">FUTO Campus Navigation</a>
            </div>
        </nav>
        
        <div class="container"> 
            <div class="jumbotron"> 
                <h1>FUTO Campus Navigation</h1>
                <p>This Application helps first time visitors to the Federal University of Technology Owerri</p>
                <p>to know their way around the campus by providing pictures of major school buildings</p>
                <p>and navigation features</p>
                <p><a class="btn btn-primary btn-lg" role="button"  href="/photogallery/Administrator?admin_action=go_to_map_page">Proceed>></a> </p> 
            </div> 
        
        </div>
        <footer class="footer">
                <div class="containerf">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-4">
                                <h4>SERVICES</h4>
                                <ul>
                                    <li>Enter Location</li>
                                    <li>Search Location</li>
                                    <li>View Map</li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <h4>ABOUT</h4>
                                <ul>
                                    <li>Aim</li>
                                    <li>Objectives</li>
                                </ul>
                            </div>
                            
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-4"></div>
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <p class="text-muted">&COPY; 2019 Federal University of Technology Owerri.</p>
                            </div>
                    
                    </div>
                    </div>
                </div>
        </footer>
    </body>
</html>
