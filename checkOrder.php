<?php session_start() ?>
<?php require_once('includes/connection.php') ?>
<?php require_once('includes/functions.php') ?> 

 <?php 
 	$id;
 	if(isset($_GET['order_number'])){
 		$order_number= $_GET['order_number'];
		$query = "UPDATE orders SET delivery_status='CHECKED' WHERE order_number='{$order_number}'";
 		$result = mysqli_query($connection,$query);
 		verifyQuery($result);
		
		/*$query = "UPDATE orders SET checked_time=(SELECT CURTIME()) WHERE order_number='{$order_number}'";
 		$result = mysqli_query($connection,$query);
 		verifyQuery($result);
		$query = "UPDATE orders SET checked_date=(SELECT CURDATE()) WHERE order_number='{$order_number}'";
 		$result = mysqli_query($connection,$query);
 		verifyQuery($result); */

 		header("Location:storeManager.php?msg=successfully_check&&order_number='{$order_number}'");
 	}
  ?>
