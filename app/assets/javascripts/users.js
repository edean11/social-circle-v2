
function initialize() {
  if(!($('#map').length)){return}

  //main map
  var mapOptions = {
    center: { lat: -34.397, lng: 150.644},
    zoom: 8,
    disableDefaultUI: true
  };
  var map = new google.maps.Map(document.getElementById('map'),
      mapOptions);
}
google.maps.event.addDomListener(window, 'load', initialize);