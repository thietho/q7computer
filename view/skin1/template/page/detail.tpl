<div class="ben-three-columns">
	<?php if(@count($leftsitebar)){ ?>
	<div class="ben-sidebar ben-left">
    	<?php foreach($leftsitebar as $item){ ?>
        <?php echo @$item?>
        <?php } ?>
    </div>
    <?php }?>
	<div class="ben-right" id="ben-maincontent">
    	<div class="ben-section">
        
        	<?php echo @$brand?>
            
            <div class="ben-section-content">
            	<h1><?php echo @$this->document->breadcrumb?></h1>
            	<?php echo @$module?>
            
            </div>
            
        
        </div>
    </div>
    
    <?php if(@count($rightsitebar)){ ?>
    <div class="ben-sidebar ben-right">
    	<?php foreach($rightsitebar as $item){ ?>
        <?php echo @$item?>
        <?php } ?>
    </div>
    <?php } ?>
    
    <div class="clearer">&nbsp;</div>

</div>
