

<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');



#################################### SPORT_MODEL CLASS START #############################################



//-------------------------------------------------------------------------------------
/**
  *
  * @author    Prem Sagar
  * @copyright anveshak
  * It cover all queries related to startup
  *
  */

class Startup_model extends CI_Model
{

	var $s_detail='startup_detail';
	var $s_contact='startup_contact';
	var $s_reg='startup_reg';
	var $s_tech='startup_tech';
	var $s_vision='startup_vision';
	var $s_verticals='startup_verticals';
	var $s_partner='startup_corp_partner';
	var $s_auth = 'startup_auth';
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

	public function get_new_startup_reg()
	{	
		
		// fetching all record from table

		$query=$this->db->get_where($this->s_reg, array('status' => 0)); 
		//dump($this->db->last_query());
		
		if($query)
		{	
			// if fetched return 2-d assoc array
			return $query->result_array();
		}      
	}

	public function contact_details_by_id($id){

		$query=$this->db->get_where($this->s_reg, array('reg_id' => $id)); 
		
		if($query){	
			return $query->result_array()[0];
		}
	}

	public function accept_reg_request($reg_id)		
	{	
		$reg_detail=$this->contact_details_by_id($reg_id);
		$time = date('Y-m-d H:i:s');


		$pass_gen_res = $this->gen_password($reg_id,$time);
		$startup_id = $this->gen_startup_id($time,$reg_detail['startup_name']);
		$password = $pass_gen_res[0];
		$password_hash = $pass_gen_res[1];
		$login_id = $this->gen_login_id($time,$reg_detail['startup_name']);
		
		$auth=[
			'startup_id'	=>	$startup_id,
			'login_id'	=>	$login_id,
			'password'	=>	$password_hash,
			'startup_name'	=>	$reg_detail['startup_name'],
			'created_date'	=>	$time,
			'status'	=>	1,
		];
		$contact=[
			'startup_id'=>$startup_id,
			'website'=>$reg_detail['website'],
			'email'=>$reg_detail['email'],
			'mobile'=>$reg_detail['mobile'],
			'phone'=>$reg_detail['phone'],
		];
		$detail=[
			'startup_id'	=>	$startup_id,
			'startup_name'	=>	$reg_detail['startup_name'],
			'cin_no'		=>	$reg_detail['cin_no'],
			'roc_reg_no'		=>	$reg_detail['roc_reg_no'],
			'recog_no'		=>	$reg_detail['recog_no'],
			'incorporate_date'		=>	$reg_detail['incorporate_date'],
		];
		
	
		$this->db->trans_begin();

		$this->db->insert($this->s_auth,$auth);
		$this->db->insert($this->s_contact,$contact);
		$this->db->insert($this->s_detail,$detail);
		$this->db->where('reg_id',$reg_id)->update($this->s_reg,['status'	=>	1]);
		if ($this->db->trans_status() === FALSE)
		{
		    $this->db->trans_rollback();
		}
		else
		{
		    $this->db->trans_commit();

		    $this->send_email('verify',$reg_detail['email'],$startup['startup_name'],$login_id,$password);
		    $this->send_sms('verify',$reg_detail['mobile'],$startup['startup_name'],$login_id,$password);
		    return TRUE;
		}
		return FALSE;

	}
	public function reject_reg_request($reg_id){
		$reg_detail=$this->contact_details_by_id($reg_id);
		$this->db->trans_begin();
		
		$this->db->where('reg_id',$reg_id)->update($this->s_reg,['status'	=>	2]);

		if ($this->db->trans_status() === FALSE){
		    $this->db->trans_rollback();
		}
		else{
		    $this->db->trans_commit();

		    $this->send_email('reject',$reg_detail['email'],$startup['startup_name']);
		    $this->send_sms('reject',$reg_detail['mobile'],$startup['startup_name']);
		    return TRUE;
		}
		return FALSE;
	}

	public function gen_password($reg_id,$time){
		//$new_pass = rand(100000,999999);
		$new_pass = "p";
		$new_hash=$this->authorization->encode_password($new_pass,$time);
		return [$new_pass,$new_hash];
	}
	public function gen_login_id($time,$startup_name){
		$new_login = rand(100000,999999).$time.$startup_name;
		$new_hash=$this->authorization->encode_password($new_login,$time);
		return substr($new_hash,0,30);
	}
	public function gen_startup_id($time,$startup_name){
		$new_startup_id = rand(100000,999999).$time.$startup_name;
		$new_hash=$this->authorization->encode_password($new_login,$time);
		return 'startup_'.substr($new_hash,0,12);
	}

	public function send_sms($status,$mobile,$name,$login_id='',$password='')
	{	
		$msg="";
		if($status==='verify')
		{
			$msg="login detail for ".$name." login_id:".$login_id." password:".$password;
		}
		else
		{
			$msg="your request for".$name." has been rejected";
		}
		print_r($msg.'');
		print_r($mobile);
		
	}	
	public function send_email($status,$email,$name,$login_id='',$password='')
	{
		
	}
}


#################################### SPORT_MODEL CLASS END HERE #############################################