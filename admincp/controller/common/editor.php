<?php
class ControllerCommonEditor extends Controller
{
	public $validSecure;
	private $error = array();
	function index()
	{
		
		@$this->id='content';
		@$this->template='common/editor.tpl';
		@$this->layout='layout/dialog';
		@$this->render();
	}
	
	
	
	
}
?>