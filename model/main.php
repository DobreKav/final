<?php
require_once "person.php";

echo "OOP Person<br>";


//Instance
$ljubisa	=	new Person();//set default value
$ljubisa    -> isAdult(19);
echo "<hr>";

//Instance
$matej	=	new Person();
//echo "Matej age> ".$matej	->adultAge;//public
echo "Matej age> ".$matej	->getAdultAge();//private
//$matej	->adultAge=21;//public
$matej	->setAdultAge(21);//private
//echo "Matej age> ".$matej	->adultAge;//public
echo "Matej age> ".$matej	->getAdultAge();//private
$matej    -> isAdult(18);











//----------------
$a=3;//
$b=4;
$b=5;
$c=$a+$b;
?>