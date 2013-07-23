// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery_nested_form
//= require jquery.currency.min
//= require_tree .

function codeAddress(address) {
  geocoder = new google.maps.Geocoder();
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
        marker.setPosition(results[0].geometry.location);
	$('#client_latitude').val(results[0].geometry.location.lat());
	$('#client_longitude').val(results[0].geometry.location.lng());
	google.maps.event.trigger(map, "resize");
      }
	//else {
       // alert("Geocode was not successful for the following reason: " + status);
     // }
    });
  }

function getAddress(){
  codeAddress($('#client_street').val()+", "+$('#client_district').val()+", Zapopan, Jalisco");
}


function updateMarkerPosition(latLng) {
  $('#client_longitude').val(latLng.lat());
  $('#client_latitude').val(latLng.lng());
}

