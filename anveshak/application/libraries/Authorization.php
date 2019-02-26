<?php
 if ( ! defined('BASEPATH')) exit('No direct script access allowed');





#################################### MY_Controler##########################

//------------------------------------------------------------------------


/**
  *
  * @author   Prem Sagar
  * @copyright Anveshak
  * Authorization library contain utility function to verify user
  * 
  */

class Authorization
{

	/**
	* @var $CI an CI instance
	*/

	var $CI;



	/**
	 * Include class constructor
	 */


	


	public function __construct()
	{
		log_message('debug', "Authorization Class Initialized");

		// Set the super object to a local variable for use throughout the class
		$this->CI =& get_instance();
	}





	/**
	 * check the auth for user
	 * @param $args   array   contain authorization info
	 */
	function auth($args = array())
	{
		
		// check if session for user is set and are valid
		if(!($this->CI->session->userdata('isLoggedIn') && $this->login_check()))
			return false;

		if(sizeof($args) == 0)
		 return true;

		foreach($args as $aid)
		if($this->is_auth($aid)) 
			return true;

		redirect('home');
	}



	/**
	 * check the auth for user
	 * @param $auth string  contain authorization info
	 */

	function is_auth($auth)
	{
		
		if($auth == "")  
		  return false;
		return ($auth==$this->CI->session->userdata('type'));
	}





	/**
	 * verify the seesion data for current user
	 */

	function login_check()
	{

		$type=$this->CI->session->userdata('type');

		// check if session is set for the current user
		if($this->CI->session->userdata('id') && $this->CI->session->userdata('login_string') && !is_null($type))
		{
			$user_id = $this->CI->session->userdata('username');
			$login_string = $this->CI->session->userdata('login_string');
			$user_browser = $_SERVER['HTTP_USER_AGENT'];


			if($type=='startup')
				$table='startup_auth';
			else if($type=='corp')
				$table='corp_auth';
			else
				return false;

			
			if($query = $this->CI->db->get_where($table,array("login_id" => $user_id)))
			{	
				
				if($query->num_rows == 1)
				{
					$row = $query->row();
					$password = $row->password;
						
					//return true if session is valid for the given user	
					return (hash('sha512', $password . $user_browser) == $login_string);
				}
			}
		}
		return false;
	}




	/**
	 * utility function to check blocked user
	 * @param $user_id string   username
	 */

	function check_brute($user_id,$type) {
		return true;
	}





	/**
	 * encode the password to 32 bit md5 hash string
	 * @param $pass          string    password
	 * @param $created_date  datetime  last password change date
	 */

	function encode_password($pass, $created_date)
	{
		$date = strtotime($created_date);
		$year = date('Y', $date);
		$salt = 'ISM';

		$tempHash = $pass . (string)$date . (string)$salt;
		for($i=0; $i < $year; $i++) $tempHash = md5($tempHash);
		//echo  $tempHash; echo "pass"; die();
		return $tempHash;
	}



	function error($message)
	{
		//header("Location: Error.php?err=".urlencode($message));
		exit();
	}



	function strclean($str)
	{
		//global $mysqli;
		$str = @trim($str);
		if(get_magic_quotes_gpc()) $str = stripslashes($str);
		return $this->CI->db->escape_str($str);
	}



	function esc_url($url)
	{

		if ('' == $url) return $url;

		$url = preg_replace('|[^a-z0-9-~+_.?#=!&;,/:%@$\|*\'()\\x80-\\xff]|i', '', $url);

		$strip = array('%0d', '%0a', '%0D', '%0A');
		$url = (string) $url;

		$count = 1;
		while ($count) $url = str_replace($strip, '', $url, $count);

		$url = str_replace(';//', '://', $url);
		$url = htmlentities($url);
		$url = str_replace('&amp;', '&#038;', $url);
		$url = str_replace("'", '&#039;', $url);

		if ($url[0] !== '/') return '';
		else return $url;
	}
}
