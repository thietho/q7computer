<div>
	
	<div id="ben-maincontent">
    	<div class="ben-section">
        
        	
            
            <div class="ben-section-content">
            	
            	
                <?php foreach($producthome as $key => $item){ ?>
                <?php if(@$item['data']){ ?>
                <h1><?php echo @$item['title']?></h1>
            	<?php echo @$item['data']?>
                <?php } ?>
                <?php } ?>
            </div>
            
            
        	
        </div>
    </div>
    
    <div class="clearer">&nbsp;</div>

</div>
<script language="javascript">
function LoadPage()
{
	this.arr = new Array();
	this.index = 0;
	this.flag = true;
}
var pageload = new LoadPage();
</script>
<?php foreach($arrsitemapid as $key => $sitemapid){?>
<script language="javascript">
pageload.arr.push("<?php echo @$sitemapid?>");
</script>
<?php }?>
<script language="javascript">
function loadGroup()
{
	if(pageload.flag == true)
	{
		$('#ben-maincontent .ben-section-content').append(loading);
		$.get("?route=page/home/loadGroup&device=mobile&sitemapid="+ pageload.arr[pageload.index],function(html){
				
				$('#loading').remove();
				$('#ben-maincontent .ben-section-content').append(html);
				//stickytooltip.init("*[data-tooltip]", "mystickytooltip")
				pageload.index++;
				if(pageload.index >= pageload.arr.length)
				{
					$('#btn-XemTiep').remove();
					
				}
				pageload.flag = true;
				//console.log("aa"+pageload.flag);
				
			});
	}
	pageload.flag = false;
}

$(document).scroll(function(e) {
	if($(document).scrollTop() + window.innerHeight > $('#ben-maincontent .ben-section-content').innerHeight())
	{
		
		loadGroup();
		
		
	}
});
</script>