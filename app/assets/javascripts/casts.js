
function initialize() {

  if(!($('#placeCastMap').length)){return}

  var markers = [];

  //create jquery-ui datetime picker
  $('.datetimePicker').datetimepicker({
    // inline:true
  });

  //set hidden field values for rails
  function setLatLng(position){
    $('#cast_lat').val(position.A);
    $('#cast_lon').val(position.F);
  }

  //place cast map
  var placeMapOptions = {
    center: { lat: -34.397, lng: 150.644},
    zoom: 10,
    disableDefaultUI: true
  };
  function placeMarker(position, map) {
    $('#setChosenLocation').removeClass('hidden');
    if(markers.length>0){
      for(i=0;i<markers.length;i++){
        markers[i].setMap(null);
        markers[i] = null;
        markers = [];
      }
    }
    var marker = new google.maps.Marker({
      position: position,
      map: map,
      animation: google.maps.Animation.DROP
    });
    markers.push(marker);
    map.panTo(position);
    setLatLng(position);
  }
  var placeMap = new google.maps.Map(document.getElementById('placeCastMap'),
      placeMapOptions);

  function getLocation() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(showPosition);
    } else {
      alert("Geolocation is not supported by this browser.");
    }
  }

  function showPosition(position) {
    var lat = position.coords.latitude;
    var lng = position.coords.longitude;
    var pos = new google.maps.LatLng(lat, lng);
    placeMarker(pos,placeMap);
    map.setCenter(new google.maps.LatLng(lat, lng));
  }

  $('#setCurrentLocation').click(function(){
    getLocation();
  })

  google.maps.event.addListener(placeMap, 'click', function(e) {
    placeMarker(e.latLng, placeMap);
  });
}

google.maps.event.addDomListener(window, 'load', initialize);
//initialize();
