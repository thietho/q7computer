<?php
if(@count($medias))
{
?>
<div class="boxstyle">
	<?php foreach($medias as $media){ ?> 
    <div style='border-bottom:1px dotted #CCCCCC; margin:10px;' align='center'>
        <a href="<?php echo @$media['link']?>"><img alt='<?php echo @$this->document->productName($media)?>' src="<?php echo $media['imagethumbnail']?>" width='120' height='auto' class='img_3'></a>
        <strong><a href="<?php echo @$media['link']?>"><div class='clear do_nho'><?php echo @$this->string->numberFormate($media['price'])?> <?php echo @$this->document->setup['Currency']?></div><div class='clear'></div><?php echo @$this->document->productName($media)?></a></strong>
    </div>
	<?php } ?>
	<div class="clear" style="height:1px;"></div>
</div>
<?php } ?>
<div class="clear" style="height:10px;"></div>