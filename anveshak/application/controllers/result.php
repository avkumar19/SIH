<?php
 if ( ! defined('BASEPATH')) exit('No direct script access allowed');





#################################### RESULT ###########################

//----------------------------------------------------------------------
/**
  *
  * @author   Prem Sagar
  * @copyright Anveshak
  * Registration class contain  Functionality  related to startup home page
  * 
  */




class Result extends CI_controller
{
	

	var $_login;
	/**
	 * Include class constructor 
	 * 
	 */

	function __construct()
	{
		parent::__construct();
		$this->addJS('home.js');
		$this->addCSS('home.css');
		$this->load->model('basic_model','basic');
		$this->load->model('profile_model','profile');
		$this->login='false';
		if($this->session->userdata('isLoggedIn'))
			$this->login='true';
		$this->load->model('result_model','result');
		
	}





	/**
	 * Default Home controller function
	 * 
	 */

	public function index()
	{
		redirect('home');
		
	}

//#################################################### Profile ###############################

	public function startup_filter_by_category($vert_id)
	{

		$startup_id=$this->result->fetch_startup_by_vetical_id($vert_id);
		$s_id=[];
        foreach ($startup_id as $key) {
          	$s_id[]=$key['startup_id'];
          }  

		$startup_list=$this->result->fetch_startup_detail_by_id($s_id);
		$data=[
			"login"=>$this->login,
			"list"=>$startup_list,
			'type'=>'startup'
		];
		
		$this->load->view('result/list',$data);
		
	}
	public function corp_filter_by_category($vert_id)
	{
		$corp_id=$this->result->fetch_corp_by_vetical_id($vert_id);
		$s_id=[];
		foreach ($corp_id as $key) {
          	$s_id[]=$key['corp_id'];
          }  

		$corp_list=$this->result->fetch_corp_detail_by_id($s_id);
		$data=[
			"login"=>$this->login,
			"list"=>$corp_list,
			'type'=>'crop'
		];
		
		$this->load->view('result/list',$data);
		
	}
	public function search_startup()
	{
		$token=$this->input->get('search');
		$startup_data=$this->result->get_startup_search($token);
		$s_id=$startup_data['id'];
		$startup_list=$this->result->fetch_startup_detail_by_id($s_id);
		$data=[
			"login"=>$this->login,
			"list"=>$startup_list,
			'type'=>'startup',
			'desc'=>$startup_data['data']
		];
		
		$this->load->view('result/list',$data);

	}

	/**
    * utility function to add a js file
    */

	function addJS($js) {
		$this->_js .= "<script type=\"text/javascript\" src=\"".base_url()."assets/js/".$js." \" ></script>";
	}




    /**
    * utility function to add a css file
    */

	function addCSS($css) {
		$this->_css .= "<link rel=\"stylesheet\" type=\"text/css\" href=\"".base_url()."assets/css/".$css."\" />";
	}




}
#################################### END OF PROFILE CLASS  ################################
?>