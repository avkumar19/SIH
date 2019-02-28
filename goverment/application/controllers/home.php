<?php
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



	/**
	 * Include class constructor 
	 * load home js file and css file
	 */

	function __construct()
	{   
		parent::__construct();
		$this->addJS('home.js');
		$this->addCSS('home.css');
	}



    /**
	 * Default Home controller function
	 * check the user session based on show corporate or startup dashboard
	 * load default home page if session is not set
	 */

	public function index()
	{
           
		if($this->session->userdata('isGovLoggedIn'))
			$this->showpage();
		else
			$this->homepage();
	
    }




    /**
     * manage the corporate and startup session
     * @param none
     * @return none
     */
	private function showpage()
	{
		redirect('gov');
	}



	 /**
     * load the default home page
     * @param none
     * @return none
     */

	private function homepage()
	{
		$data = array(
					  "title" => '',
					  "subtitle" => '',
					  "javascript" => $this->_js,
					  "css" => $this->_css,
					  );

	    $this->load->view('templates/header_assets',$data);
		$this->load->view('home');
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
