<?php
require_once '../../lib/db.php';
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
        $marka_name=$data[0]->marka_name;
        $country= $data[0] ->country;
        $salon_id=$data[0]->salon_id;
        $img_path =$data[0] ->img_path;
        $marki_id = $data[0]->marki_id;

        
        $objMarki->setMarka_name($marka_name);//popo
        $objMarki->setCountry($country);//popo
        $objMarki->setSalon_id($salon_id);//popo
        $objMarki ->setImg_path($img_path);
        $objMarki->setMarki_id($marki_id);//popo
        $objMarki->updateMarki();//DAO ->CRUD

break;
//-----------------------------------------------


case "modeli":
    require_once 'popo/modeli.php';
    require_once 'dao/modeli_dao.php';
    //instance
        $objModeli = new ModeliDAO($DB);

        $model_name = $data[0]->model_name;
        $color      = $data[0]->color;
        $fuel       = $data[0]->fuel;
        $price      = $data[0]->price;
        $marki_id   = $data[0]->marki_id;
        $img_model  = $data[0]->img_model;
        
        $objModeli->setModel_name($model_name);//popo
        $objModeli->setColor($color);//popo
        $objModeli->setFuel($fuel);//popo
        $objModeli->setPrice($price);//popo
        $objModeli->setMarki_id($marki_id);//popo
        $objModeli->setModel_id($model_id);
        $objImg_model->setImg_model($img_model);
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