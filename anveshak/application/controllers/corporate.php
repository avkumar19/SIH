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




class Corporate extends MY_controller
{


	/**
	 * Include class constructor 
	 * 
	 */
	
	function __construct()
	{
		parent::__construct(array('corp'));
		$this->load->model('basic_model','basic');
		$this->load->model('corp_model','corp');
	}


	/**
	 * Default Home controller function
	 * 
	 */

	public function index()
	{
		$this->drawHeader('Corporate Home','Feed');
		$this->drawFooter();
	}

	public function post_problem()
	{

		$this->drawHeader('Post Your Problem');
		$tags=$this->basic->get_all_data('vertical');
		$this->load->view('post_problem',array('tags'=>$tags));
		$this->drawFooter();
	}
	public function submit_problem()
	{
		$id=$this->session->userdata('id');
		$tags=$this->input->post('tags');
		$prob=$this->input->post('problem');
		   

		$res=$this->corp->insert_problem($tags,$prob);
		if($res)
		{
			$this->session->set_flashdata('flashSuccess','Your Problem Posted Successfully'); 
			
		}
		else
		{
			$this->session->set_flashdata('flashError','Error occured while Posting Your Problem');
		}
		redirect(site_url('corporate'));
		
	}
	
}
#################################### END OF Corporate CLASS ############################
?>