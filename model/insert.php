<?php
require_once '../lib/db.php';
$DB = new DB();
$data =json_decode(file_get_contents("php://input"));

// var_dump($data);
//marki
//popo marki
//dao marki

$table_name=$data[0]->table_name;
switch($table_name)
{
	case "marki":
        require_once 'popo/marki.php';
        require_once 'dao/marki_dao.php';
        //instance
        $objMarki = new MarkiDAO($DB);
        // $marka_name="Alfa";
        // $country="AU";
        // $Salon_id="5";
        $marka_name=$data[0]->marka_name;
        $country= $data[0] ->country;
        $salon_id=$data[0]->salon_id;
        $img_path =$data[0] ->img_path;
        $objMarki->setMarka_name($marka_name);//popo
        $objMarki->setCountry($country);//popo
        $objMarki->setSalon_id($salon_id);//popo
        $objMarki->setImg_path($img_path);
        $objMarki->insertMarki();//DAO ->CRUD
    break;

//-----------------------------------------------

	case "modeli":
        require_once 'popo/modeli.php';
        require_once 'dao/modeli_dao.php';
        //instance

        $objModeli = new ModeliDAO($DB);
        // $model_name = "c8";
        // $color      = "Black";
        // $fuel       = "Disel";
        // $price      = 35000;
        // $marki_id   = "23";
        $model_name = $data[0]->model_name;
        $color      = $data[0]->color;
        $fuel       = $data[0]->fuel;
        $price      = $data[0]->price;
        $marki_id   = $data[0]->marki_id;
        $objModeli->setModel_name($model_name);//popo
        $objModeli->setColor($color);//popo
        $objModeli->setFuel($fuel);//popo
        $objModeli->setPrice($price);//popo
        $objModeli->setMarki_id($marki_id);//popo
        $objModeli->insertModeli();//DAO ->CRUD
        //-----------------------------------------------
    break;
    case "salon":
        require_once 'popo/salon.php';
        require_once 'dao/salon_dao.php';
        //instance
        $objSalon = new SalonDAO($DB);
        // $city     = "Bitola";
        // $address  = "Pelagonka";
        // $tel      = "070333555";
        $city     = $data[0]->city;
        $address  = $data[0]->address;
        $tel      = $data[0]->tel;
        $objSalon->setCity($city);//popo
        $objSalon->setAddress($address);//popo
        $objSalon->setTel($tel);//popo
        $objSalon->insertSalon();//DAO ->CRUD
        //-----------------------------------------------
    break;

    default:
         echo"Ne postoi takva tabela";
    break;

    }
?>