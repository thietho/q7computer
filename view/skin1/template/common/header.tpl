<div class="head_top"><div class="fix1000"><link href="<?php echo HTTP_SERVER.DIR_CSS?>jquery.dropdown.css" type="text/css" rel="stylesheet">

<div class='ontop' style="float:right; padding:10px;"><a href='http://demo154com935.web30s.vn/mem/changeinfo' class='mem'>• Tài khoản của tôi</a>  <a href='http://demo154com935.web30s.vn/mem/shop' class='mem'> • Quản lý đơn hàng</a>  <a href='http://demo154com935.web30s.vn/mem/product/1' class='mem'>• Danh sách yêu thích</a>   <a href='http://demo154com935.web30s.vn/cart-view/' class='mem'>• Giỏ hàng (0)</a>   <a href='http://demo154com935.web30s.vn/login' OnClick="ShowHidden('id_mem_login'); return false;" class='mem'>• Đăng nhập</a>  <a href='http://demo154com935.web30s.vn/reg' class='mem'>• Đăng ký</a> </div>

			<div id="top_menu_admin_1" class='fix1000'>
				<div id='id_mem_login' class='trontron'>
                     <form class='nomargin' id='memberloginit' action='http://demo154com935.web30s.vn' method='post' name='TheFormLogin' onSubmit="return Check_LoginMember('id_tentruycap','id_matkhau'); return false;">
                        <input name='active' type='hidden' value='member_login'/>
                        <div align='center'><h2>THÀNH VIÊN ĐĂNG NHẬP</h2></div>
                          <table width='100%' border='0' cellspacing='0' cellpadding='2'>
                            <tr>
                              <td width='90'><strong>Tên truy cập</strong></td>
                              <td> <input name='tentruycap' type='text' class='box_input' id='id_tentruycap' maxlength='65'/></td>
                            </tr>
                            <tr>  
                              <td width='90'><strong>Mật khẩu</strong></td>
                              <td><input name='matkhau' type='password' class='box_input' id='id_matkhau' value='' maxlength='65'/></td>
                            </tr>
                            <tr> 
                              <td></td> 
                              <td><input class='submitbutton' type='submit' name='dangky' id='button' value='đăng nhập' /></td>
                            </tr>
                            <tr> 
                              <td></td> 
                              <td><div style="cursor:pointer;" onclick="ShowHidden('id_mem_login');ShowHidden('id_mem_loss');">Quên mật khẩu?</div></td>
                            </tr>
                          </table>
                        </form>
                        <div class="clear"></div>
				</div>
                <div id='id_mem_loss' style='position:absolute; top:30px; z-index:99999; display:none; background:#ccc; width:250px; margin-left:700px; padding:10px;' class='trontron'>
                     <form class='nomargin' id='memberlossit' action='http://demo154com935.web30s.vn' method='post' name='TheFormLogin' onSubmit="return Check_LossMember('email_loss'); return false;">
                        <input name='active' type='hidden' value='member_loss'/>
                        <div align='center'><h2>QUÊN MẬT KHẨU</h2></div>
                          <table width='100%' border='0' cellspacing='0' cellpadding='2'>
                            <tr>
                              <td colspan="2"><strong>Xin nhập vào email của bạn::</strong></td>
                            </tr>
                            <tr>
                              <td colspan="2"> <input name='email' type='text' class='box_input' id='email_loss' maxlength='65'/></td>
                            </tr>
                            <tr> 
                              <td><input class='submitbutton' type='submit' name='dangky' id='button' value='xin mật khẩu' /></td>
                              <td><div style="cursor:pointer;" onclick="ShowHidden('id_mem_login');ShowHidden('id_mem_loss');">nhớ rồi, đăng nhập lại</div></td>
                            </tr>
                          </table>
                        </form>
                        <div class="clear"></div>
				</div>
			</div>
	        </div></div>
	<?php echo $banner?>
	<div class="head_menu"><div class="fix980"><div id="main_menu" align="center">
              <ul>
                <?php echo $mainmenu?>
              </ul>
          <div class="cong" style="display:block;"> 
          	<form class="nomargin" action="http://web30s.vn/catalog-all/" method="get" style="margin:0;" OnSubmit="GoSearch(); return false;" name="formsearch">
                <input name="search" onfocus="if (this.value == 'sản phẩm cần tìm'){this.value='';}" onblur="if (this.value == '') {this.value='sản phẩm cần tìm';}" value="sản phẩm cần tìm" id="txSearchCondition">
                <input type="submit" id="btnSearch" class="submitbutton" value="Tìm kiếm">
        	</form>
			<script type="text/javascript">
                function GoSearch()
                    {
                        var searchkey = document.getElementById('txSearchCondition').value;
                        window.open('http://demo154com935.web30s.vn/products-all/keysearch:'+searchkey,'_self');
                    }
          </script>
          </div>
		  <div class="clear"></div>
            </div></div></div>