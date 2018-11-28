<?php 
	function printErrors($errors){
		echo "<p class='error'>";
			foreach ($errors as $error) {
			echo $error.'<br>';
		}
		echo "</p>";
	}
	
	function verifyQuery($query){
		global $connection;
		if(!isset($query)){
			die("Database query failed").mysqli_error($connection);
		}
	}
	
	function checkReqFields($requireFields){
		$errors = array();
		foreach ($requireFields as $field) {
			if(!isset($_POST[$field]) || strlen(trim($_POST[$field]))<1 ){
				$errors[] = $field." missing / invalid";
			}

		}
		return $errors;
	}
	
	
	function checkMaxLenFields($maxLenFields){
		$errors = array();
		foreach ($maxLenFields as $field => $value) {
			if (trim(strlen($_POST[$field]))>$value){
				$errors[] = $field." must be less than ".$value;
			}
		}
		return $errors;
	}
	
	function checkEqualLenFields($LenFields){
		$errors = array();
		foreach ($LenFields as $field => $value) {
			if (trim(strlen($_POST[$field]))!=$value){
				$errors[] = $field." must be equal to ".$value;
			}
		}
		return $errors;
	}

	// function check(){
	  // if(document.getElementById('servergroup').value!='')
		// document.getElementById('servername').disabled=false;
	  // else
		// document.getElementById('servername').disabled=true;
	// }
 ?>