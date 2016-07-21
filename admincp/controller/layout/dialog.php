<?php
class ControllerLayoutDialog extends Controller
{
	public function index()
	{
		@$this->template="layout/dialog.tpl";
		@$this->children=array(
				
				
				);
				@$this->render();
	}
}
?>