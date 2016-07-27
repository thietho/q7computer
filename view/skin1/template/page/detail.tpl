<div class="fix960">
	<div class="site_content_left">
    	<?php if(@count($leftsitebar)){ ?>
        	<?php foreach($leftsitebar as $item){ ?>
        	<?php echo @$item?>
           	<?php } ?>
        <?php } ?>
     <div class="clear" style="height:10px;"></div>
                                  </div>          
<div class="site_content_center" >

 

	<div class="head_title_center_home"><?php echo @$breadcrumb?></div>
    <?php echo @$module?>
    <div class="clear" style="height:8px;"></div>
</div>
  <div class="site_content_right" >

    
    <?php if(@count($rightsitebar)){ ?>
    
        <?php foreach($rightsitebar as $item){ ?>
        <?php echo @$item?>
        <?php } ?>
    
    <?php } ?>
    <div class="clear" style="height:10px;"></div>
                
  </div>          <div class="clear"></div>
</div>
<div class="clear"></div>
<div class="clear" style="height:8px; clear:left;"></div>
