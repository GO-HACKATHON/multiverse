
window.gMap = null;
$(document).ready(function () {
  

  
  $("#cancelationMapTimeRange").on("change", function (e) {
    var timeRange = $("#cancelationMapTimeRange option:selected").val();
    var eventName = $("#eventName option:selected").val();
    renderMap(timeRange, eventName);
  });
  
  $("#eventName").on("change", function (e) {
    var timeRange = $("#cancelationMapTimeRange option:selected").val();
    var eventName = $("#eventName option:selected").val();
    renderMap(timeRange, eventName);
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
