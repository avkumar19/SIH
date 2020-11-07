

<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');



#################################### SPORT_MODEL CLASS START #############################################



//-------------------------------------------------------------------------------------
/**
  *
  * @author    MIS sport team (Prem Sagar)
  * @copyright no copyright
  * It cover insertion, deletion and update of table.
  *
  */

class Corp_model extends CI_Model
{
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


	public function insert_problem($tags,$prob)
	{
		$id=$this->session->userdata('id');
		$prob_table=[
			'corp_id'=>$id,
			'problem_statement'=>$prob
		];
		
		$this->db->trans_begin();

		$this->db->insert('problem_list',$prob_table);

		$prob_id= $this->db->select_max('prob_id')->where(array('corp_id'=>$id))->get('problem_list')->result_array()[0]['prob_id'];
		$tag_data=[];
		foreach ($tags as $tag => $value) {
			$tag_data[]=[
				"vertical_id"=>$value,
				"prob_id"=>$prob_id
			];
		}
		//print_r($prob_id);
		$this->db->insert_batch('problem_tag',$tag_data);
		if ($this->db->trans_status() === FALSE)
		{
		    $this->db->trans_rollback();
		}
		else
		{
		   $this->db->trans_commit();
		    return TRUE;
		}
		return FALSE;
	}
	
}

