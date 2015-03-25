
function findLocation() {
  navigator.geolocation.getCurrentPosition(showMap);
}

function showMap(position) { 
var mapCanvas = document.getElementById('map-canvas');
//var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
var latlng = new google.maps.LatLng(42.3654347, -71.258595);
var mapOptions = {
  center: latlng,
  zoom: 14,
  mapTypeId: google.maps.MapTypeId.ROADMAP
}
var map = new google.maps.Map(mapCanvas, mapOptions)
var marker = new google.maps.Marker({
  position: latlng,
  title: "your position"
});
marker.setMap(map);
}

function findAddress(){
var address = document.getElementById('address').value;  
var latlng = new google.maps.LatLng(42.36, -71.25);
var mapOptions = {
  zoom: 14,
  center: latlng
}
map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
geocoder = new google.maps.Geocoder();  
geocoder.geocode({'address':address},function(results, status){
    map.setCenter(results[0].geometry.location);
    var marker = new google.maps.Marker({
      map: map,
      position: results[0].geometry.location
    });
});
}

google.maps.event.addDomListener(window, 'load', showMap);
