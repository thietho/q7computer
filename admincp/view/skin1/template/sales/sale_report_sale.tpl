<div class="section">

	<div class="section-title"><?php echo @$this->document->title?></div>
    
    <div class="section-content">
    	
        <form id="frm_thongke">
        	<div id="ben-search">
            	<input type="text" class="text" id="tenkhachhang" name="tenkhachhang" placeholder="Tên khách hàng"/>
                <label>Từ ngày</label>
                <input type="text" class="text date" id="tungay" name="tungay" />
                <script language="javascript">
                $(function() {
                    $("#tungay").datepicker({
                            changeMonth: true,
                            changeYear: true,
                            dateFormat: 'dd-mm-yy'
                            });
                    });
                </script>
                <label>Đến ngày</label>
                <input type="text" class="text date" id="denngay" name="denngay" />
                <script language="javascript">
                $(function() {
                    $("#denngay").datepicker({
                            changeMonth: true,
                            changeYear: true,
                            dateFormat: 'dd-mm-yy'
                            });
                    });
                </script>
                <label>Giao bởi</label>
                <select id="shipby" name="shipby">
                    <option value=""></option>
                    <?php foreach($shipper as $it){ ?>
                    <option value="<?php echo @$it['categoryid']?>"><?php echo @$this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$it['level']) ?><?php echo @$it['categoryname']?></option>                        
                    <?php } ?>
                </select>
                <label>Hình thức thanh toán</label>
                <select id="payment" name="payment">
                    <option value=""></option>
                    <?php foreach($payment as $it){ ?>
                    <option value="<?php echo @$it['categoryid']?>"><?php echo @$this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$it['level']) ?><?php echo @$it['categoryname']?></option>                        
                    <?php } ?>
                </select>
                <br />
                <input type="button" class="button" id="btnThongKe" name="btnThongKe" value="Xem"/>
                
            </div>
        	
            <div class="clearer">^&nbsp;</div>
            
            <div id="showresult">
                
            </div>
        	<input type="button" class="button" id="btnSaveToExcel" name="btnSaveToExcel" value="Lưu thành excel"/>
        
        </form>
        
    </div>
    
</div>
<script language="javascript">
$('#btnThongKe').click(function(e) {
	$('#showresult').html(loading);
    $.post("?route=sales/sale/reportSaleView", 
		$("#frm_thongke").serialize(), 
		function(html)
		{
			$('#showresult').html(html);
		}
	);
});
$('#btnSaveToExcel').click(function(e) {
	tableToExcel('reportbanhang', 'Ho Lan Solutions');
});
</script>