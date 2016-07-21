<table class="data-table" id="reportbanhang">
    <thead>
        <tr>
            <th>Sản phẩm</th>
            <th>Code</th>
            
            <th>Tồn đầu kỳ</th>
            <th>Nhập</th>
            <th>Xuất</th>
            <th>Tồn cuối kỳ</th>
        </tr>
    </thead>
   
   	<?php foreach($data_product as $key => $medias){ ?>
    	<?php if(count($medias)){ ?>
    <tr>
        <td colspan="7">
            <strong><?php echo $this->document->getSiteMap($key,SITEID)?></strong>
        </td>
        
    </tr>
    		<?php foreach($medias as $media){ ?>
    <tr class="item" mediaid="<?php echo @$media['mediaid']?>" tungay="<?php echo @$tungay?>" denngay="<?php echo @$denngay?>">
        <td>
            <?php echo @$this->document->productName($media)?>
        </td>
        <td>
            Barcode: <?php echo @$media['barcode']?><br>
            Ref: <?php echo @$media['ref']?>
        </td>
        
        <td class="number"><?php echo @$media['tondauky']?></td>
        <td class="number"><?php echo @$media['nhaptrongky']?></td>
        <td class="number"><?php echo @$media['xuattrongky']?></td>
        <td class="number"><?php echo @$media['toncuoiky']?></td>
    </tr>
    		<?php } ?>
    	<?php } ?>
    <?php } ?>
</table>
<script language="javascript">
$('.item').dblclick(function(e) {
    var eid = "reportdetail";
	$('body').append('<div id="'+eid+'" style="display:none"></div>');
	$('body').css('overflow','hidden');
	$("#"+eid).attr('title','Thông tin nhập xuất');
		$("#"+eid).dialog({
			autoOpen: false,
			show: "blind",
			hide: "explode",
			width: $(document).width()-100,
			height: window.innerHeight,
			modal: true,
			close:function()
				{
					$("#"+eid).remove();
					$('body').css('overflow','auto');
				},
			
		});
	var mediaid = $(this).attr('mediaid');
	var tungay = $(this).attr('tungay');
	var denngay = $(this).attr('denngay');
	$("#"+eid).dialog("open");
	$("#"+eid).html(loading);
	$("#"+eid).load('?route=sales/sale/history&mediaid='+mediaid+'&tungay='+tungay+'&denngay='+denngay);	
});
</script>

	

