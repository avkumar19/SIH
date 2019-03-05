

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

class Result_model extends CI_Model
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

	public function fetch_startup_by_vetical_id($vert_id)
	{
		return $this->db->select('startup_id')->where(array('vertical_id'=>$vert_id))->get('startup_verticals')->result_array();
	}
	public function fetch_startup_detail_by_id($s_id)
	{
		if(count($s_id)>0){
		return $this->db->select('*')->from('startup_detail')->where_in('startup_id',$s_id)->get()->result_array();
		}
		return array();
	}

	public function convert_tosearch_string($str)
	{
		//print($str);
		//print('<br>');
		$arr=explode(" ",$str);
		//print_r($arr);
		$res='';
		foreach ($arr as $key => $value) {
			$res.=$value.'%20';
		}
		$res=rtrim($res,"%20 ");
		return $res;
	}
	public function get_startup_search($str)
	{
			$str=$this->convert_tosearch_string($str);
			//die();		
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			$url='http://127.0.0.1:5000/startup/'.$str.'/';
			//print_r($url);
			curl_setopt($ch, CURLOPT_URL,$url );
			$result = curl_exec($ch);
			curl_close($ch);
			
			 $obj = json_decode($result);
			 $sol=[];
			 $id=[];
			foreach ($obj as $key => $value) {
				foreach ($value as $key => $val) {
					$id[]=$val->startup_id;
				$data=[
					"startup_id"=>$val->startup_id,
					"description"=>$val->description
				];
				$sol[]=$data;
			}}
			//print_r($sol);
			return array('id'=>$id,'data'=>$sol);
			
			
	}





	public function fetch_corp_by_vetical_id($vert_id)
	{

		return $this->db->select('corp_id')->where(array('vertical_id'=>$vert_id))->get('corp_vertical')->result_array();
	}

	public function fetch_corp_detail_by_id($s_id)
	{	
		if(count($s_id)>0){
		return $this->db->select('*')->from('corp_detail')->where_in('corp_id',$s_id)->get()->result_array();
		}
		return array();
	}

	//-----------------------------------------------------------------------------------------------------
}


#################################### SPORT_MODEL CLASS END HERE #############################################