<div id="shopsearch">
	<table>
    	<tr>
        	<td width="60%"><input type="text" class="text" id="keyword" style="width:100%" placeholder="Tìm kiếm sản phẩm"/></td>
            <td>
            	<select id="brand">
                    <option value="">Tất cả nhản hiệu</option>
                    <?php foreach($nhanhieu as $it){ ?>
                    <option value="<?php echo @$it['categoryid']?>"><?php echo @$this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$it['level']) ?><?php echo @$it['categoryname']?></option>                        
                    <?php } ?>
                </select>
            </td>
            <td>
                <select id="grouppro" name="grouppro">
                    <option value="">Dòng sản phẩm</option>
                </select>        
            </td>
            <td>
            	<select id="sitemapid">
                    <option value="">Tất cả danh mục</option>
                    <?php foreach($sitemaps as $sitemap){ ?>
                    <?php if(@$sitemap['moduleid'] == 'module/product'){ ?>
                    <option value="<?php echo @$sitemap['sitemapid']?>"><?php echo @$this->string->getPrefix("&nbsp;&nbsp;&nbsp;&nbsp;",$sitemap['level']) ?><?php echo @$sitemap['sitemapname']?></option>
                    <?php } ?>
                    <?php } ?>
                </select>
            </td>
            <td>
                 <select id="status">            	
                    <option value=""></option>
                    <?php foreach($status as $it){ ?>
                    <option value="<?php echo @$it['categoryid']?>"><?php echo @$it['categoryname']?></option>
                    <?php } ?>
                </select>
            </td>
        </tr>
    </table>
    
    
    
    
</div>
<h2>Các sản phẩm đang có ở shop</h2>


<table class="data-table">
    <thead>
        <tr>
            <th>Sản phẩm</th>
            <th>Code</th>
            <th>Số lượng tồn</th>
            <th>Giá</th>
            <th>Giảm%</th>
            <th></th>
            <th></th>
        </tr>
    </thead>
    <tbody id="product-content"></tbody>
</table>

<div id="product-loading"></div>

<script language="javascript">
$('#shopsearch #brand').change(function(e) {
	$.getJSON("?route=core/category/getListChild&categoryid="+ $(this).val(),function(data){
		var str = '<option value="">Dòng sản phẩm</option>';
		for(i in data)
		{
			str += '<option value="'+data[i].categoryid+'">'+data[i].categoryname+'</option>';
		}
		$('#shopsearch #grouppro').html(str);
		$('#shopsearch #grouppro').val(objdl.grouppro);
		if(objdl.grouppro!="")	
			saleOrder.search();
	});
});
$(document).ready(function(e) {
	$('#shopsearch #keyword').val(objdl.keyword);
	$('#shopsearch #brand').val(objdl.brand).change();
	$('#shopsearch #grouppro').val(objdl.grouppro);
	$('#shopsearch #sitemapid').val(objdl.sitemapid);
	$('#shopsearch #status').val(objdl.status);
	if(objdl.grouppro=="")	
		saleOrder.search();
});
$('#shopsearch #keyword').keyup(function(e) {
	if(e.keyCode == 13)
		saleOrder.search();
});
$('#shopsearch select').change(function(e) {
	saleOrder.search();
});

$('#searchproductpopup').scroll(function(e) {
	//alert($(document).scrollTop() + window.innerHeight);
	//console.log(($('#searchproductpopup').innerHeight() + $('#searchproductpopup').scrollTop()) + ':' + $('#product-content').innerHeight());
	if($('#searchproductpopup').innerHeight() + $('#searchproductpopup').scrollTop() > $('#product-content').innerHeight())
	{
		saleOrder.loadProduct();	
	}
});
</script>