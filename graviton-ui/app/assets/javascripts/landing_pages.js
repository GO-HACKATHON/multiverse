
window.gMap = null;
$(document).ready(function () {
  

  
  $("#cancelationMapTimeRange").on("change", function (e) {
    var data = $("#cancelationMapTimeRange option:selected").val();
    renderMap(data);
  });
  
});

function renderMap(timeRange = 0) {
  window.gMap = new google.maps.Map(document.getElementById('map'), {
    zoom: 14,
    center: {lat: -6.27651914761269, lng: 106.7233956751221},
    mapTypeId: 'roadmap'
  });

  window.gMap.addListener("center_changed", function (data) {
    console.log(map.center.lat());
    console.log(map.center.lng());
    console.log(map.zoom);
  });
  
  $.get("/api/v1/maps?time_range="+timeRange, function (data) {
    var heatPoints = data.map( function (point) {
      return new google.maps.LatLng(point[0], point[1])
      // return {
      //   location: new google.maps.LatLng(point[0], point[1]),
      //   weight: point[2]
      // }
    });
    
    var heatmap = new google.maps.visualization.HeatmapLayer({
      data: heatPoints,
      map: window.gMap
    });
  });
  

  
}
