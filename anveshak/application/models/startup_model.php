

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

class Startup_model extends CI_Model
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


	public function get_problem_list()
	{
		$data=$this->db->select('corp.corp_name,prob.problem_statement,corp.corp_id,prob.post_date')
						->from('problem_list as prob')
						->join('corp_detail as corp','corp.corp_id=prob.corp_id')
						->get()->result_array();
		return $data;			

	}
	public function get_filter_problem_list($tags,$region)
	{
		if(count($tags)>0)
		{
			if($region=='')
			{
				$data=$this->db->select('corp.corp_name,prob.problem_statement,corp.corp_id,prob.post_date')
						->from('problem_list as prob')
						->join('corp_detail as corp','corp.corp_id=prob.corp_id')
						->join('problem_tag as tag','tag.prob_id=prob.prob_id')
						->where_in('tag.vertical_id',$tags)
						->get()->result_array();
				
			}
			else
			{
				
				$data=$this->db->select('corp.corp_name,prob.problem_statement,corp.corp_id,prob.post_date')
						->from('problem_list as prob')
						->join('corp_detail as corp','corp.corp_id=prob.corp_id')
						->join('problem_tag as tag','tag.prob_id=prob.prob_id')
						->where_in('tag.vertical_id',$tags)
						->like('corp.region', $region)
						->get()->result_array();
			}	
			
		}
		else
		{
			$data=$this->db->select('corp.corp_name,prob.problem_statement,corp.corp_id,prob.post_date')
						->from('problem_list as prob')
						->join('corp_detail as corp','corp.corp_id=prob.corp_id')
						->like('corp.region', $region)
						->get()->result_array();
		}
		// print_r($this->db->last_query());
		// die();
		return $data;
	}
	
}

