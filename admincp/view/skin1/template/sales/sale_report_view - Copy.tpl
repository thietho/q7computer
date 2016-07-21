<h2>Các sản phẩm đang có ở shop</h2>

<div id="tabs">
  <ul>
  	<?php foreach($nhanhieu as $brand){ ?>
        <?php if(count($data_product[$brand['categoryid']])) {?>
    <li><a href="#tabs-<?php echo @$brand['categoryid']?>"><?php echo @$brand['categoryname']?></a></li>
    	<?php } ?>
    <?php } ?>
  </ul>
  <?php foreach($nhanhieu as $brand){ ?>
        <?php if(count($data_product[$brand['categoryid']])) {?>
  <div id="tabs-<?php echo @$brand['categoryid']?>">
	<table class="data-table">
    	<thead>
            <tr>
            	<th>Sản phẩm</th>
                <th>Code</th>
                
                <th>Tồn đâu kỳ</th>
                <th>Nhập</th>
                <th>Xuất</th>
                <th>Tồn cuối kỳ</th>
            </tr>
        </thead>
       
        		<?php foreach($data_product[$brand['categoryid']] as $media){ ?>
        <tr>
        	<td>
            	<?php echo @$this->document->productName($media)?>
            </td>
            <td>
            	<?php echo @$media['barcode']?><br>
                Ref: <?php echo @$media['ref']?>
            </td>
            
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        		<?php } ?>
            
        
    </table>
  </div>
  		<?php } ?>
   <?php } ?>
</div>
<div>
	
</div>
<script language="javascript">
$(document).ready(function(e) {
    $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
    $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
});
$('.selectProduct').click(function(e) {
	var obj = new Object();
	obj.id = 0;
	obj.mediaid = $(this).attr('ref');
	obj.imagepath = $(this).attr('image');
	obj.title = $(this).attr('title');
	obj.code = $(this).attr('code');
	obj.unit = $(this).attr('unit');
	//console.log(obj.mediaid);
	obj.price = $(this).attr('price');
	
	obj.pricepromotion = $(this).attr('pricepromotion');
	obj.discountpercent = $(this).attr('discountpercent');
	obj.productname = $(this).attr('productname');
	obj.brandname = $(this).attr('brandname');
	
	var giagiam = 0;
	if(obj.pricepromotion > 0)
	{
		giagiam = obj.price - obj.pricepromotion;
	}
	if($('#nhapkhonguyenlieu').length)
		objdl.addRow('',obj.mediaid,obj.code,obj.title,1,obj.unit,obj.price,giagiam,obj.discountpercent);
	
	
	
});
$('.historyProduct').click(function(e) {
    saleOrder.history($(this).attr('ref'));
});
</script>