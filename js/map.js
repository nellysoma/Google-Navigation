window.onload = function (){
    
    var mapDiv = document.getElementById('map');
    
    var latlng = new google.maps.LatLng(4.8867490,6.9244340);
    
    var options = {
        
        center: {lat: -34.397, lng: 150.644},
        
        zoom: 4,

        mapTypeId: new google.maps.MapTypeId.ROADMAP
        
    };
    
    var map = new google.maps.Map(mapDiv, options);
}