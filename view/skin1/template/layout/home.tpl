<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo @$direction; ?>" lang="<?php echo @$language; ?>" xml:lang="<?php echo @$language; ?>">
<head>
<link type="image/x-icon" href="<?php echo HTTP_SERVER.DIR_IMAGE?>logo-small.png" rel="icon">
<link type="image/x-icon" href="<?php echo HTTP_SERVER.DIR_IMAGE?>logo-small.png" rel="shortcut icon">
<title><?php echo @$title?></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="robots" content="INDEX,FOLLOW" />
<meta http-equiv="REFRESH" content="5400" />
<meta name="description" content="<?php echo @$meta_description?>" />
<meta name="keywords" content="<?php echo @$meta_keyword?>" />		
<meta name="author" content="Ho Lan Solutions">
<meta name="revisit-after" content="7" />
<meta name="creator" content="Ho Lan Solutions" />
<meta name="publisher" content="Ho Lan Solutions" />

<meta property="og:title" content="<?php echo @$title?>">
<meta property="og:type" content="Website">
<meta property="og:url" content="<?php echo @$url?>">
<meta property="og:description" content="<?php echo @$meta_description?>">
<?php echo @$meta_image?>

</head>
    <script type="text/javascript" src="<?php echo HTTP_SERVER.DIR_JS?>jquery-1.8.2.min.js"></script>
    <script type='text/javascript' language='javascript' src='<?php echo HTTP_SERVER.DIR_VIEW?>js/jquery-ui.js'></script>
    <script type='text/javascript' language='javascript' src='<?php echo HTTP_SERVER.DIR_VIEW?>js/jquery.lazy.js'></script>
    <script type='text/javascript' language='javascript' src='<?php echo HTTP_SERVER.DIR_VIEW?>js/jquery.blockUI.js'></script>
    <script type="text/javascript" src="<?php echo HTTP_SERVER.DIR_JS?>divbox.js"></script>
    <script type="text/javascript" src="<?php echo HTTP_SERVER.DIR_JS?>me.js"></script>
    <script type='text/javascript' src='<?php echo HTTP_SERVER.DIR_JS?>jquery.easing.1.3.js'></script> 
    <script type="text/javascript" src="<?php echo HTTP_SERVER.DIR_JS?>swfobject.js" charset="utf-8"></script>
    <script type="text/javascript" src="<?php echo HTTP_SERVER.DIR_JS?>jquery.bxslider.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="<?php echo HTTP_SERVER.DIR_JS?>md5.js"></script>
    
    <script type="text/javascript" src="<?php echo HTTP_SERVER.DIR_JS?>jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="<?php echo HTTP_SERVER.DIR_JS?>common.js"></script>
    <script type="text/javascript" src="<?php echo HTTP_SERVER.DIR_JS?>cart.js"></script>
    
    <link rel='stylesheet' type='text/css' href='<?php echo HTTP_SERVER.DIR_VIEW?>css/jquery-ui.css'>
    <link href="<?php echo HTTP_SERVER.DIR_CSS?>jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css">
    <link href="<?php echo HTTP_SERVER.DIR_CSS?>global.css" rel="stylesheet" type="text/css">
    <link href="<?php echo HTTP_SERVER.DIR_CSS?>divbox.css" rel="stylesheet" type="text/css">
    <link href="<?php echo HTTP_SERVER.DIR_CSS?>bxslider.css" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet" href="<?php echo HTTP_SERVER.DIR_CSS?>style.css" />
    
<script language="javascript">
var HTTP_SERVER = '<?php echo HTTP_SERVER?>';
var DIR_COMPONENT = '<?php echo HTTP_SERVER.DIR_COMPONENT?>';
</script>	   
<body style=" ">
	<div style="display:none"><?php echo @$meta_keyword?></div>
    
    
    <?php echo @$header?>

 <div class="fix1000" style=" "><div class="clear" style="height:5px;"></div> 
 	<div class="">
        <?php echo @$content?>
        
        <?php echo @$footer?> 
        
<script type="text/javascript">
	$('a.lightbox').divbox();
</script>  
      </div>
 </div>
</body>
</html>