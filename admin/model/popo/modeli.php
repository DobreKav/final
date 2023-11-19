<?php
     class Modeli{
        // class atributes
        private $model_id;
        private $model_name;
        private $color;
        private $fuel;
        private $price;
        private $marki_id;
        private $img_model;
        // construct
        public function __construct(){}
        // setters 
        public function setModel_id ($model_id){
            $this -> model_id = $model_id;
        }
        public function setModel_name ($model_name){
            $this -> model_name = $model_name;
        }
        public function setColor ($color){
            $this -> color = $color;
        }
        public function setFuel ($fuel){
            $this -> fuel = $fuel;
        }
        public function setPrice ($price){
            $this -> price = $price;
        }
        public function setMarki_id ($marki_id){
            $this -> marki_id = $marki_id;
        }
        public function setImg_model ($img_model){
            $this -> img_model = $img_model;
        }
        // geters
        public function getModel_id (){
            return $this -> model_id;
        }
        public function getModel_name (){
            return $this -> model_name;
        }
        public function getColor (){
            return $this -> color;
        }
        public function getFuel (){
            return $this -> fuel;
        }
        public function getPrice (){
            return $this -> price;
        }
        public function getMarki_id (){
            return $this -> marki_id;
        }
        public function getImg_model (){
            return $this -> img_model;
        }
     }
?>