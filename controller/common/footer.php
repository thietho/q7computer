<?php
class ControllerCommonFooter extends Controller
{
	public function index()
	{
		$this->load->model("core/sitemap");
		$sitemapid = "hotroonline";
		$siteid = $this->member->getSiteId();
		$this->data['sitemap'] = $this->model_core_sitemap->getItem($sitemapid, $siteid);
		$this->data['media'] = $this->model_core_media->getItem($siteid.$sitemapid);
		//$this->data['supportonline'] = html_entity_decode($this->data['media']['description']);
		$data_sitemaps = array();
		$this->model_core_sitemap->getTreeSitemap('sanpham',$data_sitemaps,SITEID);
		//print_r($data_sitemaps);
		$this->data['sitemaps'] = $data_sitemaps;
		$this->id="footer";
		$this->template="common/footer.tpl";
		$this->render();
	}
}
?>