<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%@page import = "model.Location"%>
<%@page import = "java.util.List" %>
<%@page import = "java.util.*" %>
<%@ page import="java.sql.*,java.io.*,java.util.*" %> 

<html>
    <head>
        <title>Ignatius Campus Navigation</title

        <%@include  file="header.jsp"%>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" media="all">
        <link rel="stylesheet" type="text/css" href="css/map_style.css">

        <link href="css/sticky-footer.css" rel="stylesheet">

    </head>

    <%!
        String id = "";
    %>
    <%
        List<Location> locationList = (List<Location>) request.getAttribute("locationList");
        Iterator<Location> iterator1 = locationList.iterator();

        List<Location> locationList1 = (List<Location>) request.getAttribute("locationList1");
        Iterator<Location> iterator2 = locationList1.iterator();
        Iterator<Location> iterator3 = locationList1.iterator();

        Location location1 = null;

    %>

    <body>
        <div class="container">

            <div class="row">
                
                

                <div class="col-md-4" id="map1">
                    <h1>University of Port Harcourt Campus Navigation</h1>
                    <p>This Application helps first time visitors to the University of Port Harcourt</p>
                    <p>to know their way around the campus by providing pictures of major faculty buildings</p>
                    <p>and navigation features</p>
                </div>

                <div class="col-md-4">
                    <div class="row">

                        <form role="form" method="post" action="image.jsp">
                            <div class="form-group">
                                <label for="current_location">Current Location</label> 
                                <select class="form-control" name="current_location" id="start" onchange="calculateAndDisplayRoute();">
                                    <%                                    while (iterator1.hasNext()) {
                                        Location location = (Location) iterator1.next();%>
                                    <option value="<%=location.getLatitude()%>,<%=location.getLongitude()%>"><%=location.getNameOfLocaton()%></option>
                                    <%}%>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="destination">Desired Location</label> 
                                <select class="form-control" name="destination" id="end" onchange="calculateAndDisplayRoute();">
                                    <%
                                    while (iterator2.hasNext()) {
                                        location1 = (Location) iterator2.next();%>
                                    <option value="<%=location1.getLatitude()%>,<%=location1.getLongitude()%>"><%=location1.getNameOfLocaton()%></option>
                                    <%

                                            id = location1.getLocationId();
                                    }%> 
                                </select>
                                <input type="hidden" name="imgid" value="<%=location1.getLatitude()%>,<%=location1.getLongitude()%>">


                            </div>

                                <!--<a href="#view_map" data-toggle="modal">--><button class="btn btn-primary" type="submit">View Destination Image</button>

                        </form>
                                
                                <div id="directionsPanel"></div>

                    </div>


                </div>


                <div class="col-md-4">
                    <ul class="nav nav-pills nav-stacked"> 
                        <li><a href="https://www.uniport.edu.ng" target="_blank">School Website</a></li> 
                        <li><a href="https://www.google.com.ng/maps/place/Federal+University/@4.7979882,6.3211995,10z/data=!4m5!3m4!1s0x0:0x64337c05c2c6c664!8m2!3d4.7979882!4d6.3211995" target="_blank">Google Map</a></li> 
                    </ul>
                    <!--<img src="image.jsp?destination=<%=location1.getLatitude()%>,<%=location1.getLongitude()%>" height="500px">-->   
                     <div  id="map"></div>
                </div>           

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
                            <p class="text-muted">&COPY; 2023 University of Port Harcourt.</p>
                        </div>

                    </div>
                </div>
            </div>
        </footer>
<!-- Add Event Modal --> 
     <div class="modal fade" id="view_map" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
    <div class="modal-dialog"> 
        <form method="post"  action="image1.jsp" role="form">
        <div class="modal-content"> 
            <div class="modal-header"> 
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button> 
                <h4 class="modal-title" id="myModalLabel">View Map</h4> 
            </div> 
            <div class="modal-body"> 
                    <div  id="map"></div>
            </div> 
            <div class="modal-footer"> 
                <button type="button" class="btn btn-default" data-dismiss="modal">Close </button> 
                <input type="submit" class="btn btn-primary" value="Add">
                
            </div> </div></form><!-- /.modal-content --> 
    </div>
     </div><!-- /.modal -->
     <script type="text/javascript">

            function initMap() {
                var directionsService = new google.maps.DirectionsService;
                var directionsDisplay = new google.maps.DirectionsRenderer;
                
                // The location of uniport
                //var uniport = {lat: 4.89983, lng: 6.925303333};
                var ignatius = {lat: 4.8045, lng: 6.9324};
                
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 15,
                    center: ignatius
                });
                // The marker, positioned at uniport
                 var marker = new google.maps.Marker({position: ignatius, map: map})
                
                 directionsDisplay.setMap(map);
                 directionsDisplay.setPanel(document.getElementById('directionsPanel'));


                var onChangeHandler = function () {
                    calculateAndDisplayRoute(directionsService, directionsDisplay);
                };
                document.getElementById('start').addEventListener('change', onChangeHandler);
                document.getElementById('end').addEventListener('change', onChangeHandler);
            }

            function calculateAndDisplayRoute(directionsService, directionsDisplay) {
                directionsService.route({
                    origin: document.getElementById('start').value,
                    destination: document.getElementById('end').value,
                    travelMode: google.maps.TravelMode.WALKING
                }, function (response, status) {
                    if (status === google.maps.DirectionsStatus.OK) {
                        directionsDisplay.setDirections(response);
                    } else {
                        window.alert('Directions request failed due to ' + status);
                    }
                });
            }






            //google.maps.event.addDomListener(window, 'load', initialize);

        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPvzZ3lzSEUrweC-39a0bIcrV9i3-IBPM&callback=initMap">
        </script>
     <script type="text/javascript" src="js/jquery-ui-min.js"></script> 
    </body>
</html>
