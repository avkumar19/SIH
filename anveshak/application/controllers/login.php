<?php
 if ( ! defined('BASEPATH')) exit('No direct script access allowed');





#################################### LOGIN #####################################

//------------------------------------------------------------------------------
/**
  *
  * @author   Prem Sagar
  * @copyright Anveshak
  * Login class contain  Functionality  related  to startup and corporate Login
  * 
  */




class Login extends CI_Controller {
	
	/**
	* @var $_js store the all js file included
	* @var $_css store the all css file included
	*/

	var $_js = '';
	var $_css = '';



	/**
	 * Include class constructor 
	 * load login js file and css file
	 */

	function __construct()
	{   
		parent::__construct();
		
	}




	/**
	 * Default Login controller function
	 * load the header_assets and login form
	 */

	public function index()
	{   
	  // check if user has aleready logged in then redirect Home page
      if($this->session->userdata('isLoggedIn'))
			redirect('home');
		else
			$this->showlogin();   // utility function to open login form
    }




    /**
	 * Uitility Function to show login form
	 * load the header_assets and login form
	 */

    private function showlogin($error_code = 0) {

		$data = array(
					  "title" => $title,
					  "subtitle" => $subtitle,
					  "javascript" => $this->_js,
					  "css" => $this->_css,
					  'error_code'=>$error_code
					  );
    	$this->load->view('login',$data);
	}




	/**
     * manage the login form submission
     * @param $reg_type string hold login type (ie. startup or corporate)
     * @return none
     */
     public function login_form_submit($reg_type='')
    {
    	// startup login
    	 if($reg_type=='startup' && isset($_POST['startup_login_submit']))
	      {
	      	  $this->startup_login();
	      }
	      // corporate login 
	      else if($reg_type=='corporate'&&isset($_POST['corporate_login_submit']))
	      {
	      	  $this->corporate_login();
	      }
	      // something else
	      else
	      {
	      	 $this->showlogin(1);
	      }
    }




    /**
     * handle the corporate login
     * @param  none
     * @return none
     */

    private function corporate_login()
    {
		$user=$this->input->post('login_id');
		$pass=$this->input->post('password');
		$type="corp";
		$this->login_user($user,$pass,$type);
    }


    /**
     * handle the startup login
     * @param  none
     * @return none
     */
    private function startup_login()
    {	
    	$user=$this->input->post('login_id');
		$pass=$this->input->post('password');
		$type="startup";
		$this->login_user($user,$pass,$type);
    }




    /**
    * utility function to authenticate the login information
    * @param $user  string  username
    * @param $pass  string  password
    * @param $type  string  login type
    */

    private function login_user($user='',$pass='',$type='') 
    {
		// check if any parameter is not null otherwise open login form
    	if(is_null($user)||is_null($pass) || is_null($type))
    		 $this->showlogin(1);

    	// load the users_model for validating user data	
		$this->load->model('user/users_model','',TRUE);

		//Ensure values exist for user and pass, and validate the user's credentials
		if( $user && $pass && $this->users_model->validate_user($user,$pass,$type)) {

			
			$this->load->model('user/user_login_attempts_model','',TRUE);

			// insert  login attempt fof the user
			$this->user_login_attempts_model->insert(array("id" => $this->session->userdata('id'), "time" => date('Y-m-d H:i:s'),"ip"=>$_SERVER['REMOTE_ADDR'],"status"=>"success"));
                      
			// check for any previous login and expired logout
            $maxID= $this->user_login_attempts_model->get_log_in_maxID($this->session->userdata('id'));
     
            $re= $this->user_login_attempts_model->get_logg(array('log_id'=>$maxID));

            // if such login info  withou logout exist update the logout time and logout ip for that log entry 
            if(is_array($re)){
                if($re[0]->logged_out_time == ''){
              		$this->user_login_attempts_model->update_log(
                      array('logged_out_time'=>date('Y-m-d H:i:s'),'logout_ip'=>$this->input->ip_address()),
                      array('log_id'=>$maxID)
                      );
                }
            }


            // insert login info to log (login_logout_table)
            $data['user_id'] = $this->session->userdata('id');
            $data['logged_in_time']=date('Y-m-d H:i:s');
            $data['login_ip']=$this->input->ip_address();
            $this->user_login_attempts_model->insert_log($data);
                  
            // redirect to dashborad            
			redirect('home');
            
		}
		// if login credential is invalid redirect to login page with error message
		else {

			$this->showlogin(1);
		}
	}


   /**
    * utility function to destroy the user session 
    * @param $error code int login_error
    */

	public function logout($error_code = 0) {

        $this->load->model('user/user_login_attempts_model','',TRUE);

        $maxID= $this->user_login_attempts_model->get_log_in_maxID($this->session->userdata('id'));

        $this->user_login_attempts_model->update_log(
                                  array('logged_out_time'=>date('Y-m-d H:i:s'),'logout_ip'=>$this->input->ip_address()),
                                  array('log_id'=>$maxID)
                                  );
        // destroy the user session
        $this->session->sess_destroy();

        
        redirect('home');
	}





   /**
    * utility function to add a js file
    */

    function addJS($js) {
		$this->_js .= "<script type=\"text/javascript\" src=\"".base_url()."assets/js/".$js." \" ></script>";
	}




   /**
    * utility function to add a css file
    */
	function addCSS($css) {
		$this->_css .= "<link rel=\"stylesheet\" type=\"text/css\" href=\"".base_url()."assets/css/".$css."\" />";
	}


}
#################################### End OF LOGIN CLASS #########################
?>