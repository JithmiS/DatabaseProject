<?php session_start() ?>
<?php require_once('includes/connection.php') ?>
<?php require_once('includes/functions.php') ?> 

 <?php 
 	$id;
 	if(isset($_GET['order_number'])){
 		$order_number= $_GET['order_number'];
		/* $query = "UPDATE orders SET issued_date=(SELECT CURDATE()) WHERE order_number='{$order_number}'";
 		$result = mysqli_query($connection,$query);
 		verifyQuery($result); */
		$query = "UPDATE orders SET delivery_status='ISSUED' WHERE order_number='{$order_number}'";
 		$result = mysqli_query($connection,$query);
 		verifyQuery($result);
		// $query = "SELECT get_trip_no({$order_number})";
 		// $result = mysqli_query($connection,$query);
		
 		// verifyQuery($result);

 		header("Location:manageOrders.php?msg=successfully_Issued&&order_number='{$order_number}'");
 	}
  ?>
