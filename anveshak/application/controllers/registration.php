<?php
 if ( ! defined('BASEPATH')) exit('No direct script access allowed');





#################################### REGISTRATION #####################################

//-------------------------------------------------------------------------------------
/**
  *
  * @author   Prem Sagar
  * @copyright Anveshak
  * Registration class contain  Functionality  related to startup and corporate Registration
  * 
  */




class Registration extends CI_Controller {

   /**
	* @var $_js store the all js file included
	* @var $_css store the all css file included
	*/
	var $_js = '';
	var $_css = '';

	/**
	 * Include class constructor 
	 * load registration js file and css file
	 * load basic_model
	 */
	function __construct()
	{   
		parent::__construct();
		$this->addJS('registration.js');
		$this->addCSS('registration.css');
		$this->load->model('basic_model','basic');
	}

	/**
	 * Default Registration controller function
	 * load the header_assets and registration form
	 */
    public function index()
    {
	    $data = array(
					  "title" => $title,
					  "subtitle" => $subtitle,
					  "javascript" => $this->_js,
					  'reg_type'=>$reg_type,
					  "css" => $this->_css,
					  );
	    $this->load->view('templates/header_assets',$data);
	    
	    // load registration form
	    $this->load->view('registration',$data);
    }


    /**
     * manage the registration form submission
     * @param $reg_type string hold registration type (ie. startup or corporate)
     * @return none
     */
    public function reg_form_submit($reg_type='')
    {
    	// startup registration
    	 if($reg_type=='startup' && isset($_POST['startup_reg_submit']))
	      {
	      	  $this->startup_registration();
	      }
	    // corporate registration  
	      else if($reg_type=='corporate'&&isset($_POST['corporate_reg_submit']))
	      {
	      	  $this->corporate_registraion();
	      }

	    // something else  
	      else
	      {
	      	 redirect(base_url());
	      }
    }

    /**
     * handle the corporate registration
     * @param  none
     * @return none
     */
    private function corporate_registraion()
    {
    	// Extracting form data from post array
    	 $data= [
					'corp_name'					=>	$this->input->post('startup_name'),
					'cin_no'					=>	$this->input->post('cin_no'),
					'roc_reg_no'				=>	$this->input->post('roc_reg_no'),
					'category'                 =>$this->input->post('category'),
					'incorporate_date'				=>	date('Y-m-d', strtotime($this->input->post('date'))),
					'website'	=>	$this->input->post('website'),
					'email'	=>	$this->input->post('email'),
					'mobile'	=>	$this->input->post('mobile'),
					'phone'	=>	$this->input->post('contact'),
				];
		// saving registration detail of corporate		
		$result=$this->basic->insert('corp_reg',$data);
    }



    /**
     * handle the startup registration
     * @param  none
     * @return none
     */
    private function startup_registration()
    {	
    	// Extracting form data from post array
		 $data = [
				'startup_name'		=>	$this->input->post('startup_name'),
				'cin_no'			=>	$this->input->post('cin_no'),
				'roc_reg_no'		=>	$this->input->post('roc_reg_no'),
				'incorporate_date'				=>	date('Y-m-d', strtotime($this->input->post('date'))),
				'worth'					=>	$this->input->post('worth'),
				'recog_no'				=>	$this->input->post('recog_no'),
				'website'	=>	$this->input->post('website'),
				'email'	=>	$this->input->post('email'),
				'mobile'	=>	$this->input->post('mobile'),
				'phone'	=>	$this->input->post('contact'),
			];

	    // saving registration detail of corporate			
		$result=$this->basic->insert('startup_reg',$data);
			 
				
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

#################################### End OF REGISTRATION CLASS #########################
?>