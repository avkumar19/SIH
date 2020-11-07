<?php
 if ( ! defined('BASEPATH')) exit('No direct script access allowed');





#################################### CORPORATE ###########################

//----------------------------------------------------------------------
/**
  *
  * @author   Prem Sagar
  * @copyright Anveshak
  * Registration class contain  Functionality  related to corporate home page
  * 
  */




class Corporate_control extends MY_controller
{


	/**
	 * Include class constructor 
	 * 
	 */
	
	function __construct()
	{
		parent::__construct(array('gov'));
		$this->load->model('corporate/corporate_model','corp');
		$this->addJS('corp.js');
	}


	/**
	 * Default Home controller function
	 * 
	 */

	public function index()
	{
		// $this->drawHeader('Goverment Home','Feed');

		// $this->drawFooter();
		redirect('home');
	}

	public function verify_corporate()
	{

		$this->drawHeader('Corporate','Verify New Registration');
		$result=$this->corp->get_new_corp_reg();
		$data['corps']=$result;
		$this->load->view('corporate/new_corp_reg_list',$data);
		$this->drawFooter();

	}
	
	public function view_corporate()
	{

		$this->drawHeader('Corporate','View Registered Corporate');
		$this->drawFooter();
		
	}

	public function accept_reg_request($reg_id='')
	{
		if(!is_null($reg_id))
		{
			$reg_details=$this->corp->accept_reg_request($reg_id);

		}
	}

	public function reject_reg_request($reg_id='')
	{
		if(!is_null($reg_id))
		{
			$reg_details=$this->corp->reject_reg_request($reg_id);

		}
	}
}
#################################### END OF Corporate CLASS ############################
?>