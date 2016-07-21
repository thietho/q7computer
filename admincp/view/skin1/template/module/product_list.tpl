			<?php echo @$pager?>
			
    <?php foreach($medias as $key => $media) {?>
    <div class="listitem <?php echo count($media['child'])>0?'group':'mediaitem' ?>" id="<?php echo @$media['mediaid']?>" price="<?php echo @$this->string->numberFormate($media['price'])?>" >
        
        
        <table class="data-table">
            
            <tr class="item">
                <td width="100px">
                	<img id="pro<?php echo @$media['mediaid']?>_preview" src="<?php echo $media['imagepreview']?>" width="100px" onclick="showFile($('#pro<?php echo @$media['mediaid']?>_filepath').val())"/>
                    <?php if(@$this->user->checkPermission("module/product/changimage")==true){ ?>
                	<div align="center">
                    	<input type="button" class="button" value="Đổi hình" onClick="browserFile('pro<?php echo @$media['mediaid']?>','single')">
                        <input type="hidden" id="pro<?php echo @$media['mediaid']?>_callback" value="pro.updateImage('<?php echo @$media['mediaid']?>'">
                        <input type="hidden" id="pro<?php echo @$media['mediaid']?>_filepath" name="imagepath" value="<?php echo @$media['imagepath']?>" />
                    </div>
                    <?php } ?>
                    <!--
                    -->
                </td>
                <td>
                	<strong><?php echo @$this->document->productName($media)?></strong><br />
                    Giảm: <?php echo @$this->string->numberFormate($media['discountpercent'])?>%<br />
                    Giá: <?php echo @$this->string->numberFormate($media['price'])?><?php if(@$media['noteprice']) echo "(".@$this->document->getCategory($media['noteprice']).")";?><br />
                    Giá khuyến mãi: <?php echo @$this->string->numberFormate($media['pricepromotion'])?><br />
                    <?php echo ($media['groupkeys']!="")?$media['groupkeys']."<br>":"" ?>
                    <?php if(@$this->user->checkPermission("module/product/history")==true){ ?>
                    <?php if(@$media['totalinventorytext']) echo "Tổng tồn: ".$media['totalinventorytext']."<br>"?>
                    <?php if(@$media['inventorytext']) echo "Tồn tại kho: ".$media['inventorytext']?>
                    <?php if(@$media['shopinventory']) echo $media['shopinventory']?>
                    <?php } ?>
                    <?php if(count($media['child'])==0){ ?>
                    <?php if(@$this->user->checkPermission("module/product/viewListSelect")==true){ ?>       
                    <input type="button" class="button" value="Đưa vào danh sách" onclick="pro.addToList('<?php echo @$media['mediaid']?>')"/>
                    <?php } ?>
                    <input type="button" class="button selectProduct" value="Chọn" ref="<?php echo @$media['mediaid']?>" image="<?php echo @$media['imagepreview']?>" code="<?php echo @$media['code']?>" unit="<?php echo @$media['unit']?>" title="<?php echo @$this->document->productName($media)?>" price="<?php echo @$media['price']?>" pricepromotion="<?php echo @$media['pricepromotion']?>" discountpercent="<?php echo @$media['discountpercent']?>" productname="<?php echo @$this->document->productName($media)?>" brandname="<?php echo @$this->document->getCategory($media['brand'])?>"/>
                    <?php } ?>
                    <div>
                    	Hiển thị:
                        <select id="displaytype<?php echo @$media['mediaid']?>" mediaid="<?php echo @$media['mediaid']?>">
                        	<?php foreach(@$this->document->productdisplay as $key => $val){ ?>
                            <option value="<?php echo @$key?>"><?php echo @$val?></option>
                            <?php } ?>
                        </select>
                        <?php if(@$this->user->checkPermission("module/product/update")==true){ ?>
                        <input type="button" class="button" value="Sửa" onClick="showProductForm('<?php echo @$media['mediaid']?>','','pro.searchForm()');">
                        <?php if(count($media['child'])==0){ ?>
                        <input type="button" class="button" value="Đưa vào nhóm" onClick="pro.activeGroup();">
                        <?php } ?>
                        <?php } ?>
                        <?php if(@$this->user->checkPermission("module/product/insert")==true){ ?>
                    	<input type="button" class="button" value="Thêm qui cách" onClick="showProductForm('','<?php echo @$media['mediaid']?>','pro.searchForm()');">
                    	<?php } ?>
                        <?php if(@$this->user->checkPermission("module/product/history")==true){ ?>
                        <input type="button" class="button" value="Lịch sử" onClick="pro.history('<?php echo @$media['mediaid']?>');">
                        <?php } ?>
                        <?php if(@$this->user->checkPermission("module/product/deleted")==true){ ?>
                        <input type="button" class="button" value="Xóa" onClick="pro.delete('<?php echo @$media['mediaid']?>');">
                        <?php } ?>
                    </div>
                    
                    <?php if(count($media['child'])){ ?>
                    <script language="javascript">
					$("#displaytype<?php echo @$media['mediaid']?>").val("<?php echo @$media['displaytype']?>");
					$("#productsize<?php echo @$media['mediaid']?>").sortable({
						update: function( event, ui )
						{
							var arrid = new Array();
							var arrpos = new Array();
							$(this).children('table').each(function(index, element) {
								arrid.push($(this).attr('mediaid'));
								arrpos.push($(this).attr('position'));
								
							});
							$.post("?route=module/product/updatePosition",
								{
									mediaid:arrid,
									position:arrpos
								},
								function(){
								
							});
						}
					});
					
					$("#displaytype<?php echo @$media['mediaid']?>").change(function(e) {
						
                        $.post("?route=core/media/updateCol",{mediaid:$(this).attr('mediaid'),col:'displaytype',val:this.value});
                    });
					</script>
                    
                    <div id="productsize<?php echo @$media['mediaid']?>">
                    <?php foreach($media['child'] as $k => $child){ ?>
                    
                    <table id="child<?php echo @$child['mediaid']?>" mediaid="<?php echo @$child['mediaid']?>" position="<?php echo @$k?>">
                    	<tr>
                        	<td width="100px">
                            	<img id="pro<?php echo @$child['mediaid']?>_preview" src="<?php echo $child['imagepreview']?>" width="100px" onclick="showFile($('#pro<?php echo @$child['mediaid']?>_filepath').val())">
                                <?php if(@$this->user->checkPermission("module/product/changimage")==true){ ?>
                                <div align="center">
                                    <input type="button" class="button" value="Đổi hình" onClick="browserFile('pro<?php echo @$child['mediaid']?>','single')">
                                    <input type="hidden" id="pro<?php echo @$child['mediaid']?>_callback" value="pro.updateImage('<?php echo @$child['mediaid']?>'">
                                    <input type="hidden" id="pro<?php echo @$child['mediaid']?>_filepath" name="imagepath" value="<?php echo @$child['imagepath']?>" />
                                </div>
                                <?php } ?>
                            </td>
                        	<td>
                            	<?php echo @$child['sizes']?> <?php echo @$child['color']?> 
                                <?php if(@$child['colorcode']){ ?>
                                <img class="hl-color-icon" style="background-color:<?php echo @$child['colorcode']?>">
                                <?php } ?>
                                <?php echo @$child['material']?> : <?php echo @$this->string->numberFormate($child['price'])?><?php if(@$child['noteprice']!="") echo "(".@$this->document->getCategory($child['noteprice']).")";?><br />
                                Giảm: <?php echo @$this->string->numberFormate($child['discountpercent'])?>%<br />
                                Giá khuyến mãi: <?php echo @$this->string->numberFormate($child['pricepromotion'])?><br />
                                <?php if(@$this->user->checkPermission("module/product/history")==true){ ?>
                                <?php if(@$child['totalinventorytext']!='') echo "Tổng tồn: ".$child['totalinventorytext']."<br>"?>
                                <?php if(@$child['inventorytext']) echo "Tồn tại kho: ".$child['inventorytext']?>
                                <?php if(@$child['shopinventory']) echo $child['shopinventory']?>
                                <?php } ?>
                            </td>
                            <td>
                            	Barcode: <?php echo @$child['barcode']?><br />
                   	 			Ref: <?php echo @$child['ref']?><br />
                                Trạng thái:<?php echo @$this->document->status_media[$child['status']]?><br />
                            </td>
                    		<td>
                            	<?php if(@$this->user->checkPermission("module/product/update")==true){ ?>
                            	<input type="button" class="button" value="Sửa" onclick="showProductForm('<?php echo @$child['mediaid']?>','<?php echo @$media['mediaid']?>','pro.searchForm()');"/>
                                <?php } ?>
                                <?php if(@$this->user->checkPermission("module/product/viewListSelect")==true){ ?>
                            	<input type="button" class="button addToList" value="Đưa vào danh sách" onclick="pro.addToList('<?php echo @$child['mediaid']?>')"/>
                                <?php } ?>
                                <?php if(@$this->user->checkPermission("module/product/deleted")==true){ ?>
                                <input type="button" class="button" value="Xóa" onclick="pro.delete('<?php echo @$child['mediaid']?>')"/>
                                <?php } ?>
                                <?php if(@$this->user->checkPermission("module/product/update")==true){ ?>
                                <input type="button" class="button" value="Ra ngoài nhóm" onclick="pro.outGroup('<?php echo @$child['mediaid']?>')"/>
                                <?php } ?>
                                <?php if(@$this->user->checkPermission("module/product/history")==true){ ?>
                                <input type="button" class="button" value="Lịch sử" onclick="pro.history('<?php echo @$child['mediaid']?>')"/>
                                <?php } ?>
                                <?php if(@$this->user->checkPermission("sales/sale")==true){ ?>
                                <input type="button" class="button selectProduct" value="Chọn" ref="<?php echo @$child['mediaid']?>" image="<?php echo @$child['imagepreview']?>" code="<?php echo @$child['code']?>" unit="<?php echo @$child['unit']?>" title="<?php echo @$this->document->productName($child)?>" price="<?php echo @$child['price']?>" pricepromotion="<?php echo @$child['pricepromotion']?>" discountpercent="<?php echo @$child['discountpercent']?>" productname="<?php echo @$this->document->productName($child)?>" brandname="<?php echo @$this->document->getCategory($child['brand'])?>"/>
                                <?php } ?>
                            </td>
                        
                        
                        </tr>
                    </table>
                    <?php } ?>
                    </div>
                    <?php } ?>
                </td>
                <td width="150px">
                	Barcode: <?php echo @$media['barcode']?><br />
                    Ref: <?php echo @$media['ref']?>
                </td>
                <td width="150px">
                	Nhãn hiệu: <?php echo @$this->document->getCategory($media['brand'])?>
                    <?php if($media['grouppro']) echo " - ".@$this->document->getCategory($media['grouppro'])?>
                    <br />
                    Trạng thái:<?php echo @$this->document->status_media[$media['status']]?><br />
                    <?php echo @$media['sitemapname']?>
                </td>
            </tr>
        </table>
    </div>
                    
                       
                    
                	
                    	
                    <?php } ?>                	
                	
            <div class="clearer">^&nbsp;</div>
            <?php echo @$pager?>
            <div class="clearer">&nbsp;</div>
 <!--<div class="popupmenu">
                            <?php if(@$this->user->checkPermission("module/product/update")==true){ ?>
                                
                            
                            <input type="button" class="button" value="<?php echo @$media['text_edit']?>" onclick="showProductForm('<?php echo @$media['mediaid']?>','pro.searchForm()')"/>
                            <?php } ?>
                            <?php if(@$this->user->checkPermission("module/product/insert")==true){ ?>
                            
                            <input type="button" class="button" value="<?php echo @$media['text_addchild']?>" onclick="window.location='<?php echo @$media['link_addchild']?>'"/>
                            <input type="button" class="button enterGroup" value="Đưa vào nhóm" onclick="pro.enterGroup('<?php echo @$media['mediaid']?>')"/>
                            <input type="button" class="button selectGroup" value="Chọn" onclick="pro.selectGroup('<?php echo @$media['mediaid']?>')"/>
                            <?php }?>
                            <input type="button" class="button" value="Lịch sử" onclick="pro.history('<?php echo @$media['mediaid']?>')"/>
                            <?php if(count($media['child'])==0){ ?>
                            
                            <input type="button" class="button" value="Đưa vào danh sách" onclick="pro.addToList('<?php echo @$media['mediaid']?>')"/>
                            
                            <?php } ?>
                        </div>-->
<script language="javascript">

$(function(){
	
    /*$.contextMenu({
        selector: '.listitem', 
        callback: function(key, options) {
            var m = "clicked: " + key;
            window.console && console.log(m);
			
			switch(key)
			{
				case "edit":
					showProductForm($(this).attr('id'),'','pro.searchForm()');
					break;
				case "addSizes":
					showProductForm('',$(this).attr('id'),'pro.searchForm()');
					break;
				case "viewHistory":
					pro.history($(this).attr('id'));
					break;
				case "del":
					pro.delete($(this).attr('id'));
					break;
				case "enterGroup":
					$('.mediaitem').draggable();
					$('.listitem').droppable({
					  drop: function( event, ui ) {
						
						var desid = ui.draggable.attr('id');
						var souid = $(this).attr('id');
						pro.selectGroup(desid,souid)
						//console.log(ui);
					  }
					});
					break;
			}
        },
        items: {
			<?php if(@$this->user->checkPermission("module/product/update")==true){ ?>
            "edit": {name: "Sửa"},
			"enterGroup": {name: "Đưa vào nhóm"},
			<?php } ?>
			<?php if(@$this->user->checkPermission("module/product/insert")==true){ ?>
            "addSizes": {name: "Thêm qui cách"},
            <?php } ?>
			<?php if(@$this->user->checkPermission("module/product/history")==true){ ?>
			"viewHistory": {name: "Lịch sử"},
			<?php } ?>
			<?php if(@$this->user->checkPermission("module/product/deleted")==true){ ?>
			"del": {name: "Xóa"},
			<?php } ?>
        }
    });*/
    
    $('.listitem').on('click', function(e){
        console.log('clicked', this);
    });
	if(pro.open == "dialog")
	{
		$('.selectProduct').show();	
		$('.addToList').hide();	
	}
	else
	{
		$('.selectProduct').hide();	
		$('.addToList').show();	
	}
	
});

</script>