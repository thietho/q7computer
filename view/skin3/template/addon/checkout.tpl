<div>
<table class="ben-table view-cart-desktop">
	<thead>
        <tr>
            <th>Hình</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Thành tiền</th>
           
        </tr>
    </thead>
    <tbody>
	<?php 
    	$sum = 0;
    	foreach($medias as $media) {
        $sum += $media['price'] * $media['qty'];
    ?>
        <tr>
            <td><img src="<?php echo @$media['imagethumbnail']?>" class="ben-center"/></td>
            <td><?php echo @$this->document->productName($media['mediaid'])?></td>
            <td class="number"><?php echo @$this->string->numberFormate($media['price'])?></td>
            <td class="number"><?php echo @$this->string->numberFormate($media['qty'])?></td>
            <td class="number"><?php echo @$this->string->numberFormate($media['price'] * $media['qty'])?></td>
            
        </tr>
    <?php } ?>
    </tbody>
    <tfoot>
    	<tr>
        	<td></td>
            <td></td>
            <td></td>
            <td>Tông cộng</td>
            <td class="number"><?php echo @$this->string->numberFormate($sum)?></td>
        </tr>
    </tfoot>
</table>
</div>
<div class="view-cart-mobile">
    <?php
    	$sum = 0;
    	foreach($medias as $media) {
        $sum += $media['price'] * $media['qty'];
    ?>
    <div class="cart-item">
        <table>
            <tr>
                <td>
                    <img src="<?php echo @$media['imagethumbnail']?>"/>
                </td>
                <td>
                    <strong><?php echo @$this->document->productName($media['mediaid'])?></strong><br>
                    Giá: <?php echo @$this->string->numberFormate($media['price'])?><?php echo @$this->
                    document->setup['Currency']?><br>
                    Số lượng:<?php echo @$this->string->numberFormate($media['qty'])?><br>
                    Thành tiền: <?php echo $this->string->numberFormate($media['price'] * $media['qty'])?><?php echo $this->document->setup['Currency']?>

                </td>
            </tr>
        </table>
    </div>
    <?php } ?>
    <div class="cart-total"><strong>Tổng đơn hàng: </strong><?php echo @$this->string->numberFormate($sum)?><?php echo @$this->
        document->setup['Currency']?></div>
</div>
<div>
	<form id="frmCheckOut" method="post">
    	<div id="error" class="ben-error" style="display:none"></div>
        <h2>Thông tin khách hàng</h2>
        <input type="hidden" id="userid" name="userid" value="<?php echo @$member['username']?>" size="40">
        <input type="hidden" id="orderdate" name="orderdate" >
        <div class="form-group">
            <label>Họ và tên</label><br>
            <input type="text" id="customername" name="customername" value="<?php echo @$member['fullname']?>" class="ben-textbox" <?php echo @$readonly?>>
        </div>
        <div class="form-group">
            <label>Email</label><br>
            <input type="text" id="email" name="email" value="<?php echo @$member['email']?>" class="ben-textbox" <?php echo @$readonly?>>
        </div>
        <div class="form-group">
            <label>Địa chỉ</label><br>
            <input type="text" id="address" name="address" value="<?php echo @$member['address']?>" class="ben-textbox" <?php echo @$readonly?>>
        </div>
        <div class="form-group">
            <label>Điện thoại</label><br>
            <input type="text" id="phone" name="phone" value="<?php echo @$member['phone']?>" class="ben-textbox" <?php echo @$readonly?>>
        </div>
        <input id="chk_fillnhanhang" type="checkbox" /> Thông tin nhận hàng như trên
        <h2>Thông tin giao hàng</h2>
        <div class="form-group">
            <label>Người nhận hàng</label><br>
            <input type="text" id="receiver" name="receiver" class="ben-textbox">
        </div>
        <div class="form-group">
            <label>Số điện thoại</label><br>
            <input type="text" id="receiverphone" name="receiverphone" class="ben-textbox">
        </div>
        <div class="form-group">
            <label>Địa chỉ giao hàng</label><br>
            <input type="text" id="shipperat" name="shipperat" class="ben-textbox">
        </div>
        <div class="form-group">
            <label>Phương thức thanh toán</label><br>
            <?php foreach($this->document->paymenttype as $key => $val){ ?>
            <input type="radio" name="paymenttype" value="<?php echo @$key?>" /> <?php echo @$val?>
            <?php } ?>
        </div>
        <div class="form-group">
            <label>Ghi chú</label><br>
            <textarea id="comment" name="comment"></textarea>
        </div>
        <div class="form-group">
            <input type="button" id="btnCheckout" name="btnCheckout" class="ben-button" value="Thanh toán">
        </div>
    </form>
</div>

<div class="clearer">&nbsp;</div>
<script language="javascript">
$("#btnCheckout").click(function(){
	$.blockUI({ message: "<h1>Please wait...</h1>" });
	
	$('#orderdate').val(toPhpTime(Date.now()));
	$.post("<?php echo HTTP_SERVER?>?route=addon/checkout/checkout", $("#frmCheckOut").serialize(),
		function(data){
			var arr = data.split("-")
			if(arr[0] == "true")
			{
				window.location = HTTP_SERVER+"checkoutcomplete/"+arr[1]+".html";
			}
			else
			{
				
				$('#error').html(data).show('slow');
				
				
			}
			$.unblockUI();
		}
	);					   
});
$("#chk_fillnhanhang").click(function(e) {
    $('#receiver').val($('#customername').val());
	$('#receiverphone').val($('#phone').val());
	$('#shipperat').val($('#address').val());
});
</script>