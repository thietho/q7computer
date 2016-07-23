<?php if(@count($medias)){ ?>
<div class="boxstyle_center_home" style="height:280px; overflow:hidden; padding-top:7px;">
	<div class='clus'>           
      <div class="bxslider">
      		<?php foreach($medias as $key => $media) {?>
      		<div>
            	
            	<a href='slider<?php echo $key+1?>'><img src="<?php echo @$media['imagethumbnail']?>" title="<?php echo @$media['title']?>" alt="<?php echo @$media['title']?>" border='0'></a></div>
                <?php } ?>
            
      </div> 
    </div>     
</div>
<?php }?>
