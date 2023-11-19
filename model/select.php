<?php
require_once '../lib/db.php';
$DB = new DB();
$data = array();
//marki
//popo marki
//dao marki
// $table_name="modeli";
$table_name=$_GET['table_name'];
switch($table_name)
{
	case "marki":
        require_once 'popo/marki.php';
        require_once 'dao/marki_dao.php';
        //instance
        $objMarki = new MarkiDAO($DB);
		$result = $objMarki->selectMarki();//DAO ->CRUD
 
        foreach($result as $row){
                
            $data[] =array(
                "marki_id" =>$row["marki_id"],
                "marka_name" =>$row["marka_name"],
                "country" =>$row["country"],
                "salon_id" =>$row["salon_id"],
                "img_path" =>$row["img_path"],
            );
        }
		// var_dump($result);
        
    break;

//-----------------------------------------------

	case "modeli":
        require_once 'popo/modeli.php';
        require_once 'dao/modeli_dao.php';
        //instance

        $objModeli = new ModeliDAO($DB);
		
        $result = $objModeli->selectModeli();//DAO ->CRUD

        foreach($result as $row){
                // column_name
            $data[] =array(
                    "model_id" =>$row["model_id"],
                    "model_name" =>$row["model_name"],
                    "color" =>$row["color"],
                    "fuel" =>$row["fuel"],
                    "price" =>number_format($row["price"], 2),
                    "marki_id" =>$row["marki_id"],
                    "img_path" =>$row["img_path"],
                   
                    "marka_name" =>$row["marka_name"],
                    "country" =>$row["country"],
                    "salon_id" =>$row["salon_id"],
                    "img_model" =>$row["img_model"],

                    "city" =>$row["city"],
                    "address" =>$row["address"],
                    "tel" =>$row["tel"]

            );
            }
            // var_dump($result);

        //-----------------------------------------------
    break;
    case "salon":
        require_once 'popo/salon.php';
        require_once 'dao/salon_dao.php';
        //instance
        $objSalon = new SalonDAO($DB);
        
        $result =$objSalon->selectSalon();//DAO ->CRUD

        foreach($result as $row){
                    // column_name
            $data[] =array(
                    "salon_id" =>$row["salon_id"],
                    "city" =>$row["city"],
                    "address" =>$row["address"],
                    "tel" =>$row["tel"]
            );
            }
            // var_dump($result);
            


        //-----------------------------------------------
    break;

    default:
         echo"Ne postoi takva tabela";
    break;

    }
    echo json_encode($data, true);
?>