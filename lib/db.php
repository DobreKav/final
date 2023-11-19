<?php
class DB 
{
	//class members/attributes
	private $servername = "localhost";//127.0.0.1
	private $username	= "root";
	private $password	= "";
	private $dbname		= "car";
	private $conn		= null;
	//class construct
	public function __construct(){
		try {
		  $this->conn = new PDO("mysql:host=$this->servername;dbname=$this->dbname", $this->username, $this->password);
		  // set the PDO error mode to exception
		  $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		//   echo "Connected successfully";
		} catch(PDOException $e) {
		  echo "Connection failed: " . $e->getMessage();
		}
	}
	//getters and setters
	//methods -> CRUD
	public function selectRow($table_name){
		$sql="SELECT * FROM $table_name";
			$stmt = $this->conn->prepare($sql);
			$stmt->execute();
			// set the resulting array to associative
			return $stmt->fetchAll();
		}
		public function selectFieldsRow($fields, $table_name){
			$sql="SELECT $fields FROM $table_name";
				$stmt = $this->conn->prepare($sql);
				$stmt->execute();
				// set the resulting array to associative
				return $stmt->fetchAll();
			}
	public function insertRow($table_name,$columns_name,$columns_value){
		$sql="INSERT INTO $table_name($columns_name)
					VALUES($columns_value)";
		// use exec() because no results are returned
		$this->conn->exec($sql);
	}
	public function deleteRow($table_name,$pk_name,$pk_value){
		$sql="DELETE FROM $table_name WHERE $pk_name=$pk_value";
		// use exec() because no results are returned
		$this->conn->exec($sql);
	}
	
		public function updateRow($table_name,$columns,$pk_name,$pk_value){
			$sql ="UPDATE $table_name
					SET $columns
					WHERE $pk_name=$pk_value";
			$this->conn->exec($sql);
		 }
	

}
?>