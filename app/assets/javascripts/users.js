Array.prototype.clean = function(deleteValue) {
  for (var i = 0; i < this.length; i++) {
    if (this[i] == deleteValue) {
      this.splice(i, 1);
      i--;
    }
  }
  return this;
};


function initializeUserMap() {

  if(!($('#placeUserLocMap').length)){return}

  var markers = [];

  //set hidden field values for rails
  function setLatLngUser(position){
    $('#user_home_lat').val(position.A);
    $('#user_home_lon').val(position.F);
  }

  //place cast map
  var placeUserMapOptions = {
    center: { lat: 36.16182004637161, lng: -86.78950309753418},
    zoom: 2,
    disableDefaultUI: true
  };
  function placeUserMarker(position, map, zoom_in) {
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
    map.setCenter(position);
    if(zoom_in){
      map.setZoom(10);
    }
    setLatLngUser(position);
  }
  var placeUserMap = new google.maps.Map(document.getElementById('placeUserLocMap'),
      placeUserMapOptions);

  function getLocationUser() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(showPositionUser);
    } else {
      alert("Geolocation is not supported by this browser.");
    }
  }

  function showPositionUser(position) {
    var lat = position.coords.latitude;
    var lng = position.coords.longitude;
    var pos = new google.maps.LatLng(lat, lng);
    placeUserMarker(pos,placeUserMap, true);
    //placeUserMap.setCenter(new google.maps.LatLng(lat, lng));
  }

  $('#setCurrentLocationUser').click(function(){
    getLocationUser();
  })

  google.maps.event.addListener(placeUserMap, 'click', function(e) {
    placeUserMarker(e.latLng, placeUserMap, false);
  });
}

google.maps.event.addDomListener(window, 'load', initializeUserMap);
//initialize();