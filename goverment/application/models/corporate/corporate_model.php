

<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');



#################################### SPORT_MODEL CLASS START #############################################



//-------------------------------------------------------------------------------------
/**
  *
  * @author    Prem Sagar
  * @copyright anveshak
  * It cover all queries related to corporate
  *
  */

class Corporate_model extends CI_Model
{

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

	public function get_new_corp_reg()
	{	
		
		// fetching all record from table

		$query=$this->db->get_where($this->c_reg, array('status' => 0)); 
		
		if($query)
		{	
			// if fetched return 2-d assoc array
			return $query->result_array();
		}      
    }

    public function contact_details_by_id($id){

		$query=$this->db->get_where($this->c_reg, array('reg_id' => $id)); 
		
		if($query && $query->num_rows()==1){	
			return $query->result_array()[0];
		}
	}

	public function accept_reg_request($reg_id)		
	{	
		$reg_detail=$this->contact_details_by_id($reg_id);
		$time = date('Y-m-d H:i:s');


		$pass_gen_res = $this->gen_password($reg_id,$time);
		$corp_id = $this->gen_corp_id($time,$reg_detail['corp_name']);
		$password = $pass_gen_res[0];
		$password_hash = $pass_gen_res[1];
		$login_id = $this->gen_login_id($time,$reg_detail['corp_name']);
		
		$auth=[
			'corp_id'	=>	$corp_id,
			'login_id'	=>	$login_id,
			'password'	=>	$password_hash,
			'corp_name'	=>	$reg_detail['corp_name'],
			'created_date'	=>	$time,
			'status'	=>	1,
		];

		$contact=[
			'corp_id'=>$corp_id,
			'website'=>$reg_detail['website'],
			'email'=>$reg_detail['email'],
			'mobile'=>$reg_detail['mobile'],
			'phone'=>$reg_detail['phone'],
		];

		
		$detail=[
			'corp_id'	=>	$corp_id,
			'corp_name'	=>	$reg_detail['corp_name'],
			'cin_no'		=>	$reg_detail['cin_no'],
			'roc_reg_no'		=>	$reg_detail['roc_reg_no'],
			'category'	=>   $reg_detail['category'],
			'incorporate_date'		=>	$reg_detail['incorporate_date'],
		];
		
	
		$this->db->trans_begin();

		$this->db->insert($this->c_auth,$auth);
		$this->db->insert($this->c_contact,$contact);
		$this->db->insert($this->c_detail,$detail);
		$this->db->where('reg_id',$reg_id)->update($this->c_reg,['status'	=>	1]);
		if ($this->db->trans_status() === FALSE)
		{
		    $this->db->trans_rollback();
		}
		else
		{
		    $this->db->trans_commit();

		    $this->send_email('verify',$reg_detail['email'],$corp['corp_name'],$login_id,$password);
		    $this->send_sms('verify',$reg_detail['mobile'],$corp['corp_name'],$login_id,$password);
		    return TRUE;
		}
		return FALSE;

	}
	public function reject_reg_request($reg_id){
		$reg_detail=$this->contact_details_by_id($reg_id);
		$this->db->trans_begin();
		
		$this->db->where('reg_id',$reg_id)->update($this->c_reg,['status'	=>	2]);

		if ($this->db->trans_status() === FALSE){
		    $this->db->trans_rollback();
		}
		else{
		    $this->db->trans_commit();

		    $this->send_email('reject',$reg_detail['email'],$corp['corp_name']);
		    $this->send_sms('reject',$reg_detail['mobile'],$corp['corp_name']);
		    return TRUE;
		}
		return FALSE;
	}

	public function gen_password($reg_id,$time){
		//$new_pass = rand(100000,999999);
		$new_pass = "p";
		// $new_hash=$this->authorization->encode_password($new_pass,$time);
		$new_hash=$new_pass;
		return [$new_pass,$new_hash];
	}
	public function gen_login_id($time,$corp_name){
		$new_login = rand(100000,999999).$time.$corp_name;
		$new_hash=$this->authorization->encode_password($new_login,$time);
		return substr($new_hash,0,30);
	}
	public function gen_corp_id($time,$corp_name){
		$new_corp_id = rand(100000,999999).$time.$corp_name;
		$new_hash=$this->authorization->encode_password($new_login,$time);
		return 'corp_'.substr($new_hash,0,12);
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