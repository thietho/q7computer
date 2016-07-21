
<?php
if(@count($medias))
{
?>
<div id="listpoduct">
	<?php foreach($medias as $media) {?>
    <div id="pro-<?php echo @$media['mediaid']?>" class="ben-left product link_hover" title="<?php echo @$this->document->productName($media)?>">
        <table>
            <tr class="product-list-image">
                <td>
                	
                	<?php if(@$media['discountpercent']){ ?>
                	<div class="flagdiscount ben-icon">-<?php echo @$this->string->numberFormate($media['discountpercent'])?>%</div>
                    <?php } ?>
                	
                    <?php if(@$media['imagethumbnail'] !=""){ ?>
                    <a class="islink" href="<?php echo @$media['link']?>" title="<?php echo @$this->document->productName($media)?>"><img data-src='<?php echo @$media['imagethumbnail']?>' class='ben-center lazy' title="<?php echo @$this->document->productName($media)?>"/></a>
                    
                    <?php }?>
                    	
                </td>
            </tr>
            <tr>
                <td>
                    <div align="center">
                    	<a href="<?php echo @$media['link']?>" title="<?php echo @$this->document->productName($media)?>">
                        	<h6>
                            	<?php if(@count($media['childs'])){ ?>
                            	<?php echo @$media['title']?> - <?php echo @$media['code']?>
                                <?php echo @$this->document->getCategory($media['brand'])?>
                                <?php echo @$media['color']?>
                                <?php }else{ ?>
                                <?php echo @$this->document->productName($media)?>
                                <?php } ?>
                            </h6>
                            
                            
                        </a>
                        <?php if(@count($media['childs']) && $media['displaytype']==''){ ?>
                        <?php foreach($media['childs'] as $me){?>
                        <div>
                        	<?php echo @$me['sizes']?>
                            <?php 
                            if(@$me['color'])
								echo " ".$me['color'];
                            ?>:
                            <?php $cls = '';?>
                            <?php if(@$me['pricepromotion']) $cls = 'product-price-no'; else $cls = 'product-pricepromotion'?>
                           
                            
                            <span class="<?php echo @$cls?>" >
                            	<?php if(@$me['price']){?>
                            	<?php echo @$this->string->numberFormate($me['price'])?><?php echo @$this->document->setup['Currency']?>
                                <?php }else{ ?>
                                Giá đang cập nhật
                                <?php } ?>
                            </span>
                            <?php if(@$me['pricepromotion']){ ?>
                            <span class="product-pricepromotion">
                        	<?php echo @$this->string->numberFormate($me['pricepromotion'])?><?php echo @$this->document->setup['Currency']?>
                            <?php if(@$me['noteprice']!=""){ ?>
                            (<?php echo @$me['noteprice']?>)
                            <?php }?>
                            </span>
                            <?php } ?>
                            
                        </div>
                        <?php } ?>
                    <?php } ?>
                    </div>
                    <?php if(@count($media['childs'])==0 || $media['displaytype']=='compact'){ ?>
                    	<?php if(@count($media['childs'])==0){ ?>
                    		<?php $cls = '';?>
                    		<?php if(@$media['pricepromotion']!=0){ ?>
                    <div align="center" class="product-pricepromotion">
                        	
                        	<?php if(@$media['pricepromotion']){ ?>
                            <?php $cls = 'product-price-no';?>
                        	<?php echo @$this->string->numberFormate($media['pricepromotion'])?><?php echo @$this->document->setup['Currency']?>
                            <?php } ?>
                            <?php if(@$media['noteprice']!=""){ ?>
                            (<?php echo @$media['noteprice']?>)
                            <?php }?>
                    </div>
                    		<?php } ?>
                    <div align="center" class="product-price <?php echo @$cls?>">
                    		<?php if(@$media['price']){?>
                    		<?php echo @$this->string->numberFormate($media['price'])?><?php echo @$this->document->setup['Currency']?>
                        	<?php if(@$media['noteprice']!="" && $media['pricepromotion'] == 0 ){ ?>
                        (<?php echo @$media['noteprice']?>)
                        <?php }?>
                        	<?php }else{ ?>
                        Giá đang cập nhật
                        	<?php } ?>
                    </div>
                        <?php }else{ ?>
                        	<?php @$data_price = array();?>
							<?php 
                            	foreach($media['childs'] as $me){
                            	if(!isset($data_price[@$me['sizes']]))
                                {
                                    if($me['price'] == 0)
                                        @$data_price[$me['sizes']]['price'] = 'Giá đang cập nhật';
                                    else
                                        @$data_price[$me['sizes']]['price'] = $this->string->numberFormate($me['price']).@$this->document->setup['Currency'];
                                    @$data_price[$me['sizes']]['pricepromotion'] = $this->string->numberFormate($me['pricepromotion']).@$this->document->setup['Currency'];
                                }
                            } ?>
                            <?php foreach($data_price as $size => $price){ ?>
                            	<div align="center">
                                	<?php 
                                    $str = $size.' : ';
                                    if($size == '')
                                    	$str ='';
                                    if($price['pricepromotion']==0)
                                		echo $str.$price['price'];
                                    else
                                    	echo $str.'<span class="product-price-no">'.$price['price'].'</span> <span class="product-pricepromotion">'.$price['pricepromotion'].'</span>';
                                    ?>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    <center>
                    	
                        <?php if(@$media['noted']!=""){ ?>
                        <em><?php echo @$media['noted']?></em>
                        <?php }?>
                    </center>
                    <?php } ?>
                    <div align="center">
                        <a href="<?php echo @$media['link']?>" title="<?php echo @$media['title']?><?php if(@$media['code']!="") echo ' - '.$media['code']?>">Chi tiết</a><!-- || <a onclick="cart.add('<?php echo @$media['mediaid']?>')">Đặt hàng</a>-->
                    </div>
                    <?php if(@$media['displaytype']=='compact'){ ?>
                    <div align="center">
                    	
                    	<?php foreach($media['childs'] as $me){ ?>
                            <?php if(@$me['colorcode']!=''){ ?>
                            
                                <img class="hl-color-icon" style="background-color:<?php echo @$me['colorcode']?>">
                                
                            
                            <?php }?>
                        <?php } ?>
                        <div style="clear:both"></div>
                        
                    	<!--<a onClick="pro.quickView(<?php echo @$media['mediaid']?>)">Xem nhanh</a>-->
                    </div>
                    <?php }?>
                </td>
            </tr>
        </table>
        
        
        
        
    </div>
    <?php } ?>
    <div class="clearer">&nbsp;</div>
</div>
    


<div class="clearer">&nbsp;</div>
<?php echo @$pager?>
<?php
}
?>
<script type="text/javascript">
loadLazy();
</script>

