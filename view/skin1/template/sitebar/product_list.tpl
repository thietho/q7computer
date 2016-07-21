<?php
if(@count($medias))
{
?>
    <?php foreach($medias as $media) {?>
    	<li>
        	<table>
            	<tr>
                	<td width="70px"><center><a href="<?php echo @$media['link']?>" class="link_hover" data-tooltip="sticky1" ref="<?php echo @$media['imagetpreview']?>" title="<?php echo @$this->document->productName($media)?>"><img src='<?php echo @$media['imagethumbnail']?>' class="ben-center" alt="<?php echo @$this->document->productName($media)?>" title="<?php echo @$this->document->productName($media)?>"/></a></center></td>
                    <td>
                    	<a href="<?php echo @$media['link']?>" title="<?php echo @$this->document->productName($media)?>"><?php echo @$this->document->productName($media)?></a><br>
                        <?php echo @$this->string->numberFormate($media['price'])?> <?php echo @$this->document->setup['Currency']?>
                    </td>
                </tr>
            </table>
            
            
        </li>
    <?php } ?>
<?php } ?>