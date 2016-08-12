<div class="head_top">
	
  <div class="fix1000">
    <link href="<?php echo HTTP_SERVER.DIR_CSS?>jquery.dropdown.css" type="text/css" rel="stylesheet">
    <div class='ontop' style="float:right; padding:10px;">
    	<?php if($this->member->isLogged()){?>
    	<a href="<?php echo @$this->document->createLink('member')?>" class='mem'>• Tài khoản của tôi</a>
        <a href="<?php echo @$this->document->createLink('historyorder')?>" class='mem'> • Quản lý đơn hàng</a>
        <a href="#" class='mem' onClick="logout()"> • Đăng xuất</a>
        <?php } ?>
        <a href="<?php echo @$this->document->createLink('cart')?>" title="Giỏ hàng" class='mem'>• Giỏ hàng (<span id="cartcout"></span>)</a>
        <?php if(!$this->member->isLogged()){?>
        <a href="<?php echo @$this->document->createLink('login')?>" class='mem'>• Đăng nhập</a>
        <a href="<?php echo @$this->document->createLink('register')?>" title="Đăng ký" class='mem'>• Đăng ký</a> 
        <?php } ?>
    </div>
    
  </div>
</div>
<div class="head_banner" style="margin-top:0px; margin-bottom:0px;">
	<div class="fix980" align="center">
    	<?php echo $headerimage?>
	</div>
</div>

<div class="head_menu">
  <div class="fix980">
    <div id="main_menu" align="center">
      <ul>
        <?php echo $mainmenu?>
      </ul>
      
      <div class="clear"></div>
    </div>
  </div>
</div>
<script language="javascript">

function mainmenu(){
$(" #main_menu ul ul ").css({display: "none"}); // Opera Fix
$(" #main_menu li").hover(function(){
		$(this).find('ul:first').css({visibility: "visible",display: "none"}).show();
		},function(){
		$(this).find('ul:first').css({visibility: "hidden"});
		});
}

$(document).ready(function(){					
	mainmenu();
	
});
</script>
