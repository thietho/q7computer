<script type='text/javascript' language='javascript' src='<?php echo HTTP_SERVER.DIR_VIEW?>js/menu-collapsed.js'></script>
                    <div class="ben-section">
                    	
                        <div class="ben-section-content">
                        	<ul id="menu">
                            	<li>
                                	<div class="collape">
                                    	<a href="<?php echo @$this->document->createLink('minisize')?>" title="Hàng size nhỏ (Mini size)">Chuyên Hàng size nhỏ</a><div class="clearer">^&nbsp;</div>
                                    </div>
                                </li>
                                <?php echo @$menu?>
                            </ul>
                        </div>
                    </div>
<script language="javascript">
$(document).ready(function(){
	
	$('.deep2').hide('fast',function(){
	<?php foreach($path as $item){ ?>
	$("#<?php echo @$item['sitemapid']?>").show();
	<?php } ?>	
	});
});
</script>