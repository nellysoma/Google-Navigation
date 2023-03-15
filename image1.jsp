<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<html>
    <head>
        <title>View Image</title

        <%@include  file="header.jsp"%>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" media="all">

        <link rel="stylesheet" type="text/css" href="css/map_style.css">

        <link href="css/sticky-footer.css" rel="stylesheet">
    </head>

    <body>
<%
    String id = (String)request.getAttribute("id");
    String destination = (String)request.getAttribute("destination");
%>
        <div class="container">

            <div class="row">
                <div class="col-md-4" id="map"></div>
                <div class="col-md-4">
                    
                    
                    <img src="/photogallery/image.jsp?destination=<%=destination%>" class="img-circle" width="125" height="125">
                </div>
                <div class="col-md-4">
                    <div id="directionsPanel"></div>
                </div>
            </div>
</div>
                
                <script type="text/javascript">

            function initMap() {
                var directionsService = new google.maps.DirectionsService;
                var directionsDisplay = new google.maps.DirectionsRenderer;
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 7,
                    center: {lat: 4.902685, lng: 6.920550}
                });
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
                            <div class="col-md-4">
                                <h4>CONTACT</h4>
                                <ul>
                                    <li><strong>Phone Number:</strong> 08036716590</li>
                                    <li><strong>Email:</strong> emmanuelnzekwe24@gmail.com</li>
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
        
    </body>

</html>






