<?php
class ControllerPageHome extends Controller
{
	function __construct() 
	{
		//$this->iscache = true;
		$arr=array();
		foreach($_GET as $key => $val)
			$arr[] = $key."=".$val;
	 	$this->name ="PageHome".implode("_",$arr);
	 	
   	}
	public function index()
	{
		
		
		$this->destop();
		//$this->mobile();
	}
	
	public function destop()
	{
		if(@$this->cachehtml->iscacht($this->name) == false)
		{
			//Brand
			$template = array(
						  'template' => "module/category_brand.tpl"
						  );
		
			$arr = array("nhanhieu",$template);
			$this->data['brand'] = $this->loadModule('module/category','getList',$arr);
			//Banner home
			$template = array(
						  'template' => "home/banner.tpl",
						  'width' => 765,
						  'height' =>0
						  );
		
			$arr = array("bannerhome",0,"",$template);
			$this->data['bannerhome'] = $this->loadModule('module/block','getList',$arr);
			//San pham hot
			/*$template = array(
								  'template' => "module/product_list.tpl",
								  'width' => IMG_PROLIST,
								  'height' =>IMG_PROLIST,
								  'widthpreview' => 450,
								  'heightpreview' =>450
								  );
						  
			$medias = $this->getSanPhanHot();
			
			$arr = array($sitemap['sitemapid'],0,$sitemap['sitemapname'],$template,$medias);
			$this->data['producthome']['sanphamhot']['title'] ="Sản phẩm hot";
			$this->data['producthome']['sanphamhot']['data'] = $this->loadModule('module/productlist','getAll',$arr);*/
			
			//$this->data['ortherbrand'] .= $this->loadModule('addon/ortherbrand');
			$this->data['arrbrand'] = array(
							"Sisley",
							"Guerlain",
							"Lancome",
							"Clarins",
							"Shiseido",
							/*"Dior",*/
							"EsteeLauder",
							/*"Chanel",*/
							"Clinique",
							"LOccitane",
							
							"VictoriaSecrect",
							"bathandbodyworks"
							);
					  
			$this->load->model('core/sitemap');
			$data_sitemap = array();
			$this->model_core_sitemap->getTreeSitemap("sanpham", $data_sitemap, $this->member->getSiteId());
			$this->data['arrsitemapid'] = array();
			foreach($data_sitemap as $sitemap)
			{
				if(@$sitemap['countchild'] == 0)
				{
					$this->data['arrsitemapid'][] = $sitemap['sitemapid'];
				}
			}
			
			//$this->loadBrand();
			$this->loadSiteBar();
			
		}
		$this->document->title .= $this->document->setup['Title'];
		$this->id="content";
		$this->template="page/home.tpl";
		$this->layout="layout/home";
		$this->render();
	}
	
	public function loadBrand()
	{
		/*$arrbrand = array(
							"EsteeLauder",
							"Lancome",
							"Clarins",
							"Dior",
							"Chanel",
							"Sisley",
							"Clinique",
							"LOccitane",
							"Shishedo",
							"VictoriaSecrect",
							"bathandbodyworks"
							);
		foreach($arrbrand as $brand)
		{
			$arr = array("",$brand);
			$this->data['producthome'][$brand]['title'] =$this->document->getCategory($brand);
			$this->data['producthome'][$brand]['data'] = $this->loadModule('addon/brand','getList',$arr);
		}*/
		@$brand = $this->request->get['brand'];
		$arr = array("",$brand);
		if(file_exists(DIR_IMAGE.'logo/'.$brand.'.jpg'))
		{
			@$this->data['output'] = '<div class="hl-home-brand"><img src="'.HTTP_SERVER.DIR_IMAGE.'logo/'.$brand.'.jpg"></div>';
		}
		else
		{
			@$this->data['output'] = "<h1>".$this->document->getCategory($brand)."</h1>";
		}
		
		@$this->data['output'] .= $this->loadModule('addon/brand','getList',$arr);
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
	
	public function loadGroup()
	{
		@$sitemapid = $this->request->get['sitemapid'];
		@$device = $this->request->get['device'];
		$this->load->model('core/sitemap');
		$siteid = $this->member->getSiteId();
		$sitemap = $this->model_core_sitemap->getItem($sitemapid, $siteid);
		$medias = $this->getProduct($sitemap['sitemapid'],"");
		$template = array(
								  'template' => "module/product".$device."_list.tpl",
								  'width' => 180,
								  'height' =>180,
								  'widthpreview' => 450,
								  'heightpreview' =>450
								  );
		$arr = array($sitemap['sitemapid'],0,$sitemap['sitemapname'],$template,$medias);
		
		@$this->data['output'] = "<h1>".$sitemap['sitemapname']."</h1>";
       	@$this->data['output'] .= $this->loadModule('module/productlist','getAll',$arr);
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
	private function loadSiteBar()
	{
		//Left sitebar
		$this->data['leftsitebar']['searchproduct'] = $this->loadModule('sitebar/searchproduct');
		$arr = array('sanpham');
		$this->data['leftsitebar']['produtcategory'] = $this->loadModule('sitebar/catalogue','index',$arr);
		$this->data['leftsitebar']['cart'] = $this->loadModule('sitebar/cart');
		$this->data['leftsitebar']['gallery'] = $this->loadModule('sitebar/gallery');
		//$this->data['leftsitebar']['faq'] = $this->loadModule('sitebar/faq');
		
		//$this->data['leftsitebar']['supportonline'] = $this->loadModule('sitebar/supportonline');
		//$this->data['leftsitebar']['exchange'] = $this->loadModule('sitebar/exchange');
		//$this->data['leftsitebar']['weblink'] = $this->loadModule('sitebar/weblink');
		//$this->data['leftsitebar']['hitcounter'] = $this->loadModule('sitebar/hitcounter');
		
		//Rigth sitebar
		/*$this->data['rightsitebar']['login'] = $this->loadModule('sitebar/login');
		$this->data['rightsitebar']['search'] = $this->loadModule('sitebar/search');
		$this->data['rightsitebar']['cart'] = $this->loadModule('sitebar/cart');
		$this->data['rightsitebar']['banner'] = $this->loadModule('sitebar/banner');
		$this->data['rightsitebar']['question'] = $this->loadModule('sitebar/question');*/
	}
	
	function getSanPhanHot()
	{
		$this->load->model('core/sitemap');
		$this->load->model('core/media');
		$data_media = array();
		$listmediaid = $this->model_core_media->getInformation("sortsanphamhot","sort");
		$arrmediaid = array();
		
		$arrmediaid = $this->string->referSiteMapToArray($listmediaid);
			
		
			
		foreach($arrmediaid as $mediaid)
		{
			$media = $this->model_core_media->getItem($mediaid);
			if(@$media['status']== 'active')
				$data_media[] = $media;
		}
			
		return $data_media;
		
	}
	
	function getProduct($rootid)
	{
		$this->load->model('core/sitemap');
		$this->load->model('core/media');
		$data_media = array();
		$listmediaid = $this->model_core_media->getInformation("sort".$rootid,"sort");
		$arrmediaidsanphamhot = array();
		$listmediaidsanphamhot = $this->model_core_media->getInformation("sortsanphamhot","sort");
		$arrmediaidsanphamhot = $this->string->referSiteMapToArray($listmediaidsanphamhot);
			
		$where = " AND mediatype = 'module/product'";
		$where .= " AND mediaparent = ''";
		if(@$listmediaid!="")
		{
			$arrmediaid = $this->string->referSiteMapToArray($listmediaid);
			foreach($arrmediaid as $mediaid)
			{
				$media = $this->model_core_media->getItem($mediaid);
				if(@$media['status']== 'active' && !in_array($media['mediaid'],$arrmediaidsanphamhot))
					$data_media[] = $media;
			}
			$where .= " AND mediaid NOT IN ('".implode("','",$arrmediaid)."')";
		}
		
		$siteid = $this->member->getSiteId();
		$sitemaps = array();
		
		if(@$rootid != "")
		{
			$this->model_core_sitemap->getTreeSitemap($rootid,$sitemaps, $siteid);
			$arrsitemapid = $this->string->matrixToArray($sitemaps,"sitemapid");
		}
		
		
		
		if(count($arrsitemapid))
		{
			foreach($arrsitemapid as $item)
			{
				$arr[] = " refersitemap like '%[".$item."]%'";
			}
			$where .= "AND (". implode($arr," OR ").")";
		}
		
		if(count($arrmediaidsanphamhot))
		{
			$where .= " AND mediaid NOT IN ('".implode("','",$arrmediaidsanphamhot)."')";
		}
		//echo $where."<br>";
		$data = array();
		$data = $this->model_core_media->getList($where);
		$data_media = array_merge($data_media,$data);
		return $data_media;
	}
}
?>