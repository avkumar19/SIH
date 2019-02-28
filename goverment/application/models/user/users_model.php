<?php

class Users_model extends CI_Model
{

	var $table="gov_auth";

	function __construct()
	{
		// Call the Model constructor
		parent::__construct();
	}

	function insert($data)
	{
		$query=$this->db->insert($this->table,$data);
		if($query)
			return true;
		else
			return false;
	}
	
	function getAdminPass()
	{
		$query = $this->db->query("SELECT password, created_date FROM ".$this->table." WHERE auth_id='admin'");
        
		if($query->num_rows() > 0)
			return $query->result();
        else
            return false;
	}

	function validate_user($user_id, $pass,$type)
	{
	
		$user_id = $this->authorization->strclean($user_id);
     	$pass = $this->authorization->strclean($pass);

     		
     	$row = $this->getUserById($user_id);

		if($row !== false)
		{
			if(!$this->authorization->check_brute($user_id,$type))
			{
				// Block account
				return false;
			}

			
			
			//Comment to remove enc >>>>> also comment line marked by *************
     		$password = $this->authorization->encode_password($pass, $row->created_date);

     		
		
			if($password == $row->password )
			{

				$data = $this->getUserById($user_id);
				
				$this->set_session($user_id, $password, $data,$type);

				return true;
			}

		
				//Incorrect Password
				
				/*  the line below to trap the user with wrong password */


				$status='Failed';

				$ipAddress=$_SERVER['REMOTE_ADDR'];

				$data = array('id'=>$user_id,'time'=>date('Y-m-d H:i:s'), 'password'=>$pass, 'status'=>$status, 'ip'=>$ipAddress);

				/* up the the line above the trap wrong password is saved */
				$query = $this->db->insert("user_login_attempts",$data);

				return false;
			
		}
		return false;
    }

    function getUserById($id = '')
    {

		$query = $this->db->get_where($this->table, array('login_id' => $id)); 

        if ($query->num_rows() === 1)
		{
			
			
			return $query->row();
				
		}   
        else
		{
			
			return false;
		}
            
    }
	
	private function set_session($user_id, $password, $data,$type)
	{
		$this->session->set_userdata( array( 'id'=>$user_id,	
											'login_string'=> hash('sha512', $password . $_SERVER['HTTP_USER_AGENT']),
											)
									);
		if($data)
		{
			$last_login = $this->db->query("SELECT min(t.time) as lastLogin
                                           FROM (SELECT `time`
                                                     FROM user_login_attempts
                                                     WHERE id = '$user_id'
                                                     ORDER BY `time` DESC
                                                     LIMIT 2 ) as t")->row()->lastLogin;
			if($type=='gov'){

			$this->session->set_userdata( array
											(
												'id'=> $data->gov_id,
												'username'=>$user_id,
 												'last_login'  => $last_login,
												'created_date' 	=> $data->created_date,
												'type'	=> $type,
												'isGovLoggedIn'=>true
											)
										);
			
		  }
		
		}

	}




	function change_password($old_pass , $new_pass)
	{
		$query = $this->db->get_where($this->table,array('id'=>$this->session->userdata('id')));

		$old_pass=$this->authorization->strclean($old_pass);
		$old_hash=$this->authorization->encode_password($old_pass, $query->row()->created_date);

		if($query->num_rows() == 1 && $query->row()->password == $old_hash)
		{
			$new_pass=$this->authorization->strclean($new_pass);
			$new_hash=$this->authorization->encode_password($new_pass,$query->row()->created_date);
			$this->update(array('password'=>$new_hash),array('id'=>$this->session->userdata('id')));
		}
		else
		{
			$this->session->set_flashdata('flashError','Old Password do not match.');
			redirect('change_password');
		}
    }

    function update($data=array(), $where=array())
    {
    	if(is_array($data)&&is_array($where)&&!empty($where)&&!empty($data))
    	{
    		$result=$this->db->update($this->table, $data, $where);

    		if($result)
    			return true;
    	}
    	return false;
       
	}
	
	function delete_record($where_array)
	{
		if(is_array($where_array)&&!empty($where_array))
		{
			$result=$this->db->delete($this->table,$where_array);

			if($result)
				return true;
		}
		return false;
		
	}

	function get_all_users()
	{
		$result=$this->db->get($this->table);

		if($result)
			return $result->result_array();
		else
			return array();
	}
}

/* End of file users_model.php */
/* Location: mis/application/models/user/users_model.php */
