<div class="section" id="sitemaplist">

	<div class="section-title">Link</div>
    
    <div class="section-content padding1">
    
    	<form name="frm" id="frm" action="<?php echo @$action?>" method="post" enctype="multipart/form-data">
        
        	<div class="button right">
            	<input type="button" value="<?php echo @$button_save ?>" class="button" onClick="save()"/>
     	        <input type="button" value="<?php echo @$button_cancel ?>" class="button" onclick="linkto('?route=module/link&sitemapid=<?php echo @$sitemap['sitemapid']?>')"/>   
     	        <input type="hidden" name="mediaid" value="<?php echo @$item['mediaid']?>">
                <input type="hidden" id="status" name="status" value="<?php echo @$item['status']?>" />
             	<input type="hidden" id="mediatype" name="mediatype" value="module/link" />
             	<input type="hidden" id="refersitemap" name="refersitemap" value="<?php echo @$item['refersitemap']?>" />
                
                <input type="hidden" id="handler" />
             	<input type="hidden" id="outputtype" />
                <input type="hidden" id="listselectfile" name="listselectfile" />
            </div>
            <div class="clearer">^&nbsp;</div>
        	<div id="error" class="error" style="display:none"></div>
        	<div>        
                <p>
            		<label><?php echo @$text_title?></label><br />
					<input type="text" name="title" value="<?php echo @$item['title']?>" class="text" size=60 />
            	</p>
               	<p>
                    <label>Link</label><br />
                    <textarea name="Link"><?php echo @$item['Link']?></textarea>
                </p>
                
                <p id="pnImage">
                    <label for="image"><?php echo @$entry_image?></label><br />
                    
                    <input type="button" class="button" value="<?php echo @$entry_photo ?>" onclick="browserFile('imageid','single')"/><br />
                    <img id="imageid_preview" src="<?php echo @$imagethumbnail?>" onclick="showFile($('#imageid_filepath').val())"/>
                    <input type="hidden" id="imageid_filepath" name="imagepath" value="<?php echo @$post['imagepath']?>" />
                    <input type="hidden" id="imageid_fileid" name="imageid" value="<?php echo @$post['imageid']?>" />
                    
                </p>
                
                <div id="errorupload" class="error" style="display:none"></div>
                
                <div class="loadingimage" style="display:none"></div>
            </div>
            
        </form>
    
    </div>
    
</div>

<script language="javascript">

function save()
{
	$.blockUI({ message: "<h1><?php echo @$announ_infor ?></h1>" }); 
	
	$.post("?route=module/link/save", $("#frm").serialize(),
		function(data){
			if(data == "true")
			{
				<?php if(@$sitemap['sitemapid']){ ?>
				window.location = "?route=module/link&sitemapid=<?php echo @$sitemap['sitemapid']?>";
				<?php }else{ ?>
				window.location = "?route=core/media";
				<?php } ?>
			}
			else
			{
			
				$('#error').html(data).show('slow');
				$.unblockUI();
				
			}
			
		}
	);
}
</script>