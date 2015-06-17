
function initialize() {

  if(!($('#placeCastMap').length)){return}

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
    var marker = new google.maps.Marker({
      position: position,
      map: map,
      draggable: true
    });
    map.panTo(position);
    setLatLng(position);
  }
  var placeMap = new google.maps.Map(document.getElementById('placeCastMap'),
      placeMapOptions);

  google.maps.event.addListener(placeMap, 'click', function(e) {
    placeMarker(e.latLng, placeMap);
  });
}

google.maps.event.addDomListener(window, 'load', initialize);