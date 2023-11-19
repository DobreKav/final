<?php
class Salon{

    // class atributes
    private $salon_id;
    private $city;
    private $address;
    private $tel;

    // construct
    public function __construct(){}

    // setters 
    public function setSalon_id ($salon_id){
        $this -> salon_id = $salon_id;
    }
    public function setCity ($city){
        $this -> city = $city;
    }
    public function setAddress ($address){
        $this -> address =$address;
    }
    public function setTel ($tel){
        $this -> tel =$tel;
    }

    // geters
    public function getSalon_id (){
        return $this -> salon_id;
    }
    public function getCity(){
        return $this -> city;
    }
    public function getAddress(){
        return $this -> address;
    }

    public function getTel (){
        return $this -> tel;
    }



}
 
?>