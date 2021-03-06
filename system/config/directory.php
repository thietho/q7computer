<?php
// HTTP
define('HTTP_IMAGE', 'http://'.$_SERVER['HTTP_HOST'].'/file/');
define('HTTP_SERVER', 'http://'.$_SERVER['HTTP_HOST'].'/');


// HTTPS
define('HTTPS_SERVER', 'https://'.$_SERVER['HTTP_HOST'].'/');
define('HTTPS_IMAGE', 'https://'.$_SERVER['HTTP_HOST'].'/file/');

// DIR
define('DIR_APPLICATION', '');
define('DIR_CONTROLLER','controller/');
define('DIR_MODEL','model/');
define('DIR_LANGUAGE', 'language/');

define('DIR_DATABASE', 'system/database/');
define('DIR_COMPONENT', 'component/');
define('DIR_FILE','file/');
define('DIR_SYSTEM', 'system/');
define('DIR_CACHE', 'file/cache/');
define('DIR_CACHEHTML', 'file/cachehtml/');

$filename = DIR_FILE."db/setting.json";;
@$handle = fopen($filename, "r");
@$contents = fread($handle, filesize($filename));
@fclose($handle);

define('SKIN', 'skin3');
define('IMG_PROLIST', 150);
define('DIR_VIEW','view/'.SKIN.'/');
define('DIR_TEMPLATE','view/'.SKIN.'/template/');
define('DIR_IMAGE', 'view/'.SKIN.'/image/');
define('DIR_FLASH', 'view/'.SKIN.'/flash/');
define('DIR_CSS', 'view/'.SKIN.'/css/');
define('DIR_JS', 'view/'.SKIN.'/js/');
define('DIR_XML', 'view/'.SKIN.'/xml/');


?>