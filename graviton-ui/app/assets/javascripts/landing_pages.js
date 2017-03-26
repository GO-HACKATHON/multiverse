
window.gMap = null;
$(document).ready(function () {
  

  
  $("#cancelationMapTimeRange").on("change", function (e) {
    var data = $("#cancelationMapTimeRange option:selected").val();
    renderMap(data);
  });
  
  $("#eventName").on("change", function (e) {
    var data = $("#eventName option:selected").val();
    renderMap(data);
  });
  
});

function renderMap(timeRange = "minutly", eventName = "order.canceled") {
  window.gMap = new google.maps.Map(document.getElementById('map'), {
    zoom: 14,
    center: {lat: -6.27651914761269, lng: 106.7233956751221},
    mapTypeId: 'roadmap'
  });
  
  $.get("/api/v1/maps?time_range="+timeRange+"&event_name="+eventName, function (data) {
    var heatPoints = data.map( function (point) {
      return new google.maps.LatLng(point.coordinates[0], point.coordinates[1])
    });
    
    var heatmap = new google.maps.visualization.HeatmapLayer({
      data: heatPoints,
      map: window.gMap
    });
  });
}
