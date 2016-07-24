<?php
class ControllerSalesSale extends Controller
{
	private $error = array();
	private $shopid;
	function __construct()
	{
		@$this->load->model("core/module");
		$moduleid = $_GET['route'];
		@$this->document->title = @$this->model_core_module->getBreadcrumbs($moduleid);
		if(@$this->user->checkPermission($moduleid)==false)
		{
			@$this->response->redirect('?route=page/home');
		}
		
		@$this->data['loaiphieu'] = array(
											'NK-CH' => 'Trả hàng về kho',
											'CH-BH' => 'Phiếu bán hàng'
										);
		
		@$this->load->model("sales/shop");
		@$this->load->model("quanlykho/nhanvien");
		@$this->load->model("core/media");
		@$this->load->model("core/category");
		@$this->load->model("core/sitemap");
		@$this->load->model("quanlykho/phieunhapxuat");
		@$this->load->helper('image');
		
		$where = " ORDER BY shopname";
		@$this->data['data_shop'] = @$this->model_sales_shop->getList($where);
		
		$this->data['nhanhieu'] = $this->model_core_category->getChild('nhanhieu');
		
		
		$this->data['status'] = array();
		$this->model_core_category->getTree("status",$this->data['status']);
		unset($this->data['status'][0]);
		
		$this->data['orderstatus'] = array();
		$this->model_core_category->getTree("orderstatus",$this->data['orderstatus']);
		unset($this->data['orderstatus'][0]);
		
		$this->data['sitemaps'] = array();
		$this->model_core_sitemap->getTreeSitemap("", $this->data['sitemaps']);
		
		$this->data['shipper'] = array();
		$this->model_core_category->getTree("shipper",$this->data['shipper']);
		unset($this->data['shipper'][0]);
		
		$this->data['payment'] = array();
		$this->model_core_category->getTree("payment",$this->data['payment']);
		unset($this->data['payment'][0]);
		
		$nhanvien = @$this->user->getNhanVien();
		$staffshop = @$this->model_sales_shop->getShopStaff($nhanvien['id']);
		$this->shopid = $staffshop['shopid'];
		
	}
	public function index()
	{
		$nhanvien = @$this->user->getNhanVien();
		$staffshop = @$this->model_sales_shop->getShopStaff($nhanvien['id']);
		@$this->data['shopid'] = $staffshop['shopid'];
		@$this->id='content';
		@$this->template="sales/sale.tpl";
		@$this->layout="layout/center";
		@$this->render();
	}
	public function listOrder()
	{
		$shopid = @$this->request->get['shopid'];
		$where = " AND shopid = '".$shopid."' AND `loaiphieu` = 'CH-BH' AND trangthai  <> 'paid' AND trangthai <> 'ordercancel'";
		$data = @$this->model_quanlykho_phieunhapxuat->getList($where);
		$arrdate = array();
		$data_order = array();
		foreach($data as $key => $item)
		{
			$ngaylap = @$this->date->getDate($item['ngaylap']);
			if(!in_array($ngaylap,$arrdate))
			{
				$arrdate[] = $ngaylap;
			}
		}
		rsort($arrdate);
		foreach($arrdate as $date)
		{
			foreach($data as $item)
			{
				$ngaylap = @$this->date->getDate($item['ngaylap']);
				if(@$ngaylap == $date)
				{
					$data_order[$date][] = $item;
				}
				 	
			}
			
				
		}
		@$this->data['output'] = json_encode($data_order);
		@$this->id='content';
		@$this->template='common/output.tpl';
		@$this->render();
		
	}
	public function listOrderComplete()
	{
		$shopid = @$this->request->get['shopid'];
		
		@$this->id='content';
		@$this->template='sales/sale_order.tpl';
		@$this->render();
		
	}
	public function listOrderCompleteData()
	{
		$shopid = @$this->request->get['shopid'];
		$datasearchlike['maphieu'] = urldecode(@$this->request->get['maphieu']);
		$datasearchlike['tenkhachhang'] = urldecode(@$this->request->get['tenkhachhang']);
		$datasearchlike['dienthoai'] = urldecode(@$this->request->get['dienthoai']);
		$datasearchlike['diachi'] = urldecode(@$this->request->get['diachi']);
		$datasearchlike['trangthai'] = urldecode(@$this->request->get['trangthai']);
		$where = " AND shopid = '".$shopid."' AND `loaiphieu` = 'CH-BH'";
		
		$arr = array();
		foreach($datasearchlike as $key => $item)
		{
			if(@$item !="")
				$arr[] = " AND " . $key ." like '%".$item."%'";
		}
		
		$where .= implode("",$arr);
		$tungay = @$this->date->formatViewDate(urldecode(@$this->request->get['tungay']));
		if(@$tungay !="")
		{
			$where .= " AND ngaylap >= '".$tungay."'";
		}
		$denngay = @$this->date->formatViewDate(urldecode(@$this->request->get['denngay']));
		if(@$denngay !="")
		{
			$where .= " AND ngaylap <= '".$denngay." 23:59:59'";
		}
		
		@$this->data['data_order'] = @$this->model_quanlykho_phieunhapxuat->getList($where);
		@$this->id='content';
		@$this->template='sales/sale_order_data.tpl';
		@$this->render();
	}
	public function delOrder() 
	{
		$id=@$this->request->get['id'];
		@$this->model_quanlykho_phieunhapxuat->destroy($id);
		@$this->data['output'] = "Xóa thành công";
		
		@$this->id="content";
		@$this->template="common/output.tpl";
		@$this->render();
  	}
	public function getOrder()
	{
		$id = @$this->request->get['id'];
		$data = @$this->model_quanlykho_phieunhapxuat->getItem($id);
		$data['ngaylap'] = @$this->date->formatMySQLDate($data['ngaylap']);
		$data['shipdate'] = @$this->date->formatMySQLDate($data['shipdate']);
		//Lap chi tiet
		$where = " AND phieuid = '".$id."' ORDER BY `vitri` ASC";
		$data['detail'] = @$this->model_quanlykho_phieunhapxuat->getPhieuNhapXuatMediaList($where);
		
		@$this->data['output'] = json_encode($data);
		@$this->id='content';
		@$this->template='common/output.tpl';
		@$this->render();
	}
	public function listProduct()
	{
		$shopid = @$this->request->get['shopid'];
		//Lay cac san pham co nhap cho shop
		$where = " AND shopid = '".$shopid."' Group by mediaid ";
		$data_nhapxuatmedia = @$this->model_quanlykho_phieunhapxuat->getPhieuNhapXuatMediaList($where);
		$arr_mediaid = @$this->string->matrixToArray($data_nhapxuatmedia,'mediaid');
		$where = " AND mediatype = 'module/product' AND mediaid in ('".implode("','",$arr_mediaid)."')";
		
		$sitemapid = urldecode(@$this->request->get['sitemapid']);
		@$this->data['sitemapid'] = $sitemapid;
		$siteid = @$this->user->getSiteId();
		if(@$sitemapid != "")
		{
			$data = array();
			$sitemaps = @$this->model_core_sitemap->getTreeSitemap($sitemapid,$data,$siteid);
			$arrsitemapid = @$this->string->matrixToArray($data,"sitemapid");
		}
		$arr = array();
		if(@$sitemapid)
			foreach($arrsitemapid as $sitemapid)
			{
				$arr[] = " refersitemap like '%[".$sitemapid."]%'";
			}
		if(count($arr))
			$where .= "AND (". implode($arr," OR ").")";
		
		@$status = urldecode(@$this->request->get['status']);
		if(@$status !="")
		{
			$where .= " AND groupkeys like '%[".$status."]%'";
		}
		$keyword = urldecode(@$this->request->get['keyword']);
		@$keyword = preg_replace("/[^a-zA-Z0-9]/", " ", $keyword);
		
		if(@$keyword !="")
		{
			@$arrkey = split(' ', $keyword);
			$arr = array();
			
			foreach($arrkey as $key)
			{
				$arr[] = "keyword like '%".$key."%'";
			}
			
			
			$where .= " AND (". implode(" AND ",$arr). ")";
			
		}
		$brand = urldecode(@$this->request->get['brand']);
		if(@$brand !="")
		{
			$where .= " AND brand like '".$brand."'";
		}
		$grouppro = urldecode(@$this->request->get['grouppro']);
		if(@$grouppro !="")
		{
			$where .= " AND grouppro like '".$grouppro."'";
		}
		
		$page = urldecode(@$this->request->get['page']);
		$limt = urldecode(@$this->request->get['limt']);
		$data_product = @$this->model_core_media->getList($where." Order by `title` LIMIT ".$page * $limt. ", ".$limt);
		@$this->data['data_product'] = array();
		foreach($data_product as $i => $media)
		{
			$media['Inventory'] = @$this->model_core_media->getShopInventory($shopid,$media['mediaid']);
			$media['icon'] = HelperImage::resizePNG($media['imagepath'], 100, 100);		
			@$this->data['data_product'][]=$media;
		}
		
		$arr_brand = array();
		/*
		
		foreach($data_product as $i => $media)
		{
			$media['Inventory'] = @$this->model_core_media->getShopInventory($shopid,$media['mediaid']);
			$media['icon'] = HelperImage::resizePNG($media['imagepath'], 100, 100);		
			@$this->data['data_product'][$media['brand']][]=$media;
		}
		
		$cat = array(
					'categoryid'=>'',
					'categoryname' => 'Chưa có nhãn hiệu'
					);
		@$this->data['nhanhieu'][] = $cat;*/
		
		@$this->id='content';
		@$this->template="sales/sale_product.tpl";
		@$this->render();	
	}
	public function save()
	{
		$data = @$this->request->post;
		
		if(@$this->validateForm($data))
		{
			$nhanvien = @$this->user->getNhanVien();
			$data['ngaylap'] = @$this->date->formatViewDate($data['ngaylap']);
			$data['shipdate'] = @$this->date->formatViewDate($data['shipdate']);
			$data['ngaythanhtoan'] = @$this->date->formatViewDate($data['ngaythanhtoan']);
			if(@$data['nguoithuchien']=="")
			{
				$data['nguoithuchienid'] = $nhanvien['id'];
				$data['nguoithuchien'] = $nhanvien['hoten'];
			}
			//$data['loaiphieu'] = @$this->loaiphieu;
			$data['id'] = @$this->model_quanlykho_phieunhapxuat->save($data);
			$phieu = @$this->model_quanlykho_phieunhapxuat->getItem($data['id']);
			
			//Xoa dinh luong
			$delnhapkho = $data['delnhapkho'];
			if(@$delnhapkho)
			{
				@$arr_nhapkhoid = split(",",$delnhapkho);
				if(count($arr_nhapkhoid))
				{
					
					foreach($arr_nhapkhoid as $nhapkhoid)
					{
						
						@$this->model_quanlykho_phieunhapxuat->deletePhieuNhapXuatMedia($nhapkhoid);
						
						
					}
					
				}
			}
			//Save chi tiet phieu nhap
			$tongtien = 0;
			@$nhapkhoid = $data['nhapkhoid'];
			@$phieuid = $data['id'];
			@$arr_mediaid = $data['mediaid'];
			@$arr_code = $data['code'];
			@$arr_title = $data['title'];
			@$arr_soluong = $data['soluong'];
			@$arr_madonvi = $data['dlmadonvi'];
			@$arr_giatien = $data['giatien'];
			@$arr_giamgia = $data['giamgia'];
			@$arr_phantramgiamgia = $data['phantramgiamgia'];
			@$arr_xuattu = $data['xuattu'];
			$index = 0;
			foreach($arr_mediaid as $i => $mediaid)
			{
				@$dl['id'] = $nhapkhoid[$i];
				@$dl['phieuid'] = $phieuid;
				@$dl['mediaid'] = $mediaid;
				@$dl['code'] = $arr_code[$i];
				@$dl['title'] = $arr_title[$i];
				@$dl['soluong'] = $arr_soluong[$i];
				@$dl['madonvi'] = $arr_madonvi[$i];
				@$dl['giatien'] = $arr_giatien[$i];
				@$dl['giamgia'] = $arr_giamgia[$i];
				@$dl['phantramgiamgia'] = $arr_phantramgiamgia[$i];
				@$dl['xuattu'] = $arr_xuattu[$i];
				@$dl['loaiphieu'] = $phieu['loaiphieu'];
				
				@$dl['maphieu'] = $phieu['maphieu'];
				@$dl['ngaylap'] = $phieu['ngaylap'];
				@$dl['nguoilap'] = $phieu['nguoilap'];
				@$dl['nhacungcapid'] = $phieu['nhacungcapid'];
				@$dl['tennhacungcap'] = $phieu['tennhacungcap'];
				@$dl['khachhangid'] = $phieu['khachhangid'];
				@$dl['tenkhachhang'] = $phieu['tenkhachhang'];
				@$dl['shopid'] = $phieu['shopid'];
				@$dl['nguoigiao'] = $phieu['nguoigiao'];
				@$dl['nguoinhanid'] = $phieu['nguoinhanid'];
				@$dl['nguoinhan'] = $phieu['nguoinhan'];
				@$dl['vitri'] = $index;
				@$this->model_quanlykho_phieunhapxuat->savePhieuNhapXuatMedia($dl);
				$tongtien += @$this->string->toNumber($dl['soluong'])*@$this->string->toNumber($dl['giatien']);
				$index++;
				//Cap nhat ton kho
				//$inventory = @$this->model_core_media->getInventory($mediaid);
				//@$this->model_core_media->updateCol($mediaid,'inventory',$inventory);
				$arr = array($mediaid);
				$this->loadModule('module/product','updateProductInventory',$arr);
				
			}
			//@$this->model_quanlykho_phieunhapxuat->updateCol($phieuid,'tongtien',$tongtien);
			//@$this->model_quanlykho_phieunhapxuat->updateCol($phieuid,'congno',$tongtien- @$this->string->toNumber($data['thanhtoan']));
			$phieu['error'] ='';
			@$this->data['output'] = json_encode($phieu);
			if(isset($_SESSION['productlist']))
			{
				unset($_SESSION['productlist']);	
			}
		}
		else
		{
			$phieu['error'] ='';
			foreach(@$this->error as $item)
			{
				$phieu['error'] .= $item."<br>";
			}
			@$this->data['output'] = json_encode($phieu);
		}
		@$this->id='content';
		@$this->template='common/output.tpl';
		@$this->render();
	}
	
	private function validateForm($data)
	{
		/*if(@$data['congno']!=0 && $data['trangthai'] == 'delivered')
		{
			@$this->error['trangthai'] = 'Đơn hàng chưa thanh toán!';
		}*/
		if (count(@$this->error)==0) {
	  		return TRUE;
		} else {
	  		return FALSE;
		}
	}
	public function history()
	{
		$shopid = @$this->request->get['shopid'];
		if($shopid == "")
			$shopid = $this->shopid;
		$mediaid = @$this->request->get['mediaid'];
		@$tungay = @$this->request->get['tungay'];
		@$denngay = @$this->request->get['denngay'];
		$where1 = "";
		if(@$tungay != "")
		{
			$where1 .= " AND ngaylap >= '".$tungay."'";
		}
		if(@$denngay != "")
		{
			$where1 .= " AND ngaylap < '".$denngay." 23:59:59'";
		}
		//Nhap
		$where = $where1." AND shopid = '".$shopid."' AND mediaid = '".$mediaid."' AND loaiphieu in ('PX-XCH','CH-NK') ORDER BY `ngaylap` DESC";
		$data_nhap = @$this->model_quanlykho_phieunhapxuat->getPhieuNhapXuatMediaList($where);
		//Xuat
		
		$where = $where1." AND shopid = '".$shopid."' AND mediaid = '".$mediaid."' AND loaiphieu in ('CH-BH','NK-CH') ORDER BY `ngaylap` DESC";
		$data_xuat = @$this->model_quanlykho_phieunhapxuat->getPhieuNhapXuatMediaList($where);
		
		
		$arrdate = array();
		foreach($data_nhap as $item)
		{
			$ngaylap = @$this->date->getDate($item['ngaylap']);
			if(!in_array($ngaylap,$arrdate))
			{
				$arrdate[] = @$this->date->getDate($item['ngaylap']);
			}
		}
		foreach($data_xuat as $item)
		{
			$ngaylap = @$this->date->getDate($item['ngaylap']);
			if(!in_array($ngaylap,$arrdate))
			{
				$arrdate[] = @$this->date->getDate($item['ngaylap']);
			}
		}
		
		sort($arrdate);
		foreach($arrdate as $date)
		{
			foreach($data_nhap as $item)
			{
				$ngaylap = @$this->date->getDate($item['ngaylap']);
				if(@$ngaylap == $date)
				{
					@$this->data['nhapxuat'][$date]['nhap'][] = $item;
				}
			}
			foreach($data_xuat as $item)
			{
				$ngaylap = @$this->date->getDate($item['ngaylap']);
				if(@$ngaylap == $date)
				{
					@$this->data['nhapxuat'][$date]['xuat'][] = $item;
				}
			}
			
		}
		//print_r(@$this->data['nhapxuat']);
		@$this->id='content';
		@$this->template="sales/sale_product_history.tpl";
		@$this->render();
	}
	public function productShop()
	{
		@$this->id='content';
		@$this->template="sales/sale_product_shop.tpl";
		@$this->render();
	}
	public function report()
	{
		@$this->id='content';
		@$this->template="sales/sale_report.tpl";
		@$this->layout="layout/center";
		@$this->render();
	}
	public function reportView()
	{
		
		$data = @$this->request->post;
		$shopid = $this->shopid;
		$tungay = @$this->date->formatViewDate($data['tungay']);
		$denngay = @$this->date->formatViewDate($data['denngay']);
		$brand = @$data['brand'];
		$keyword = @$data['keyword'];
		$sitemapid = @$data['sitemapid'];
		$grouppro = @$data['grouppro'];
		
		
		if(@$keyword !="")
		{
			@$arrkey = split(' ', $keyword);
			$arr = array();
			
			foreach($arrkey as $key)
			{
				$arr[] = "keyword like '%".$key."%'";
			}
			
			
			$where .= " AND (". implode(" AND ",$arr). ")";
			
		}
		
		if(@$brand !="")
		{
			@$where .= " AND brand like '".$brand."'";
		}
		
		if(@$grouppro !="")
		{
			$where .= " AND grouppro like '".$grouppro."'";
		}
		
		if(@$sitemapid)
			$where .= " AND refersitemap like '%[".$sitemapid."]%'";
		
		
		$where .= " AND mediatype = 'module/product' Order By `title`";
		$medias = $this->model_core_media->getList($where);
		@$data_product = array();
		$arrsitemap = array();
		foreach($medias as $media)
		{
			$child = $this->model_core_media->getListByParent($media['mediaid']);
			if(count($child) == 0)
			{
				
				//Ton dau ky
				$media['tondauky'] = $this->model_core_media->getShopInventory($shopid,$media['mediaid'],'',$this->date->addday($tungay,-1));
				//Nhap trong ky
				//Nhap tu kho
				$arrnhap = @$this->model_core_media->getShopSoLuong($shopid,$media['mediaid'],'PX-XCH',$tungay,$denngay);
				$soluongnhap = @$this->model_quanlykho_donvitinh->toDonViTinh($arrnhap,$media['unit']);
				$int_nhap = @$this->model_quanlykho_donvitinh->toInt($soluongnhap);
				//Nhap tu NCC
				$arrnhapncc = @$this->model_core_media->getShopSoLuong($shopid,$media['mediaid'],'CH-NK',$tungay,$denngay);
				$soluongnhapncc = @$this->model_quanlykho_donvitinh->toDonViTinh($arrnhapncc,$media['unit']);
				$int_nhapncc = @$this->model_quanlykho_donvitinh->toInt($soluongnhapncc);
				$media['nhaptrongky'] = $int_nhap + $int_nhapncc;
				//Xuat trong ky
				//Xuat ban
				$arrxuatban = @$this->model_core_media->getShopSoLuong($shopid,$media['mediaid'],'CH-BH',$tungay,$denngay);
				$soluongxuatban = @$this->model_quanlykho_donvitinh->toDonViTinh($arrxuatban,$media['unit']);
				$int_xuatban = @$this->model_quanlykho_donvitinh->toInt($soluongxuatban);
				//Xuat ve kho
				$arrxuatvekho = @$this->model_core_media->getShopSoLuong($shopid,$media['mediaid'],'NK-CH',$tungay,$denngay);
				$soluongxuatvekho = @$this->model_quanlykho_donvitinh->toDonViTinh($arrxuatvekho,$media['unit']);
				$int_xuatvekho = @$this->model_quanlykho_donvitinh->toInt($soluongxuatvekho);
				$media['xuattrongky'] = $int_xuatban + $int_xuatvekho;
				if(!($media['tondauky']==0 && $media['nhaptrongky'] ==0 && $media['xuattrongky'] == 0))
				{
				//Ton cuoi ky
					$media['toncuoiky'] = $media['tondauky'] + $media['nhaptrongky'] - $media['xuattrongky'];
					
					@$data_product[] = $media;
				}
			}
		}
		foreach($this->data['sitemaps'] as $sitemap)
		{
			$this->data['data_product'][$sitemap['sitemapid']]= array();
		}
		foreach($data_product as $media)
		{
			$arr = $this->string->referSiteMapToArray($media['refersitemap']);
			$this->data['data_product'][$arr[0]][] = $media;
		}
		$this->data['tungay'] = $tungay;
		$this->data['denngay'] = $denngay;
		//print_r($this->data['data_product']);
		//$this->data['data_product'] = $data_product;
		@$this->id='content';
		@$this->template="sales/sale_report_view.tpl";
		@$this->render();		
	}
	
	public function reportSale()
	{
		@$this->id='content';
		@$this->template="sales/sale_report_sale.tpl";
		@$this->layout="layout/center";
		@$this->render();
	}
	public function reportSaleView()
	{
		$data = @$this->request->post;
		$shopid = $this->shopid;
		$tungay = @$this->date->formatViewDate($data['tungay']);
		$denngay = @$this->date->formatViewDate($data['denngay']);
		$tenkhachhang = @$data['tenkhachhang'];
		$shipby = @$data['shipby'];
		$payment = @$data['payment'];
		$where = " AND shopid = '".$shopid."' AND `loaiphieu` = 'CH-BH'";
		if($tenkhachhang)
		{
			$where.= " AND tenkhachhang like '%".$tenkhachhang."%'";	
		}
		if($shipby)
		{
			$where.= " AND shipby like '".$shipby."'";	
		}
		if($payment)
		{
			$where.= " AND payment like '".$payment."'";	
		}
		if(@$tungay != "")
		{
			$where .= " AND ngaylap >= '".$tungay."'";
		}
		if(@$denngay != "")
		{
			$where .= " AND ngaylap < '".$denngay." 23:59:59'";
		}
		
		$this->data['data_order'] = $this->model_quanlykho_phieunhapxuat->getList($where,0,0,"  Order by id");
		
		@$this->id='content';
		@$this->template="sales/sale_report_sale_view.tpl";
		@$this->render();
	}
	
}
?>