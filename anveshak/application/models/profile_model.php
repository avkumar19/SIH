

<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');



#################################### Profile CLASS START #############################################



//-------------------------------------------------------------------------------------
/**
  *
  * @author    MIS sport team (Prem Sagar)
  * @copyright no copyright
  * It cover insertion, deletion and update of table.
  *
  */

class Profile_model extends CI_Model
{

	var $s_detail='startup_detail';
	var $s_contact='startup_contact';
	var $s_reg='startup_reg';
	var $s_tech='startup_tech';
	var $s_vision='startup_vision';
	var $s_verticals='startup_verticals';
	var $s_partner='startup_corp_partner';
	var $s_auth = 'startup_auth';

	var $c_detail='corp_detail';
	var $c_auth='corp_auth';
	var $c_contact='corp_contact';
	var $c_reg='corp_reg';
	var $c_tech='corp_tech';
	var $c_vision='corp_vision';
	var $c_verticals='corp_vertical'; 
	/**
	 *
	 * Includes Class Constructor
	 * @param none
	 * @return	void
	 *
	 */

	function __construct()
	{
		parent::__construct();
	}

	//------------------------------------------------------------------------------------------------

	/**
	 *
	 * it fetch all the record from table mentioned in parameter.
	 * @param   string 		$table 		table name
	 * @return	2-d assoc array 	holds the all record of table
	 *
	 */

	public function get_contact_detail($type='',$id)
	{	
		//print($id);
		//print($type);
		//die();
		if($type =='startup')
		{
			print("Hello");
			$query = "SELECT website,email,mobile FROM `startup_contact` WHERE startup_id='$id';";
		}
		else
		{
			print("hello _ ");
			$query = "SELECT website,email,mobile FROM `corp_contact` WHERE corp_id='$id';";
		}
		$result = $this->db->query($query);
		//print_r($result->result_array()[0]);

		return $result->result_array()[0];
	}

	public function get_vision($type='',$id)
	{	
		
	}

	public function get_basic_detail($type='',$id)
	{	
		
	}

	public function get_tech($type='',$id)
	{	
		
	}

	public function get_verticals($type='',$id)
	{	
		
	}

	public function update_contact_detail($type='',$id='',$data)
	{	
		
	}

	public function update_vision($type='',$id='',$data)
	{	
		
	}

	public function update_username($type='',$id='',$data)
	{	
		
	}

	

	//-----------------------------------------------------------------------------------------------------
}


#################################### SPORT_MODEL CLASS END HERE #############################################