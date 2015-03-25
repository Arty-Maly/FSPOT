$(document).ready(function(){
      //slick initialization
      $('.lazy').slick({
            lazyLoad: 'ondemand',
            slidesToShow: 1,
            slidesToScroll: 1
      });


    navigator.geolocation.getCurrentPosition(show);


    function show(position){
        var geoLat = document.getElementById("geolat");
    		var geoLng = document.getElementById("geolng");
    		var lat = position.coords.latitude;
    		var lng = position.coords.longitude;
    		geoLat.innerHTML = "Latitude:" + lat;
    		geoLng.innerHTML = "Longitude" + lng;	
     }

});