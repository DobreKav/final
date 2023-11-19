
<?php
class Marki
{
	//class private members/attributes
	private $marki_id;
	private $marka_name;
	private $country;
	private $salon_id;
	private $img_path;
	//construct
	public function __construct(){}//default construct
	//setters
	public function setMarki_id($marki_id){
		$this->marki_id	=	$marki_id;
	}
	public function setMarka_name($marka_name){
		$this->marka_name	=	$marka_name;
	}
	public function setCountry($country){
		$this->country	=	$country;
	}
	public function setSalon_id($salon_id){
		$this->salon_id	=	$salon_id;
	}
	public function setImg_path($img_path){
		$this->img_path	=	$img_path;
	}
	//getters
	public function getMarki_id(){
		return $this->marki_id;
	}
	public function getMarka_name(){
		return $this->marka_name;
	}
	public function getCountry(){
		return $this->country;
	}
	public function getSalon_id(){
		return $this->salon_id;
	}
	public function getImg_path(){
		return $this->img_path;
	}
}
?>