<?php
	class ControllerCommonHeader extends Controller
	{
		public function index()
		{
			$sitemapid = "hotroonline";
			$siteid = $this->member->getSiteId();
			$this->load->model("core/media");
			$this->load->model("core/sitemap");
			$this->data['sitemap'] = $this->model_core_sitemap->getItem($sitemapid, $siteid);
			$this->data['media'] = $this->model_core_media->getItem($siteid.$sitemapid);
			@$this->data['supportonline'] = html_entity_decode($this->data['media']['description']);
			
			$this->id="header";
			$this->template="common/header.tpl";
			switch(SKIN)
			{
				case "skin4":
					$this->data['mainmenu'] = $this->getMenuMobile("sanpham");
					$this->data['brand'] = $this->getBrand("nhanhieu");
					break;
				default:
					$this->data['mainmenu'] = $this->getMenu("sanpham");
					//$this->data['brand'] = $this->getBrand("nhanhieu");
					break;
			}
			
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
					$currenttab = "class='current-tab'";
				
				$link = "<a ".$currenttab.">".$item['sitemapname']."</a>";
				
				if(@$item['moduleid'] != "group")
				{
					//$link = "<a ".$currenttab." href='index.php?route=page/detail&sitemapid=".$item['sitemapid']."'>".$item['sitemapname']."</a>";
					$link = "<a ".$currenttab." href='".$this->document->createLink($item['sitemapid'])."' title='".$item['sitemapname']."' data-transition='fade' data-ajax='false'>".html_entity_decode($item['sitemapname'])."</a>";
				}
				if(@$item['moduleid'] == "homepage"){
					$link = "<a ".$currenttab." href='".HTTP_SERVER."'>".html_entity_decode($item['sitemapname'])."</a>";
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
		public function getMenuMobile($parentid)
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
					$currenttab = "class='current-tab'";
				
				//$link = "<a ".$currenttab.">".$item['sitemapname']."</a>";
				
				if(count($childs)==0)
				{
					//$link = "<a ".$currenttab." href='index.php?route=page/detail&sitemapid=".$item['sitemapid']."'>".$item['sitemapname']."</a>";
					$link = "<li><a ".$currenttab." href='".$this->document->createLink($item['sitemapid'])."' title='".$item['sitemapname']."' data-transition='fade' data-ajax='false'>".html_entity_decode($item['sitemapname'])."</a>";
				}
				else
				{
					$link ='<li data-role="collapsible" data-enhanced="true" data-collapsed-icon="carat-d" data-expanded-icon="carat-u" data-iconpos="right" data-inset="false" class="ui-collapsible ui-collapsible-themed-content ui-collapsible-collapsed">
                        <h3 class="ui-collapsible-heading ui-collapsible-heading-collapsed">
                            <a href="'.$this->document->createLink($item['sitemapid']).'" class="ui-collapsible-heading-toggle ui-btn ui-btn-icon-right ui-btn-inherit ui-icon-carat-d">
                                '.$item['sitemapname'].'<span class="ui-collapsible-heading-status"> click to expand contents</span>
                            </a>
                        </h3>';
				}
				
				$str .= $link;
				
				if(count($childs) > 0)
				{
					$str .= '<div class="ui-collapsible-content ui-body-inherit ui-collapsible-content-collapsed" aria-hidden="true">';
					$str .= "<ul>";
					$str .= $this->getMenuMobile($item['sitemapid']);
					$str .= "</ul>";
					$str .= "</div>";
				}

				$str .= "</li>";
			}
			
			return $str;
			
		}
		public function getBrand($parentid)
		{
			$this->load->model("core/category");
			
			$str = "";
			
			
			$cats = $this->model_core_category->getChild($parentid);
			
			foreach($cats as $item)
			{
				$childs = $this->model_core_category->getChild($item['categoryid']);
				
				
				if(count($childs) > 0)
				{
					$link = '<a class="trigger right-caret">'.$item['categoryname'].'</a>';	
				}
				else
				{
					$link = "<a href='".$this->document->createLink('brand',$item['categoryid'])."' title='".$item['categoryname']."'>".$item['categoryname']."</a>";	
				}
				
				if(count($childs)==0)
				{
					//$link = "<a ".$currenttab." href='index.php?route=page/detail&sitemapid=".$item['sitemapid']."'>".$item['sitemapname']."</a>";
					@$link = "<li><a ".$currenttab." href='".$this->document->createLink('brand',$item['categoryid'])."' title='".$item['categoryname']."' data-transition='fade' data-ajax='false'>".html_entity_decode($item['categoryname'])."</a>";
				}
				else
				{
					$link ='<li data-role="collapsible" data-enhanced="true" data-collapsed-icon="carat-d" data-expanded-icon="carat-u" data-iconpos="right" data-inset="false" class="ui-collapsible ui-collapsible-themed-content ui-collapsible-collapsed">
                        <h3 class="ui-collapsible-heading ui-collapsible-heading-collapsed">
                            <a href="#" class="ui-collapsible-heading-toggle ui-btn ui-btn-icon-right ui-btn-inherit ui-icon-carat-d">
                                '.$item['categoryname'].'<span class="ui-collapsible-heading-status"> click to expand contents</span>
                            </a>
                        </h3>';
				}
				$str .= $link;
				if(count($childs) > 0)
				{
					$str .= '<div class="ui-collapsible-content ui-body-inherit ui-collapsible-content-collapsed" aria-hidden="true">';
					$str .= '<ul>';
					$str .= $this->getBrand($item['categoryid']);
					$str .= '</ul>';
					$str .= "</div>";
				}

				$str .= "</li>";
			}
			
			return $str;
			
		}
	}
?>