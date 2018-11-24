<?php 

	$dbhost = 'localhost';
	$dbuser = 'root';
	$dbpass = 'abc';
	$dbname = 'supplychain';

	$connection = mysqli_connect($dbhost,$dbuser,$dbpass,$dbname);

	if (!$connection){
		die("Database connection failed ".mysqli_connect_error());
	}
 ?>