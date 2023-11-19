<?php
class SalonDAO extends Salon
{
	//class members/attributes
	private $table_name ="salon";//mySQL
	private $db_conn	=	null;
	//construct
	public function __construct($DB){
		$this->db_conn=$DB;
	}
	//methods -> CRUD mySQL
	//getters
	public function insertSalon(){
		$city	    =	parent :: getCity();
		$address	=	parent :: getAddress();
		$tel	    =	parent :: getTel();
		//columns table_name=salon
		$columns_name="city, address, tel";
		$columns_value="'$city','$address','$tel'";
		$this->db_conn->insertRow($this->table_name,$columns_name,$columns_value);
        
	}
	public function deleteSalon(){
		$salon_id	=	parent :: getSalon_id();
		$this->db_conn->deleteRow($this->table_name, "salon_id" , $salon_id);
	}
	public function updateSalon(){
	
		$city	    =	parent :: getCity();
		$address	=	parent :: getAddress();
		$tel		=	parent :: getTel();
		$pk_value	=	parent :: getSalon_id();
		$columns	=	"city='$city',address='$address', tel=$tel";
		$pk_name 	=	"salon_id";
		$this->db_conn->updateRow($this->table_name,$columns,$pk_name,$pk_value);
		
	}
	public function selectSalon(){
		return $this->db_conn->selectRow($this->table_name);
	}

}

?>