<?php
class ControllerCommonHeader extends Controller
{
	public function index()
	{
		require_once DIR_COMPONENT.'MobileDetect/Mobile_Detect.php';
		$detect = new Mobile_Detect;
		$deviceType = ($detect->isMobile() ? ($detect->isTablet() ? 'tablet' : 'phone') : 'computer');
		$scriptVersion = $detect->getScriptVersion();
		switch($deviceType) 
		{
			case 'phone':	
			case 'tablet':
				$this->data['headerimage'] = '<img src="'.HTTP_SERVER.DIR_IMAGE.'header.png" style="width: 100%;">';
				break;
			default:
				$this->data['headerimage'] = '<embed width="970px" height="195px" name="plugin" src="'.HTTP_SERVER.DIR_IMAGE.'q7computer_1000x200.swf" type="application/x-shockwave-flash">';
				
		}
		$sitemapid = "hotroonline";
		$siteid = $this->member->getSiteId();
		$this->load->model("core/media");
		$this->load->model("core/sitemap");
		$this->data['sitemap'] = $this->model_core_sitemap->getItem($sitemapid, $siteid);
		$this->data['media'] = $this->model_core_media->getItem($siteid.$sitemapid);
		@$this->data['supportonline'] = html_entity_decode($this->data['media']['description']);
		$this->data['mainmenu'] = $this->getMenu("");
		
		/*//Banner header
		$template = array(
					  'template' => "common/bannerheader.tpl",
					  'width' => 980,
					  'height' =>0
					  );
	
		$arr = array("banner",0,"",$template);
		$this->data['banner'] = $this->loadModule('module/block','getList',$arr);*/
		$this->id="header";
		$this->template="common/header.tpl";
		$this->render();
	}
	
	public function getMenu($parentid)
	{
		$this->load->model("core/sitemap");
		
		$siteid = $this->member->getSiteId();
		
		$rootid = $this->model_core_sitemap->getRoot($this->document->sitemapid, $siteid);

		if(@$this->document->sitemapid == "")
			$rootid = 'trangchu';
		$str = "";
		
		
		$sitemaps = $this->model_core_sitemap->getListByParent($parentid, $siteid);
		
		foreach($sitemaps as $item)
		{
			$childs = $this->model_core_sitemap->getListByParent($item['sitemapid'], $siteid);
			
			$currenttab = "";
			if(@$item['sitemapid'] == $rootid) 
				$currenttab = "class='active'";
			
			$link = "<a ".$currenttab."><span>".$item['sitemapname']."</span></a>";
			
			if(@$item['moduleid'] != "group")
			{
				
				$link = "<a ".$currenttab." href='".$this->document->createLink($item['sitemapid'])."' title='".$item['sitemapname']."' ><span>".html_entity_decode($item['sitemapname'])."</span></a>";
			}
			if(@$item['moduleid'] == "homepage"){
				$link = "<a ".$currenttab." href='".HTTP_SERVER."'><span>".html_entity_decode($item['sitemapname'])."</span></a>";
			}
			
			$str .= "<li>";
			$str .= $link;
			
			if(count($childs) > 0)
			{
				$str .= "<ul>";
				$str .= $this->getMenu($item['sitemapid']);
				$str .= "</ul>";
			}

			$str .= "</li>";
		}
		
		return $str;
		
	}
	
	
}
?>