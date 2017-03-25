function initMap() {
  var  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 13,
    center: {lat: 37.775, lng: -122.434},
    mapTypeId: 'satellite'
  });
  
  map.addListener("center_changed", function (data) {
    console.log(map.center.lat());
    console.log(map.center.lng());
  })
  
  $.get("/api/v1/maps", function (data) {
    console.log(data);
    var heatPoints = data.map( function (point) {
      return new google.maps.LatLng(point[0], point[1]);
    })
    
    var heatmap = new google.maps.visualization.HeatmapLayer({
      data: heatPoints,
      map: map
    });
  });
}
