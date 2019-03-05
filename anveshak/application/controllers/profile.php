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




class Profile extends MY_controller
{
	


	/**
	 * Include class constructor 
	 * 
	 */

	function __construct()
	{
		parent::__construct();
		$this->load->model('profile_model','profile');
		$this->load->model('result_model','result');
		
	}





	/**
	 * Default Home controller function
	 * 
	 */

	public function index()
	{
		$this->view_profile();
		
	}

//#################################################### Profile ###############################

	public function view_profile()
	{
		$type=$this->session->userdata('type');
		$id=$this->session->userdata('id');
		//print($id);
		//print($type);
		$basic=$this->profile->get_basic_detail($type,$id);
		$contact=$this->profile->get_contact_detail($type,$id);
		$vision=$this->profile->get_vision($type,$id);
		$tech=$this->profile->get_tech($type,$id);
		$verticals=$this->profile->get_verticals($type,$id);
		$data=[
			'type'=>$type,
			'id'=>$id,
			'basic'=>$basic,
			'contact'=>$contact,
			'vision'=>$vision,
			'tech'=>$tech,
			'verticals'=>$verticals
		];
		$this->addCSS('profile/freelancer.css');
		//$this->addCSS('profile/freelancer.min.css');
		$this->addCSS('profile/freelancer.min.css');
		$this->addJS('profile/freelancer.min.js');
		$this->addJS('profile/jqBootstrapValidation.js');
		$this->addJS('profile/contact_me.js');
		$this->drawHeader("Profile",'view profile');
		$this->load->view('profile/view_profile',$data);
		$this->drawFooter();
		//print_r($type.' '.$id);
	}



//#################################################### VISION ###############################

	public function update_vision()
	{
		
		$type=$this->session->userdata('type');
		$id=$this->session->userdata('id');
		
		$res=$this->profile->get_vision($type,$id);
		$data=[
			'type'=>$type,
			'id'=>$id
		];
		//print_r($type.' '.$id);
		if($res && count($res)>0)
		{
			$data['vision']=$res;
			$data['first']=False;
		}
		else
		{
			$data['first']=True;
		}
		$this->open_vision_form($data);
		
	}


	private function open_vision_form($data)
	{
		//print_r($data);

		$this->drawHeader('Profile','Vision');
		$this->load->view('profile/vision',$data);
		$this->drawFooter();
	}

	public function vision_submit($first='')
	{	
		$type=$this->session->userdata('type');
		$id=$this->session->userdata('id');
		if(isset($_POST['update_vision']))
		{
			if($type=='startup'){
		    	$vision_data['vision']=$this->input->post('vision');
				$vision_data['short_desc']=$this->input->post('desc');
				$vision_data['no_of_emp']=$this->input->post('emp');
				
			}
		    else {
		    	 
		    	 $vision_data['vision']=$this->input->post('vision');
		    	 $vision_data['short_desc']=$this->input->post('desc');
		    }

			if(!is_null($first))
			{
				
		  
				$res=$this->profile->update_vision($type,$id,$vision_data);
			    
			}
			else
			{
				$res=$this->profile->update_vision($type,$id,$vision_data,'insert');
			}
			
			if($res)
			{
				$this->session->set_flashdata('flashSuccess','Vision Updated Succesfully');
				
			}
			else
			{
				$this->session->set_flashdata('flashError','Error occured while updating vision');
			}
			redirect(site_url('profile/update_vision'));
		}
	}


//#################################################### Contact ###############################

	public function update_contact_detail()
	{
		$type=$this->session->userdata('type');
		$id=$this->session->userdata('id');

		//print_r($type.' '.$id);
		$this->drawHeader("Profile",'Update Contact Details');
		$contact=$this->profile->get_contact_detail($type,$id);
		$data=[
			'type'=>$type,
			'id'=>$id,
			'contact'=>$contact
		];
		   
		   $this->load->view('profile/view_update_contact_detail',$data);
		   $this->drawFooter();


		
		//update contact_detail code
	}

	public function update_contact(){
  
		$id = $this->session->userdata('id');
		$type = $this->session->userdata('type');

        $data= [
					'website'	=>	$this->input->post('Website'),
					'email'	=>	$this->input->post('Email'),
					'mobile'	=>	$this->input->post('Mobile'),
					'phone'	=>	$this->input->post('Phone'),
				];
		$this->session->set_flashdata('flashSuccess','Your contact detail updated');		
		if($type =='startup'){
         $result=$this->basic->update('startup_contact',$data,['startup_id'=>$id]);
         redirect(site_url('profile/update_contact_detail'));
		}
		else{
			$result=$this->basic->update('corp_contact',$data,['corp_id'=>$id]);
			redirect(site_url('profile/update_contact_detail'));
		}
		// saving registration detail of corporate		
		
		
	}


//#################################################### Username ###############################	


	public function change_username()
	{
		$type=$this->session->userdata('type');
		$id=$this->session->userdata('id');
		//change username code
    //print($type.' '.$id);
    $this->drawHeader("Profile",'change_username');
    $basic=$this->profile->get_username($type,$id);
    $data=[
       'basic'=>$basic
    ];
    $this->load->view('profile/update_username',$data);

    $this->drawFooter();

	}

	 public function update_username(){
	  
	   $id=$this->session->userdata('id');
	   $type=$this->session->userdata('type');
	   $data= [
	       'login_id'=>	$this->input->post('changed_name')
	     ];
	   
	
	 // saving registration detail of corporate
	  	$this->session->set_flashdata('flashSuccess','Your Username has been changed. Please Login to Continue');
		 if($type=='startup'){
		     $result=$this->basic->update('startup_auth',$data,['startup_id'=>$id]);
		     redirect(site_url('profile'));
		 }
		   else {
		     $result=$this->basic->update('corp_auth',$data,['corp_id'=>$id]);
		     redirect(site_url('profile'));
		   }
		}
	   
	 

//#################################################### Add Verticals ###############################	
   
   public function add_verticals()
   {
   	    $id=$this->session->userdata('id');
	    $type=$this->session->userdata('type');
	    $this->drawHeader("Profile",'Add Verticals');
        $verts=$this->profile->get_unused_verticals($type,$id);
	   // print_r($verts);
	    $this->load->view('profile/add_verticals',['verts'=>$verts]);

	    $this->drawFooter();
   }	
   public function submit_verticals()
   {
   	   $id=$this->session->userdata('id');
	   $type=$this->session->userdata('type');
	   $vert=$this->input->post('verts');
	   $data=[];
	  	if($type=='startup'){
		   foreach ($vert as $key => $value) {
			   	$data[]=array(
			   		'startup_id'=>$id,
			   		'Vertical_id'=>$value
			   	);
		   }
		}
		else{

			foreach ($vert as $key => $value) {
			   	$data[]=array(
			   		'corp_id'=>$id,
			   		'Vertical_id'=>$value
			   	);
			   }
		}
		$res=$this->profile->add_new_verticals($type,$id,$data);

		if($res){
			$this->session->set_flashdata('flashSuccess','New Verticals has been saved Succesfully');
		}
		else
		{
			$this->session->set_flashdata('flashDanger','Error While Updating Verticals');
		}

	    redirect('profile/add_verticals');
   }

   public function find_recommendation()
   {
   	   $s_list=$this->profile->load_recommendation();
   	    $startup_list=$this->result->fetch_startup_detail_by_id($s_list);
		$data=[
			"list"=>$startup_list,
			'type'=>'startup',
		];
		$this->drawHeader();
		$this->load->view('profile/load_recommendation',$data);
		$this->drawFooter();
   }
   public function change_status()
	{
		$type=$this->session->userdata('type');
		$id=$this->session->userdata('id');
		//change username code
    //print($type.' '.$id);
    $this->drawHeader("Profile",'update status of the project');
    /*$basic=$this->profile->get_status($type,$id);
    $data=[
       'basic'=>$basic
    ];*/

    $this->load->view('profile/update_status',$data);

    $this->drawFooter();

	}


    public function update_status(){

 	   $id=$this->session->userdata('id');
 	   $type=$this->session->userdata('type');
 	   $data= [
 	       'status_desc'=>	$this->input->post('changed_status'),
         'count'=> $this->input->post('changed_status_count')
 	     ];


 	 // saving registration detail of corporate
 	  	$this->session->set_flashdata('flashSuccess','Your status detail updated');

 		     $result=$this->basic->update('status_outsource',$data,['outsource_id'=>'10']);

 		     redirect(site_url('profile'));


 		}

    public function assign_project($startup_id='')
  	{
  		$type=$this->session->userdata('type');
  		$id=$this->session->userdata('id');
  		$data=[
  			'startup_id'=>$startup_id
  		];
  	   $this->drawHeader("Profile",'Enter the following details');
      
      $this->load->view('profile/assign_project',$data);

      $this->drawFooter();

  	}

    public function update_assign_project($startup_id="startup1234"){

 	   $id=$this->session->userdata('id');
 	   $type=$this->session->userdata('type');
 	   $data= [
          'startup_id'=>$startup_id,
          'corp_id'=> $id,
          'outsource_desc'=> $this->input->post('outsource_desc'),
          'outsource_duration'=>	$this->input->post('outsource_duration'),

 	     ];


 	 // saving registration detail of corporate
 	  	$this->session->set_flashdata('flashSuccess','Your request has been sent');


 		     $result=$this->basic->insert('request_outsourcing',$data);
 		     redirect(site_url('profile'));

 		}
    public function requested()
  	{

  		$this->drawHeader('Startup','requested projects');
  		$result=$this->profile->get_new_project();
  		$data['projects']=$result;
      //print_r($data);

  		$this->load->view('profile/requested',$data);
  		$this->drawFooter();

  	}

    public function accept_project_request($outsource_id)
  	{


  		if(!is_null($outsource_id))
  		{
  			$outsource_details=$this->profile->accept_project_request($outsource_id);

  		}
      //redirect('startup');
      redirect(site_url('profile'));
  	}

  	public function reject_project_request($outsource_id='')
  	{
      //print_r($outsource_id);
  		if(!is_null($outsource_id))
  		{
  			$outsource_details=$this->profile->reject_project_request($outsource_id);

  		}
      redirect(site_url('profile'));
  	}
    public function view_status()
  	{

  		$this->drawHeader('Startup','running project status');
  		$result=$this->profile->get_project_status();
  		$data['projects']=$result;
      //print_r($data);

  		$this->load->view('profile/view_status',$data);
  		$this->drawFooter();

  	}

  	public function view_running_project_list()
  	{
  		$id=$this->session->userdata('id');
 	    $type=$this->session->userdata('type');
 	    
  	}
	
	
}
#################################### END OF PROFILE CLASS  ################################
?>