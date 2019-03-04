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




class Startup extends MY_controller
{
	


	/**
	 * Include class constructor 
	 * 
	 */

	function __construct()
	{
		parent::__construct(array('startup'));
	}





	/**
	 * Default Home controller function
	 * 
	 */

	public function index()
	{
		$this->drawHeader('Startup Home','Feed');
		$this->drawFooter();
	}
	
}
#################################### END OF STARTUP CLASS  ################################
?>