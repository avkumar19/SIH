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
		$this->load->model('startup_model','startup');
		$this->load->model('basic_model','basic');
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

	public function view_problem_statement()
	{
		$problem=$this->startup->get_problem_list();
		$tags=$this->basic->get_all_data('vertical');

		$this->drawHeader('Search Problem Statement');
		$data=[
			"problem"=>$problem,
			"tags"=>$tags
		];

		$this->load->view('problem_list',$data);
		$this->drawFooter();
	}

	public function filter_problem()
	{
		if(isset($_POST['problem_filter']))
		{
			$tags=$this->input->post('tags');
			//var_dump($tags);
		
			$tags= array_filter($tags,'sanitizeInputArray');
			$region=$this->input->post('region');
			
			if(count($tags)<=0 && $region==''){
				$this->view_problem_statement();
					
			}
			else
			{
				$problem=$this->startup->get_filter_problem_list($tags,$region);
				$tags=$this->basic->get_all_data('vertical');

				$this->drawHeader('Search Problem Statement');
				$data=[
					"problem"=>$problem,
					"tags"=>$tags
				];

				$this->load->view('problem_list',$data);
				$this->drawFooter();
			}
		}

	}


	

	

}

function sanitizeInputArray($arr){
	return !($arr==='All' || $arr===0 ||$arr ==='0'||$arr==='');
	}
#################################### END OF STARTUP CLASS  ################################
?>