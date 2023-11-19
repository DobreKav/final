<?php



require_once '../lib/db.php';
$DB = new DB();
$data =json_decode(file_get_contents("php://input"));
// $table_name="modeli";
$table_name=$data[0]->table_name;
$pk_value =$data[0]->pk_value;

switch($table_name)
{
	case "marki":
        //marki
        //popo marki
        //dao marki
        //marki
        //popo marki
        //dao marki
        require_once 'popo/marki.php';
        require_once 'dao/marki_dao.php';
        //instance

        $objMarki = new MarkiDAO($DB);
        $marki_id = 22;
        $objMarki->setMarki_id($pk_value);//popo
        $objMarki->deleteMarki();//DAO ->CRUD
    break;
//-----------------------------------------------

case "modeli":

require_once 'popo/modeli.php';
require_once 'dao/modeli_dao.php';
//instance
$objModeli = new ModeliDAO($DB);
$modeli_id = 11;
$objModeli->setModel_id($pk_value);
$objModeli->deleteModeli();//DAO ->CRUD
break;
//-----------------------------------------------
case "saloni":
require_once 'popo/salon.php';
require_once 'dao/salon_dao.php';
//instance
$objSalon = new SalonDAO($DB);
// $salon_id = 1;
$objSalon->setSalon_id($pk_value);

$objSalon->deleteSalon();//DAO ->CRUD

break;
//-----------------------------------------------

}
?>