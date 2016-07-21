<table class="data-table" id="reportbanhang">
    <thead>
        <tr class="tr-head">
            
            <th width="10px">STT</th>
            <th>Mã phiếu</th>
            <th>Ngày bán</th>
            <th>Khách hàng</th>
            <th>Giao bởi</th> 
            <th>Hình thức thanh toán</th>       
            <th>Ghi chú</th>
            <th>Tổng tiền bán</th>
            
        </tr>
    </thead>
    <tbody>
    	<?php $sum=0;?>
    	<?php foreach($data_order as $key => $item){ ?>
        <tr id="order-<?php echo @$item['id']?>" orderid="<?php echo @$item['id']?>">
        	<td><center><?php echo @$key+1 ?></center></td>
            <td>
            	<a onclick="objdl.viewPX(<?php echo @$item['id']?>,'')"><?php echo @$item['maphieu']?></a>
            </td>
            <td><?php echo @$this->date->formatMySQLDate($item['ngaylap'])?></td>
            <td>
            	<?php if(@$item['tenkhachhang'])
                    {
                        echo $item['tenkhachhang'];
                        echo ($item['dienthoai'] != '') ?' - '.$item['dienthoai']:'';
                        echo ($item['diachi'] != '') ?' - '.$item['diachi']:'';
                    }
                ?>
            </td>
            <td>
            	<?php if($item['shipby']){?>
            <?php echo @$this->document->getCategory($item['shipby'])?> gửi ngày <?php echo @$this->date->formatMySQLDate($item['shipdate'])?>
            	<?php } ?>
            </td>
            <td><?php echo @$this->document->getCategory($item['payment'])?></td>
            <td><?php echo @$item['ghichu']?></td>
            <td class="number"><?php echo @$this->string->numberFormate($item['tongtien'])?></td>
            
        </tr>
        	<?php $sum += $item['tongtien'];?>
        <?php } ?>
        <tr>
        	<td colspan="7" align="right"><strong>Tổng</strong></td>
            <td class="number"><strong><?php echo @$this->string->numberFormate($sum)?></strong></td>
        </tr>
    </tbody>

</table>