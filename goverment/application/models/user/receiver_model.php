<?
class Receiver_model extends CI_Model
{
	var $table = 'smscontact';

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
	
	function delete($where_array)
	{
		if(is_array($where_array)&&!empty($where_array))
		{
			$result=$this->db->delete($this->table,$where_array);

			if($result)
				return true;
		}
		return false;
		
	}


	function get_all_contacts()
	{
		$result=$this->db->get($this->table);

		if($result)
			return $result->result_array();
		else
			return array();
	}

}

?>