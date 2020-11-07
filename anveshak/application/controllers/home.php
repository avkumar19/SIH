
+<?php
 if ( ! defined('BASEPATH')) exit('No direct script access allowed');





#################################### HOME  #####################################

//------------------------------------------------------------------------------
/**
  *
  * @author   Prem Sagar
  * @copyright Anveshak
  * Home class contain  Functionality  related to startup and corporate page
  * 
  */



class Home extends CI_Controller{
	
	/**
	* @var $_js store the all js file included
	* @var $_css store the all css file included
	*/

	var $_js = '';
	var $_css = '';
    var $_login;


	/**
	 * Include class constructor 
	 * load home js file and css file
	 */

	function __construct()
	{   
		parent::__construct();
		
		$this->load->model('basic_model','basic');
		$this->load->model('profile_model','profile');
		$this->login='false';
		if($this->session->userdata('isLoggedIn'))
			$this->login='true';

	}



    /**
	 * Default Home controller function
	 * check the user session based on show corporate or startup dashboard
	 * load default home page if session is not set
	 */

	public function index()
	{
           
		$this->addJS('home.js');
		$this->addCSS('home.css');
		$verticals=$this->basic->get_all_data('vertical');
				$data = array(
					  "title" => '',
					  "subtitle" => '',
					  "javascript" => $this->_js,
					  "css" => $this->_css,
					  "login"=>$this->login,
					  "verticals"=>$verticals
					  );
		$this->load->view('home',$data);
	
    }




    /**
     * manage the corporate and startup session
     * @param none
     * @return none
     */
	public function dashboard()
	{
		// if startup session is setup open startup dashboard 
         if($this->session->userdata('type')=='startup')
         {
         		redirect('startup');
         }

        // if corporate session is setup open corporate dashboard 
         else if($this->session->userdata('type')=='corp')
         {
         	redirect('corporate');
         }

         // if diffrent session is setup destroty the session 
         else
         {
         	$this->session->sess_destroy();
         	redirect('home');
         }
	}

	public function profile($id='',$type='')
	{
		$basic=$this->profile->get_basic_detail($type,$id);
		$contact=$this->profile->get_contact_detail($type,$id);
		$vision=$this->profile->get_vision($type,$id);
		$tech=$this->profile->get_tech($type,$id);
		$verticals=$this->profile->get_verticals($type,$id);
		$data=[
			'basic'=>$basic,
			'contact'=>$contact,
			'vision'=>$vision,
			'tech'=>$tech,
			'verticals'=>$verticals,
			'type'=>$type,
			"login"=>$this->login
		];
		if($this->login=='true')
		{
			$data['type']='corp';
		}
		
	$this->addCSS('profile/freelancer.css');
		//$this->addCSS('profile/freelancer.min.css');
		$this->addCSS('profile/freelancer.min.css');
		$this->addJS('profile/freelancer.min.js');
		$this->addJS('profile/jqBootstrapValidation.js');
		$this->addJS('profile/contact_me.js');		$data2= array(
					  "javascript" => $this->_js,
					  "css" => $this->_css,
					  );
		$this->load->view('templates/header_assets',$data2);
		$this->load->view('public_profile',$data);

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
#################################### END OF HOME CLASS  #####################################
?>	
