<?php
//Arrays index
$cars		=array("Volvo","AUDI","SKODA","BMW","VW");
//index position     0       1      2      3
$first_car  = 	$cars[0];//Volvo
$length		=	count($cars);//4
$last_car	=	$cars[$length-1];//VW
//izminime niza loop FOR
for($i=0;$i<count($cars);$i++)
{
	echo "i= $i => cars[$i] = = ".$cars[$i]."<br>";
}
echo "<hr>";
//Arrays assoc
$cars_assoc	=array("S"=>"Volvo","H"=>"AUDI","Cz"=>"SKODA","D"=>"BMW","US"=>"VW");
//index position     0=>S           1=> H     2=>      Cz      3=>D	   4=>US

foreach($cars_assoc as $i => $value) {
  echo "Index=" . $i . ", cars=" . $value;
  echo "<br>";
}
?>