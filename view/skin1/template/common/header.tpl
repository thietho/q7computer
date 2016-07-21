<div class="head_top"><div class="fix1000"><link href="<?php echo HTTP_SERVER.DIR_CSS?>jquery.dropdown.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<?php echo HTTP_SERVER.DIR_JS?>jquery.dropdown.js"></script>
<div id="dropdown" class="lang_global">        
      <span class="selected_lang" data-dropdown="#dropdown-3">
      <span class="arrow">▼</span>
      Tiếng Việt </span>
      
      <div id="dropdown-3" class="dropdown dropdown-tip dropdown-scroll" style="display: none; left: 0px; top: 27px;">    
      <ul class="dropdown-menu"> 
      <li><a href="/?lang=vn" id="vn">Tiếng Việt</a></li>     
             
      </ul>   
        
</div>  
      </div><div class='ontop' style="float:right; padding:10px;"><a href='http://demo154com935.web30s.vn/mem/changeinfo' class='mem'>• Tài khoản của tôi</a>  <a href='http://demo154com935.web30s.vn/mem/shop' class='mem'> • Quản lý đơn hàng</a>  <a href='http://demo154com935.web30s.vn/mem/product/1' class='mem'>• Danh sách yêu thích</a>   <a href='http://demo154com935.web30s.vn/cart-view/' class='mem'>• Giỏ hàng (0)</a>   <a href='http://demo154com935.web30s.vn/login' OnClick="ShowHidden('id_mem_login'); return false;" class='mem'>• Đăng nhập</a>  <a href='http://demo154com935.web30s.vn/reg' class='mem'>• Đăng ký</a> </div>

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
	<div class="head_banner" style="margin-top:0px; margin-bottom:0px;"><div class="fix980" align="center">   
        <link rel='stylesheet' id='camera-css'  href='<?php echo HTTP_SERVER.DIR_CSS?>camera.css' type='text/css' media='all'> 
        <style>
            #back_to_camera {
                clear: both;
                display: block;
                height: 80px;
                line-height: 40px;
                padding: 20px;
            }
            .fluid_container {
                margin: 0 auto;
                max-width: 980px;
                width: 90%;
            }
        </style>
        <script type='text/javascript' src='<?php echo HTTP_SERVER.DIR_JS?>jquery.mobile.customized.min.js'></script>
        <script type='text/javascript' src='<?php echo HTTP_SERVER.DIR_JS?>camera.min.js'></script> 
        <script>

            jQuery(function(){
                jQuery('#camera_wrap').camera({
                    thumbnails  : false,
                    height      : '200px',
                    pagination  : false,
                    time        : 2500,
                    overlayer   : false
                });
            });
        </script>
        <div style="height:200px; width:970px;" class="banner_top_ten">
            <div class="camera_wrap camera_azure_skin" id="camera_wrap" style="width:970px;height:300px;">
                <div data-thumb='http://demo154com935.web30s.vn/datafiles/1/khong_xoa/thumb_14489439804773_header_b2.jpg' data-src='http://demo154com935.web30s.vn/datafiles/1/khong_xoa/14489439804773_header_b2.jpg'>
                                                        <div class='camera_caption fadeFromBottom'></div>
                                                      </div><div data-thumb='http://demo154com935.web30s.vn/datafiles/1/khong_xoa/thumb_14489440064270_header_b3.png' data-src='http://demo154com935.web30s.vn/datafiles/1/khong_xoa/14489440064270_header_b3.png'>
                                                        <div class='camera_caption fadeFromBottom'></div>
                                                      </div><div data-thumb='http://demo154com935.web30s.vn/datafiles/1/khong_xoa/thumb_14489440266142_header_banner.jpg' data-src='http://demo154com935.web30s.vn/datafiles/1/khong_xoa/14489440266142_header_banner.jpg'>
                                                        <div class='camera_caption fadeFromBottom'></div>
                                                      </div>            </div>  
        </div>
                        </div></div>
	<div class="head_menu"><div class="fix980"><div id="main_menu" align="center">
              <ul>
                <li><a class="na_1 active" href="http://demo154com935.web30s.vn/"><span>TRANG CHỦ</span></a></li>
                                <li><a class="na_2" href="http://demo154com935.web30s.vn/products-all/"><span>SẢN PHẨM</span></a></li>
                                                <li><a class="na_3" href="http://demo154com935.web30s.vn/catalog-all/"><span>TIN TỨC</span></a></li>
                                                   
                
                <li><a class="na_6" href="http://demo154com935.web30s.vn/info/2/gioi-thieu/"><span>GIỚI THIỆU</span></a>
                                <ul>
                                <li><a class="na_4" href="http://demo154com935.web30s.vn/info/1/dich-vu/"><span>DỊCH VỤ</span></a></li>
                                                <li><a class="na_5" href="http://demo154com935.web30s.vn/info/5/tuyen-dung/"><span>TUYỂN DỤNG</span></a></li>
                                </ul>
                                </li>
               
                                <li><a class="na_7" href="http://demo154com935.web30s.vn/map/"><span>SƠ ĐỒ</span></a></li>
                                <li><a class="na_8" href="http://demo154com935.web30s.vn/contact/"><span>LIÊN HỆ</span></a></li>
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