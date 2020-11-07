<?php
 if ( ! defined('BASEPATH')) exit('No direct script access allowed');





#################################### MY_Controler##########################

//------------------------------------------------------------------------


/**
  *
  * @author   Prem Sagar
  * @copyright Anveshak
  * Authorization Extended Controller Class	
  * 
  */



class MY_Controller extends CI_Controller {


	/**
	* @var $_js store the all js file included
	* @var $_css store the all css file included 
	* @var $CI an ci instance
	*/

	var $CI;
	var $_js = '';
	var $_css = '';



	/**
	 * Include class constructor 
	 * check the authorization for accesing the controller
	 * @param array   contain authorization info
	 */

	function __construct($args = array())
	{
        parent::__construct();
       
        $this->CI =& get_instance();

        // check if user have access to page otherwise logout 
		if(!$this->CI->authorization->auth($args)){
			redirect('login/logout/2');
		}
		
    }

   	
   	/**
    * utility function to load header and header assets
    */
    
	function drawHeader($title = "Connet Startup With Corporate", $subtitle = "") {
		$data = array(
					  "title" => $title,
					  "subtitle" => $subtitle,
					  "javascript" => $this->_js,
					  "type"=>$this->CI->session->userdata('type'),
					  "css" => $this->_css,
					  );

		$this->load->view("templates/header_assets", $data);
		$this->load->view("templates/header", $data);
	}




	/**
    * utility function to load footer 
    */

	function drawFooter() {
		$this->load->view("templates/footer");
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

/* End of file MY_Controller.php */
/* Location: ./application/core/MY_Controller.php */