<?php
class Person
{
	//class attributes / members
	private $adultAge = 18;
	//construct
	public function __construct(){}
	//geterrs and setters
	public function setAdultAge($adultAge){
		$this->adultAge=$adultAge;
	}
	public function getAdultAge(){
		return $this->adultAge;
	}
	//methods

	public function isAdult($age){
		if($age>=$this->adultAge){
			echo "Polnoleten";
		}else{
			echo "Maloleten";
		}
	}

}
?>