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
			$this->load->model('core/media');
			//Brand
			$template = array(
						  'template' => "module/category_brand.tpl"
						  );
		
			$arr = array("nhanhieu",$template);
			$this->data['brand'] = $this->loadModule('module/category','getList',$arr);
			//Banner home
			$template = array(
						  'template' => "home/banner.tpl",
						  'width' => 280,
						  'height' =>0
						  );
		
			$arr = array("bannerhome",0,"",$template);
			$this->data['bannerhome'] = $this->loadModule('module/block','getList',$arr);
			
			$list_mediaid = json_decode($this->document->setup['sanphamkhuyenmai']);
			$medias = array();
			foreach($list_mediaid as $mediaid)
			{
				$media = $this->model_core_media->getItem($mediaid);
				$medias[] = $media;
			}
			$template = array(
							  'template' => "module/product_list.tpl",
							  'width' => 150,
							  'height' =>0
							  );
			$arr = array("",0,"",$template,$medias);
			$this->data['sanphamkhuyenmai'] = $this->loadModule('module/productlist','getAll',$arr);
			
			$list_mediaid = json_decode($this->document->setup['sanphammoi']);
			$medias = array();
			foreach($list_mediaid as $mediaid)
			{
				$media = $this->model_core_media->getItem($mediaid);
				$medias[] = $media;
			}
			$template = array(
							  'template' => "module/product_list.tpl",
							  'width' => 150,
							  'height' =>0
							  );
			$arr = array("",0,"",$template,$medias);
			$this->data['sanphammoi'] = $this->loadModule('module/productlist','getAll',$arr);
			
			//San khuyen mai
			/*$template = array(
								  'template' => "module/product_list.tpl",
								  'width' => IMG_PROLIST,
								  'height' =>IMG_PROLIST,
								  'widthpreview' => 450,
								  'heightpreview' =>450
								  );
						  
			$medias = $this->getProduct('sanphamkhuyenmai');
			
			$arr = array($sitemap['sitemapid'],0,$sitemap['sitemapname'],$template,$medias);
			$this->data['producthome']['sanphamhot']['title'] ="Sản phẩm hot";
			$this->data['producthome']['sanphamhot']['data'] = $this->loadModule('module/productlist','getAll',$arr)*/;
			
			
			
					  
			
			
			//$this->loadBrand();
			$this->loadSiteBar();
			
		}
		$this->document->title .= $this->document->setup['Title'];
		$this->id="content";
		$this->template="page/home.tpl";
		$this->layout="layout/home";
		$this->render();
	}
	private function loadSiteBar()
	{
		//Left sitebar
		
		$arr = array('sanpham');
		$this->data['leftsitebar']['produtcategory'] = $this->loadModule('sitebar/catalogue','index',$arr);
		$this->data['leftsitebar']['brand'] = $this->loadModule('sitebar/brand');
		$arr = array('doi-tac');
		$this->data['leftsitebar']['weblink'] = '<div class="head_title"><span>ĐỐI TÁC</span></div>'.$this->loadModule('sitebar/weblink','index',$arr);
		/*$this->data['leftsitebar']['exchange'] = '<div class="clear" style="height:10px;"></div>
                                    <div class="head_title"><span>TỶ GIÁ</span></div>'.$this->loadModule("common/tygia");*/
		/*$this->data['leftsitebar']['searchproduct'] = $this->loadModule('sitebar/searchproduct');
		
		$this->data['leftsitebar']['cart'] = $this->loadModule('sitebar/cart');
		$this->data['leftsitebar']['gallery'] = $this->loadModule('sitebar/gallery');*/
		//$this->data['leftsitebar']['faq'] = $this->loadModule('sitebar/faq');
		
		//$this->data['leftsitebar']['supportonline'] = $this->loadModule('sitebar/supportonline');
		//$this->data['leftsitebar']['exchange'] = $this->loadModule('sitebar/exchange');
		//$this->data['leftsitebar']['weblink'] = $this->loadModule('sitebar/weblink');
		//$this->data['leftsitebar']['hitcounter'] = $this->loadModule('sitebar/hitcounter');
		
		//Rigth sitebar
		$this->data['rightsitebar']['supportonline'] = $this->loadModule('sitebar/supportonline');
		$list_mediaid = json_decode($this->document->setup['sanphamhot']);
		$medias = array();
		foreach($list_mediaid as $mediaid)
		{
			$media = $this->model_core_media->getItem($mediaid);
			$medias[] = $media;
		}
		$template = array(
						  'template' => "sitebar/product_list.tpl",
						  'width' => 120,
						  'height' =>0
						  );
		$arr = array("",0,"",$template,$medias);
		$this->data['rightsitebar']['sanphamhot'] = '<div class="head_title_right"><span>SẢN PHẨM HOT</span></div>'.$this->loadModule('module/productlist','getAll',$arr);
		$template = array(
						  'template' => "sitebar/news_list.tpl",
						  'width' => 55,
						  'height' =>0
						  );
		$arr = array("tin-tuc-hot",0,"",$template);
		$this->data['rightsitebar']['tin-tuc-hot'] = '<div class="head_title_right"><span>TIN TỨC HOT</span></div>'.$this->loadModule('module/pagelist','getList',$arr);
		
		
		
		
		/*$this->data['rightsitebar']['login'] = $this->loadModule('sitebar/login');
		$this->data['rightsitebar']['search'] = $this->loadModule('sitebar/search');
		$this->data['rightsitebar']['cart'] = $this->loadModule('sitebar/cart');
		$this->data['rightsitebar']['banner'] = $this->loadModule('sitebar/banner');
		$this->data['rightsitebar']['question'] = $this->loadModule('sitebar/question');*/
	}
	
	
	function getProduct($status)
    {
        
        //$siteid = $this->member->getSiteId();
        //$sitemaps = $this->model_core_sitemap->getListByModule("module/product", $siteid);
        //$arrsitemapid = $this->string->matrixToArray($sitemaps,"sitemapid");
        $queryoptions = array();
        $queryoptions['mediaparent'] = '';
        $queryoptions['mediatype'] = 'module/product';
        $queryoptions['refersitemap'] = '%';
        $queryoptions['groupkeys'] = $status;
        $data = $this->model_core_media->getPaginationList($queryoptions);

        return $data;
    }
	
}
?>