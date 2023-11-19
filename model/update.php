<?php
require_once '../lib/db.php';
$DB = new DB();
$table_name="modeli";
switch($table_name)
{
	case "marki":

    //marki
    //popo marki
    //dao marki
    require_once 'popo/marki.php';
    require_once 'dao/marki_dao.php';
    //instance
        $objMarki = new MarkiDAO($DB);
        $marka_name = "bmw";
        $country = "DE";
        $salon_id   = "1";
        $marki_id ="2";
        $objMarki->setMarka_name($marka_name);//popo
        $objMarki->setCountry($country);//popo
        $objMarki->setSalon_id($salon_id);//popo
        $objMarki->setMarki_id($marki_id);//popo
        $objMarki->updateMarki();//DAO ->CRUD

break;
//-----------------------------------------------


case "modeli":
    require_once 'popo/modeli.php';
    require_once 'dao/modeli_dao.php';
    //instance
        $objModeli = new ModeliDAO($DB);
        $model_name = "A6";
        $color      = "Green";
        $fuel       = "Disel";
        $price      = 25000;
        $marki_id   = "22";
        $model_id  = "1";
        $objModeli->setModel_name($model_name);//popo
        $objModeli->setColor($color);//popo
        $objModeli->setFuel($fuel);//popo
        $objModeli->setPrice($price);//popo
        $objModeli->setMarki_id($marki_id);//popo
        $objModeli->setModel_id($model_id);
        $objModeli->updateModeli();//DAO ->CRUD

break;
//-----------------------------------------------
case "salon":
    require_once 'popo/salon.php';
    require_once 'dao/salon_dao.php';
    //instance
        $objSalon = new SalonDAO($DB);
        $city     = "Skopje";
        $address  = "ul. Parizanska br. 4";
        $tel      = "072333444";
        $salon_id = "1";
        $objSalon->setCity($city);//popo
        $objSalon->setAddress($address);//popo
        $objSalon->setTel($tel);//popo
        $objSalon->setSalon_id($salon_id);
        $objSalon->updateSalon();//DAO ->CRUD
break;
//-----------------------------------------------

}

?>