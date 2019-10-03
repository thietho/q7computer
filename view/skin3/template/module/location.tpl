<div id="desscription" style="display:none">
	<strong><?php echo @$item['title']?></strong><br><?php echo html_entity_decode($item['description'])?>
</div>

<script type="text/javascript">

var pos = 0;
var flagedit=false;
var x = parseFloat("<?php echo @$location['x']?>");
var y = parseFloat("<?php echo @$location['y']?>");
var zoom = parseInt("<?php echo @$location['zoom']?>");
	


function initMap() {
	var map = new google.maps.Map(document.getElementById('map'), {
	  zoom: zoom,
	  center: {lat: x, lng: y}
	});
	var infowindow = new google.maps.InfoWindow({
          content: $('#desscription').html()
        });
	marker = new google.maps.Marker({
	  map: map,
	  draggable: false,
	  animation: google.maps.Animation.DROP,
	  position: {lat: x, lng: y}
	});
	marker.addListener('click', function() {
          infowindow.open(map, marker);
        });
	
	
	
}

function toggleBounce() {
	
	if (marker.getAnimation() !== null) {
	  marker.setAnimation(null);
	} else {
	  marker.setAnimation(google.maps.Animation.BOUNCE);
	}
}
</script>
<div id="map" style="width: 100%; height: 600px;"></div>

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCibpjemwZxmni5m0bFk_ceXWSyCF7iq8Q&callback=initMap" type="text/javascript"></script>
 