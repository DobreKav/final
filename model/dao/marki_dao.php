<?php
class MarkiDAO extends Marki
{
	//class members/attributes
	private $table_name ="marki";//mySQL
	private $db_conn	=	null;
	//construct
	public function __construct($DB){
		$this->db_conn=$DB;
	}
	
	//methods -> CRUD mySQL
	//getters
	public function insertMarki(){
		$marka_name	=	parent :: getMarka_name();
		$country	=	parent :: getCountry();
		$salon_id	=	parent :: getSalon_id();
		$img_path	=	parent :: getImg_path();
		//columns table_name=marki
		$columns_name="marka_name,country,salon_id, img_path";
		$columns_value="'$marka_name','$country','$salon_id', '$img_path'";
		$this->db_conn->insertRow($this->table_name,$columns_name,$columns_value);
	}
	
	public function deleteMarki(){
		$marki_id	=	parent :: getMarki_id();
		$this->db_conn->deleteRow($this->table_name, "marki_id" , $marki_id);
	}
	public function updateMarki(){
	
		$marka_name	=	parent :: getMarka_name();
		$country	=	parent :: getCountry();
		$salon_id	=	parent :: getSalon_id();
		$img_path	=	parent :: getImg_path();
		$pk_value	=	parent :: getMarki_id();
		$columns	=	"marka_name='$marka_name',country='$country', salon_id=$salon_id ,img_path='$img_path'";
		$pk_name 	=	"marki_id";
		$this->db_conn->updateRow($this->table_name,$columns,$pk_name,$pk_value);
		
	}

	public function selectMarki(){
		return $this->db_conn->selectRow($this->table_name);
	}

}


?>