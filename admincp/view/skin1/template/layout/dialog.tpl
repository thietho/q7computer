<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">

<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />
	
    
   	<script src="<?php echo HTTP_SERVER.DIR_JS?>jquery.js" type="text/javascript"></script>
    <script src="<?php echo HTTP_SERVER.DIR_JS?>jquery-ui.js" type="text/javascript"></script>
    
	
	<script type='text/javascript' language='javascript' src='<?php echo DIR_COMPONENT?>ckeditor/ckeditor.js'></script>
    
    <script src="<?php echo DIR_JS?>common.js" type="text/javascript"></script>
    <script src="<?php echo DIR_JS?>media.js" type="text/javascript"></script>
    <script src="<?php echo DIR_JS?>control.js" type="text/javascript"></script>
	

</head>
<!--[if lt IE 7]>
	<link rel='stylesheet' type='text/css' href='<?php echo DIR_CSS?>jquery.tabs-ie.css'>
	<link href="<?php echo DIR_VIEW?>css/ie_style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<?php echo DIR_JS?>js/ie_png.js"></script>
    <script type="text/javascript">
       ie_png.fix('.png, #content .pagenavi, .aside ');
	</script>
<![endif]-->


<body>





<div class="main">


	<div id="main-content"><?php echo @$content?></div>

	<div class="clearer">&nbsp;</div>


</div>



</body>

</html>
