<?php
class ModeliDAO extends Modeli
{
	//class members/attributes
	private $table_name ="modeli";//mySQL
	private $db_conn	=	null;
	//construct
	public function __construct($DB){
		$this->db_conn=$DB;
	}
	//methods -> CRUD mySQL
	//getters
	public function insertModeli(){
		// $model_name	=	parent :: getModel_name();
		// $color	=	parent :: getColor();
		// $fuel	=	parent :: getFuel();
        // $price  =   parent :: getPrice();
		// $marki_id  =   parent :: getMarki_id();
		$model_name	=	parent :: getModel_name();
		$color	=	parent :: getColor();
		$fuel	=	parent :: getFuel();
        $price  =   parent :: getPrice();
		$marki_id  =   parent :: getMarki_id();
		$img_model =	parent :: getImg_model();
		//columns table_name=modeli
		$columns_name="model_name,color,fuel, price, marki_id, img_model";
		$columns_value="'$model_name','$color','$fuel',$price,$marki_id, $img_model";
		$this->db_conn->insertRow($this->table_name,$columns_name,$columns_value);
	}
	public function deleteModeli(){
		$model_id	=	parent :: getModel_id();
		$this->db_conn->deleteRow($this->table_name, "model_id" , $model_id);
	}
	public function updateModeli(){
	
		$model_name	=	parent :: getModel_name();
		$color		=	parent :: getColor();
		$fuel		=	parent :: getFuel();
		$price		=	parent :: getPrice();
		$img_model 	=	parent :: getImg_model();
		$marki_id 	=   parent :: getMarki_id();
		$pk_value	=	parent :: getModel_id();

		$columns	=	"model_name='$model_name',color='$color', fuel='$fuel', price= $price, marki_id=$marki_id, img_model='$img_model";
		$pk_name 	=	"model_id";
		$this->db_conn->updateRow($this->table_name,$columns,$pk_name,$pk_value);
	}
	public function selectModeli(){
		return $this->db_conn->selectRow($this->table_name."
		 inner JOIN marki		on marki.marki_id = modeli.marki_id 
		 INNER JOIN salon		ON marki.salon_id = salon.salon_id");
	}

}

?>