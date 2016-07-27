function Cart()
{
	this.load = function()
	{
		$("#sitebarcartlist").load(HTTP_SERVER+"?route=sitebar/cart/getList");
			
		$.ajax({
			url: HTTP_SERVER+"?route=sitebar/cart/getCount",
			cache: false,
			success: function(html){
				$("#cartcout").html(html);
				if(html == 0)
					$("#ben-cart").hide();
				else
				{
					$("#ben-cart").show();
				}
			}
		});
	}
	this.add = function(mediaid)
	{
		var eid = "cartwaring";
		$('body').append('<div id="'+eid+'" style="display:none"></div>');
		$.get(HTTP_SERVER+"?route=addon/cart/add&mediaid="+mediaid,
			function(data){
				if(data == "true")
				{
					$("#"+eid).attr('title','Thông tin đặt hàng');
					$("#"+eid).dialog({
						autoOpen: false,
						show: "blind",
						hide: "explode",
						width: 550,
						height: 300,
						modal: true,
						close:function()
						{
							$("#"+eid).remove();
						},
						buttons: {
							
							
							'Đóng': function() {
								$("#"+eid).remove();
								$( this ).dialog( "close" );
								
							},
							'Xem giỏ hàng': function(){
								window.location = HTTP_SERVER+'cart_'+ Date.now() +'.html';	
							},
							
						}
					});
				
					
					$("#"+eid).load(HTTP_SERVER+"?route=common/warring/cart&mediaid="+mediaid);
					cart.load()
					$("#"+eid).dialog("open");
				}
				
			}
		);
	}
	
	this.update = function(mediaid,qty)
	{
		$.get(HTTP_SERVER+"?route=addon/cart/update&mediaid="+mediaid+"&qty="+qty,
			function(data){
				if(data == "true")
				{
					$("#sitebarcartlist").load(HTTP_SERVER+"?route=sitebar/cart/getList");
					$("#addoncartlist").load(HTTP_SERVER+"?route=addon/cart/getList");
				}
				
			}
		);
	}
	
	this.remove = function(mediaid)
	{
		$.get(HTTP_SERVER+"?route=addon/cart/remove&mediaid="+mediaid,
			function(data){
				if(data == "true")
				{
					$("#sitebarcartlist").load(HTTP_SERVER+"?route=sitebar/cart/getList");
					$("#addoncartlist").load(HTTP_SERVER+"?route=addon/cart/getList");
				}
				
			}
		);
	}
}

var cart = new Cart();
$(document).ready(function(e) {
    cart.load();
});