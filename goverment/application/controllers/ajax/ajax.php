<?php
 if ( ! defined('BASEPATH')) exit('No direct script access allowed');





#################################### Ajax ###########################

//----------------------------------------------------------------------
/**
  *
  * @author   Prem Sagar
  * @copyright Anveshak
  * Registration class contain  Functionality  related to corporate home page
  * 
  */




class Ajax extends MY_controller{

	public function __construct(){
		parent::__construct();
		$this->load->model('startup/startup_model','startup_model');
		$this->load->model('corporate/corporate_model','corporate_model');

	}

	public function getcontact(){
		
		$reg_id = $this->input->post('reg_id');
		$type = $this->input->post('type');
		if($type === "startup"){
			$result = $this->startup_model->contact_details_by_id($reg_id);
			$ret = json_encode($result);
		}
		else{
			$result = $this->corporate_model->contact_details_by_id($reg_id);
			$ret = json_encode($result);
		}
		echo $ret;
	}

	
}
#################################### END OF Ajax CLASS ############################
?>