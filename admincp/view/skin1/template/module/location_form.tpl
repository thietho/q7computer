
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
	
	marker = new google.maps.Marker({
	  map: map,
	  draggable: true,
	  animation: google.maps.Animation.DROP,
	  position: {lat: x, lng: y}
	});
	//marker.addListener('click', toggleBounce);
	
	map.addListener('zoom_changed', function() {
		$('#zoom').val(map.getZoom());
	  
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
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDREKHzZPitTnAFDGz-Rpfj1wYP75-KOLU&callback=initMap">
    </script>
<div class="section" id="sitemaplist">

	<div class="section-title">Location</div>
    
    <div class="section-content padding1">
    
    	<form name="frm" id="frm" action="<?php echo @$action?>" method="post" enctype="multipart/form-data">
        
        	<div class="button right">
            	<input type="button" value="<?php echo @$button_save ?>" class="button" onClick="save()"/>
     	        <input type="button" value="<?php echo @$button_cancel ?>" class="button" onclick="linkto('?route=module/link&sitemapid=<?php echo @$sitemap['sitemapid']?>')"/>   
     	        <input type="hidden" name="mediaid" value="<?php echo @$item['mediaid']?>">
                <input type="hidden" id="status" name="status" value="<?php echo @$item['status']?>" />
             	<input type="hidden" id="mediatype" name="mediatype" value="<?php echo @$item['mediatype']?>" />
             	<input type="hidden" id="refersitemap" name="refersitemap" value="<?php echo @$item['refersitemap']?>" />
            </div>
            <div class="clearer">^&nbsp;</div>
        	<div id="error" class="error" style="display:none"></div>
        	<div>        
                <p>
            		<label>Tiêu đề</label><br />
					<input type="text" name="title" value="<?php echo @$item['title']?>" class="text" size=60 />
            	</p>
                <p>
                    <label>Mô tả</label><br>
                    <textarea name="description" id="editor1" cols="80" rows="10"><?php echo @$item['description']?></textarea>
                </p>
               	<p>
                    <label>Map</label><br />
                    <input id="address" type="textbox" value="" class="text" size=60>
                    <input type="button" value="Tìm vị trí" onclick="codeAddress($('#address').val())">
                    <!--<input type="button" id="btnEditPath" value="Vẽ biên giới" onclick="editPathEnable()">-->
                    <div id="map" style="width: 500px; height: 500px;"></div>
                    <!--<em>Click chuột phải vào điểm cần xóa trên bản đồ để xóa</em>-->
                </p>
                    
                <p>
                    <label>Point</label>
                    X:<input type="text" name="x" value="<?php echo @$location['x']?>"  class="text"/> Y:<input type="text" name="y" value="<?php echo @$location['y']?>"  class="text" onchange="loadPosition()"/>
                    <input type="hidden" name="pointid" value="<?php echo @$location['pointid']?>" onchange="loadPosition()"/>
                    
                    <input type="hidden" name="position" value="<?php echo @$location['position']?>"  />
                    <div id="listpath">
                    </div>
                </p>
                <p>
                    <label>Zoom</label><br />
                    <input type="text" id="zoom" name="zoom" value="<?php echo @$location['zoom']?>" class="text" size=60 readonly/>
                </p> 
            </div>
            
        </form>
    
    </div>
    
</div>
<script type="text/javascript" charset="utf-8">
var DIR_UPLOADPHOTO = "<?php echo @$DIR_UPLOADPHOTO?>";
var DIR_UPLOADATTACHMENT = "<?php echo @$DIR_UPLOADATTACHMENT?>";
$(document).ready(function() { 
	setCKEditorType('editor1',0);
	
	
	
});
</script>
<script language="javascript">
function save()
{
	$.blockUI({ message: "<h1><?php echo @$announ_infor ?></h1>" }); 
	var oEditor = CKEDITOR.instances['editor1'] ;
	var pageValue = oEditor.getData();
	$('textarea#editor1').val(pageValue);
	$.post("?route=module/location/save", $("#frm").serialize(),
		function(data){
			if(data == "true")
			{
				$.unblockUI();
			}
			
			
		}
	);
}


	//initialize(x,y,zoom);
	//codeLatLng() 
	//map.setZoom(1)
	//drawpath();
</script>
