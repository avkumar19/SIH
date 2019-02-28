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




class Startup_control extends MY_controller
{


	/**
	 * Include class constructor 
	 * 
	 */
	
	function __construct()
	{
		parent::__construct(array('gov'));
		$this->load->model('startup/startup_model','startup');
		$this->addJS('startup.js');
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

	public function verify_startup()
	{

		$this->drawHeader('Startup','Verify New Registration');
		$result=$this->startup->get_new_startup_reg();
		$data['startups']=$result;
		$this->load->view('startup/new_startup_reg_list',$data);
		$this->drawFooter();

	}
	
	public function view_startup()
	{

		$this->drawHeader('Startup','view Registered startup');
		$this->drawFooter();
		
	}

	public function accept_reg_request($reg_id)
	{
		if(!is_null($reg_id))
		{
			$reg_details=$this->startup->accept_reg_request($reg_id);

		}
	}

	public function reject_reg_request($reg_id='')
	{
		if(!is_null($reg_id))
		{
			$reg_details=$this->startup->reject_reg_request($reg_id);

		}
	}
}


#################################### END OF Corporate CLASS ############################
?>