<?php
 if ( ! defined('BASEPATH')) exit('No direct script access allowed');





#################################### STARTUP ###########################

//----------------------------------------------------------------------
/**
  *
  * @author   Prem Sagar
  * @copyright Anveshak
  * Registration class contain  Functionality  related to startup home page
  * 
  */




class Profile extends MY_controller
{
	


	/**
	 * Include class constructor 
	 * 
	 */

	function __construct()
	{
		parent::__construct(array('startup','corp'));
		$this->load->model('profile_model','profile');
	}




	/**
	 * Default Home controller function
	 * 
	 */

	public function index()
	{
		$this->view_profile();
		
	}

//#################################################### Profile ###############################

	public function view_profile()
	{
		$type=$this->session->userdata('type');
		$id=$this->session->userdata('id');
		print($id);
		//print($type);
		$basic=$this->profile->get_basic_detail($type,$id);
		$contact=$this->profile->get_contact_detail($type,$id);
		$vision=$this->profile->get_vision($type,$id);
		$tech=$this->profile->get_tech($type,$id);
		$verticals=$this->profile->get_verticals($type,$id);
		$data=[
			'type'=>$type,
			'id'=>$id,
			'basic'=>$basic,
			'contact'=>$contact,
			'vision'=>$vision,
			'tech'=>$tech,
			'verticals'=>$verticals
		];
		$this->drawHeader("Profile",'view profile');
		$this->load->view('profile/view_profile',$data);
		$this->drawFooter();
		//print_r($type.' '.$id);
	}




//#################################################### VISION ###############################

	public function update_vision()
	{
		$type=$this->session->userdata('type');
		$id=$this->session->userdata('id');
		print_r($type.' '.$id);

		// update vision code
	}


	private function open_vision_form()
	{

	}


//#################################################### Contact ###############################

	public function update_contact_detail()
	{
		$type=$this->session->userdata('type');
		$id=$this->session->userdata('id');
		print_r($type.' '.$id);
		//update contact_detail code
	}


//#################################################### Username ###############################	


	public function change_username()
	{
		$type=$this->session->userdata('type');
		$id=$this->session->userdata('id');
		//change username code
	}



	
	
}
#################################### END OF STARTUP CLASS  ################################
?>