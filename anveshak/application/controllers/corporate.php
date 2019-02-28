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
	
}
#################################### END OF Corporate CLASS ############################
?>