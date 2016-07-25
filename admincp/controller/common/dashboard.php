<?php
class ControllerCommonDashboard extends Controller
{
	function __construct() 
	{
		@$this->load->helper('image');
		$this->data['statusPro'] = array(
										'sanphamhot' => 'Sản phẩm hot',
										'sanphamkhuyenmai' => 'Sản phẩm khuyến mãi',
										'sanphammoi' => 'Sản phẩm mới',
										'sanphamdatbiet' => 'Sản phẩm đặt biệt',
										);
	}
	function index()
	{	
		@$this->getForm();
		@$this->id='content';
		@$this->template='common/dashboard.tpl';
		@$this->layout="layout/center";
		@$this->render();
	}
	
	private function getForm()
	{
		
		@$this->load->model("core/media");
		@$this->load->model("core/category");
		@$this->load->helper('image');
		@$this->data['item']['mediaid'] = "setting";
		@$this->data['item']['Title'] = @$this->model_core_media->getInformation(@$this->data['item']['mediaid'], 'Title');
		@$this->data['item']['Slogan'] = @$this->model_core_media->getInformation(@$this->data['item']['mediaid'], 'Slogan');
		@$this->data['item']['Currency'] = @$this->model_core_media->getInformation(@$this->data['item']['mediaid'], 'Currency');
		@$this->data['item']['EmailContact'] = @$this->model_core_media->getInformation(@$this->data['item']['mediaid'], 'EmailContact');
		@$this->data['item']['HeaderBill'] = @$this->model_core_media->getInformation(@$this->data['item']['mediaid'], 'HeaderBill');
		@$this->data['item']['Keyword'] = @$this->model_core_media->getInformation(@$this->data['item']['mediaid'], 'Keyword');
		@$this->data['item']['Description'] = @$this->model_core_media->getInformation(@$this->data['item']['mediaid'], 'Description');	
		
		foreach($this->data['statusPro'] as $key => $val)
		{
			$list_mediaid = json_decode(@$this->model_core_media->getInformation(@$this->data['item']['mediaid'],$key));
			
			foreach($list_mediaid as $mediaid)
			{
				$media = $this->model_core_media->getItem($mediaid);
				
				$this->data['item'][$key] .= '<div class="left dashboardproduct"><img src="'. HelperImage::resizePNG($media['imagepath'], 100, 100) .'">'. @$this->document->productName($media) .'<input type="hidden" name="'. $key .'[]" value="'. $media['mediaid'] .'"><input type="button" class="button btn_removeProduct" value="Xóa"></div>';
			}
			
			
		}
	}
	
	public function save()
	{
		$data = @$this->request->post;
		
		@$this->load->model("core/media");
		//Save setting
		@$this->model_core_media->saveInformation($data['mediaid'],"Title",$data['Title']);
		@$this->model_core_media->saveInformation($data['mediaid'],"Slogan",$data['Slogan']);
		@$this->model_core_media->saveInformation($data['mediaid'],"Currency",$data['Currency']);
		@$this->model_core_media->saveInformation($data['mediaid'],"EmailContact",$data['EmailContact']);
		@$this->model_core_media->saveInformation($data['mediaid'],"HeaderBill",$data['HeaderBill']);
		@$this->model_core_media->saveInformation($data['mediaid'],"Keyword",$data['Keyword']);
		@$this->model_core_media->saveInformation($data['mediaid'],"Description",$data['Description']);
		
		foreach($this->data['statusPro'] as $key => $val)
		{
			@$this->model_core_media->saveInformation($data['mediaid'],$key,json_encode($data[$key]));
		}
		
		@$this->data['output'] = "true";
		
		@$this->id='content';
		@$this->template='common/output.tpl';
		@$this->render();
	}
}
?>