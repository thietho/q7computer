<?php
class ControllerCommonHeadermobile extends Controller
{
	public function index()
	{
		$sitemapid = "hotroonline";
		$siteid = $this->member->getSiteId();
		$this->load->model("core/media");
		$this->load->model("core/sitemap");
		$this->data['sitemap'] = $this->model_core_sitemap->getItem($sitemapid, $siteid);
		$this->data['media'] = $this->model_core_media->getItem($siteid.$sitemapid);
		$this->data['supportonline'] = html_entity_decode($this->data['media']['description']);
		
		$this->id="header";
		$this->template="common/headermobile.tpl";
		//$this->data['mainmenu'] = $this->getMenu("sanpham");
		$this->render();
	}
	
	
}
?>