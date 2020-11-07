

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
	var $vertical='vertical';
	var $c_detail='corp_detail';
	var $c_auth='corp_auth';
	var $c_contact='corp_contact';
	var $c_reg='corp_reg';
	var $c_tech='corp_tech';
	var $c_vision='corp_vision';
	var $c_verticals='corp_vertical'; 
	var $s_project = 'request_outsourcing';
	var $s_track='track_outsourcing';
	var $s_stat='status_outsource';


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
		$this->load->model('basic_model','basic');
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
		if($type =='startup'){
			$query = "SELECT website,email,mobile,phone  FROM `startup_contact` WHERE startup_id ='$id';";
		}
		else{
			$query = "SELECT website,email,mobile, phone FROM `corp_contact` WHERE corp_id ='$id';";
		}
		$result = $this->db->query($query);

		return $result->result_array()[0];
	}

	public function get_vision($type='',$id)
	{	
		if($type=='startup'){
			 $table=$this->s_vision;
			 $res=$this->basic->get_all_data_cond($table,['startup_id'=>$id]);
		}
		else{
			 $table=$this->c_vision;
			 $res=$this->basic->get_all_data_cond($table,['corp_id'=>$id]);
		}
		return $res['data'][0];
		
	}

	public function get_basic_detail($type='',$id)
	{	
		if($type =='startup')
		{
			//print("Hello");
			$query = "SELECT * FROM `startup_detail` WHERE startup_id='$id';";
		}
		else
		{
			////print("hello _ ");
			$query = "SELECT * FROM `corp_detail` WHERE corp_id='$id';";
		}
		$result = $this->db->query($query);
		//print_r($result->result_array()[0]);

		return $result->result_array()[0];
	}

	public function get_verticals($type='',$id)
	{	
		if($type =='startup')
		{
			//print("Hello");
			$query = "SELECT * FROM `startup_verticals` WHERE startup_id='$id';";
		}
		else
		{
			////print("hello _ ");
			$query = "SELECT * FROM `corp_vertical` WHERE corp_id='$id';";
		}
		$result = $this->db->query($query);
		//print_r($result->result_array()[0]);

		return $result->result_array()[0];
		
	}

	public function get_tech($type='',$id)
	{	
		if($type =='startup')
		{
			//print("Hello");
			$query = "SELECT * FROM `startup_tech` WHERE startup_id='$id';";
		}
		else
		{
			////print("hello _ ");
			$query = "SELECT * FROM `corp_tech` WHERE corp_id='$id';";
		}
		$result = $this->db->query($query);
		//print_r($result->result_array()[0]);

		return $result->result_array()[0];
	}
	

	
	public function get_username($type='',$id)
	{
		if($type=='startup'){
			$query="SELECT login_id FROM `startup_auth` WHERE startup_id='$id';";
		}
		else {
			$query="SELECT login_id FROM `corp_auth` WHERE corp_id='$id';";
		}

		$result=$this->db->query($query);
		
		return $result->result_array()[0];
	}

	public function update_vision($type,$id,$data,$insert='')
	{	
		if($type=='startup')
		{
			$table=$this->s_vision;
			$key['startup_id']=$id;

			if($insert=='insert')
			{
				$data['startup_id']=$id;	
				return $this->db->insert($table,$data);
			}
			else
			{
				return $this->db->update($table,$data,$key);
				
			}

		}
		else
		{

			$table=$this->c_vision;
			$key['corp_id']=$id;

			if($insert=='insert')
			{
				
				$data['corp_id']=$id;	
				return $this->db->insert($table,$data);
			}
			else
			{
				
				return $this->db->update($table,$data,$key);
				
			}
		}
		
	}

	public function get_unused_verticals($type='',$id='')
	{	
		if($type=='startup'){
			 $table=$this->s_verticals;
			 $res=$this->db->select('vert.vertical_id')
              ->from('vertical as vert')
              ->join('startup_verticals as s_vert', 'vert.vertical_id=s_vert.vertical_id')
              ->get()->result_array();
              $vert_id=[];
            foreach ($res as $key) {
              	$vert_id[]=$key['vertical_id'];
              }  
             
              if(count($vert_id)>0){
              return $vert_id=$this->db->select('*')->from('vertical')->where_not_in('vertical_id',$vert_id)->get()->result_array();
          	}
             else{
             	return $vert_id=$this->db->select('*')->from('vertical')->get()->result_array();
              }
             

		}
		else{

			 $table=$this->c_verticals;
			 
			 $res=$this->db->select('vert.vertical_id')
              ->from('vertical as vert')
              ->join('corp_vertical as c_vert', 'vert.vertical_id=c_vert.vertical_id')
              ->get()->result_array();
             $vert_id=[];
              foreach ($res as $key) {
              	$vert_id[]=$key['vertical_id'];
              }  
             	
             if(count($vert_id)>0){
              	return $vert_id=$this->db->select('*')->from('vertical')->where_not_in('vertical_id',$vert_id)->get()->result_array();
          	}
             else{
             	return $vert_id=$this->db->select('*')->from('vertical')->get()->result_array();
              }
		}
	}
	public function load_recommendation()
	{
		   $id=$this->session->userdata('id');
		   $ch = curl_init();
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			$url='http://127.0.0.1:3000/dashboard/'.$id;
			//print_r($url);
			//die();
			curl_setopt($ch, CURLOPT_URL,$url );
			$result = curl_exec($ch);
			//print_r($result);
			//print_r($result->data);
			curl_close($ch);
			
			 $obj = json_decode($result);
			 //print_r($obj);
			 //die();
			 $id=[];
			foreach ($obj as $key => $val) {
				{
					foreach($val as $x => $y)
					$id[]=$y;
				}
				
			}
			//print_r($id);
			//die();
			return $id;
	}

	public function fetch_startup_detail_by_id($s_id)
	{
		if(count($s_id)>0){
		return $this->db->select('*')->from('startup_detail')->where_in('startup_id',$s_id)->get()->result_array();
		}
		return array();
	}


	public function add_new_verticals($type='',$id='',$data)
	{	
		
		if($type=='startup'){

			$res=$this->db->insert_batch('startup_verticals',$data);
		}
		else
		{
			$res=$this->db->insert_batch('corp_vertical',$data);
		}

		return $res;
	}

	public function get_project_status()	{

		// fetching all record from table

		$query=$this->db->get($this->s_stat);
		//dump($this->db->last_query());

		if($query)
		{
			// if fetched return 2-d assoc array
			return $query->result_array();
		}
	}
  public function get_new_project()	{

		// fetching all record from table

		$query=$this->db->get_where($this->s_project, array('status' => 0));
		//dump($this->db->last_query());

		if($query)
		{
			// if fetched return 2-d assoc array
			return $query->result_array();
		}
	}
	public function outsource_detail_by_id($id){

		$query=$this->db->get_where($this->s_project, array('outsource_id' => $id));

		if($query){
			return $query->result_array()[0];
		}
	}
	public function accept_project_request($outsource_id)
	{

		$outsource_detail=$this->outsource_detail_by_id($outsource_id);

		$startup_id = $outsource_detail['startup_id'];
		$corp_id=$outsource_detail['corp_id'];
		$outsource_id=$outsource_detail['outsource_id'];
		$outsource_desc=$outsource_detail['outsource_desc'];
		$outsource_duration=$outsource_detail['outsource_duration'];


		$auth=[
			'outsource_id'=> $outsource_id,
			'startup_id'	=>	$startup_id,
			'corp_id'	=>	$corp_id,
			'outsource_desc'=> $outsource_desc,
			'outsource_duration'=> $outsource_duration
		];
		$stat=[
			'outsource_id'=> $outsource_id,
			'startup_id'	=>	$startup_id,
			'outsource_duration'=> $outsource_duration
		];



		$this->db->trans_begin();

		$this->db->insert($this->s_track,$auth);
		$this->db->insert($this->s_stat,$stat);

		$this->db->where('outsource_id',$outsource_id)->update($this->s_project,['status'	=>	1]);
		if ($this->db->trans_status() === FALSE)
		{
				$this->db->trans_rollback();
		}
		else
		{
				$this->db->trans_commit();

				//$this->send_email('verify',$reg_detail['email'],$startup['startup_name'],$login_id,$password);
				//$this->send_sms('verify',$reg_detail['mobile'],$startup['startup_name'],$login_id,$password);
				return TRUE;
		}
		return FALSE;

	}
	public function reject_project_request($outsource_id){
		//$outsource_detail=$this->outsource_detail_by_id($outsource_id);

		$this->db->trans_begin();
		print($outsource_id);
		$this->db->where('outsource_id',$outsource_id)->update($this->s_project,['status'	=>	2]);

		if ($this->db->trans_status() === FALSE){
		    $this->db->trans_rollback();
		}
		else{
		    $this->db->trans_commit();

		    //$this->send_email('reject',$reg_detail['email'],$startup['startup_name']);
		    //$this->send_sms('reject',$reg_detail['mobile'],$startup['startup_name']);
		    return TRUE;
		}
		return FALSE;
	}

	

	//-----------------------------------------------------------------------------------------------------
}


#################################### SPORT_MODEL CLASS END HERE #############################################