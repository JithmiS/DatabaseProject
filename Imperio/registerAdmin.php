<?php session_start() ?>
<?php require_once('includes/functions.php') ?>
<?php require_once('includes/connection.php') ?>


<?php 
if (!isset($_SESSION['admin_id'])) {
    header('Location:index.php');
}
?>

<?php

$firstname = '';
$lastname = '';
$email = '';
$address = '';
$contact_number = '';

 
if (isset($_POST['register'])) {
	$errors = array();
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $email = $_POST['email'];
    $address = $_POST['address'];
	$contact_number = $_POST['contact_number'];
    $password = $_POST['password'];
    $position = $_POST['position'];
    
	
    // checking for all fields 
    $reqFields = array('firstname', 'lastname', 'email', 'address','contact_number', 'position', 'password');
    $errors = array_merge($errors, checkReqFields($reqFields));

    // check max len fields
    $maxLenFields = array('email' => 100, 'password' => 40);
    $errors = array_merge($errors, checkMaxLenFields($maxLenFields));

    $query = "SELECT * FROM customers WHERE email='{$email}'";
    $resultSet = mysqli_query($connection, $query);
    verifyQuery($resultSet);
    if (mysqli_num_rows($resultSet) > 0) {
        $errors[] = "email already exists";
    }
    $query = "SELECT * FROM admins WHERE email='{$email}'";
    $result = mysqli_query($connection, $query);
    verifyQuery($result);
    if (mysqli_num_rows($result) != 0) {
        $errors[] = 'email already exists';
    }
    $query = "SELECT * FROM drivers WHERE email='{$email}'";
    $result = mysqli_query($connection, $query);
    verifyQuery($result);
    if (mysqli_num_rows($result) != 0) {
        $errors[] = 'email already exists';
    }
    $query = "SELECT * FROM assistantDrivers WHERE email='{$email}'";
    $result = mysqli_query($connection, $query);
    verifyQuery($result);
    if (mysqli_num_rows($result) != 0) {
        $errors[] = 'email already exists';
    }
   
    if (empty($errors)) {
		$firstname = mysqli_real_escape_string($connection, $_POST['firstname']);
        $lastname = mysqli_real_escape_string($connection, $_POST['lastname']);
        $email = mysqli_real_escape_string($connection, $_POST['email']);
		$address = mysqli_real_escape_string($connection, $_POST['address']);
        $password = mysqli_real_escape_string($connection, $_POST['password']);
        $hashedPassword = sha1($password);
		
		if($position == 'admin'){
			$query = "INSERT INTO admins(first_name, last_name, email, address, contact_number, password, is_deleted) VALUES('{$firstname}','{$lastname}','{$email}','{$address}','{$contact_number}','{$hashedPassword}',0)";
		}else if($position == 'driver'){
			$query = "INSERT INTO drivers(first_name, last_name, email, address, contact_number, password, is_deleted) VALUES('{$firstname}','{$lastname}','{$email}','{$address}','{$contact_number}','{$hashedPassword}',0)";
		}else if($position == 'assistant_driver'){
			$query = "INSERT INTO assistantDrivers(first_name, last_name, email, address, contact_number, password, is_deleted) VALUES('{$firstname}','{$lastname}','{$email}','{$address}','{$contact_number}','{$hashedPassword}',0)";
		}
	    $result = mysqli_query($connection, $query);
        verifyQuery($result);

        // $query = "SELECT * FROM admins WHERE email='{$email}' LIMIT 1";
        // $result = mysqli_query($connection, $query);
        // verifyQuery($result);
        // if (mysqli_num_rows($result) != 1) {
            // echo 'Error';
        // } else {
            // $admin = mysqli_fetch_assoc($result);
            // $adminObject = $admin['object'];
            // $adminId = $admin['id'];
            // $adminObject = unserialize($adminObject);
            // $adminObject->setAdminId($adminId);

            // $adminObject = serialize($adminObject);

            //save back in data base
            // $query = "UPDATE admins SET object='{$adminObject}' WHERE id='{$adminId}'";
            // $result = mysqli_query($connection, $query);
            // verifyQuery($result);

            //send welcome message
            // $message = "Welcome To Vertex Medical Center";
            // $time = time();
            // $query = "INSERT INTO messages(senderId,senderType,recieverId,recieverType,message,isRead,senderName,timeStamp) VALUES(99999,'system','{$adminId}','admin','{$message}',0,'vertex medical center','{$time}')";
            // $result = mysqli_query($connection, $query);
            // verifyQuery($result);

            header('Location:admin.php?msg=register_successful');
        }
    
}
?>




<!DOCTYPE HTML>
<!--
	Urban by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Register</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="subpage">

		<!-- Header -->
			<header id="header">
				<div class="logo"><a href="index.html">Supply Chain Management System<span> by TEAMSPIRIT</span></a></div>
				<a href="#menu">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="index.php">Home</a></li>
					<li><a href="registerCustomer.php">Register</a></li>
					<li><a href="elements.php">Elements</a></li>
				</ul>
			</nav>

		<!-- Main -->
			<div id="main">
				<section class="wrapper style1">
					<div class="inner">
						
										<div class="container 50%">
										<div class="box">
											<!-- Form -->
												<h3>Add New Member Here</h3>
												<?php
												if (isset($errors) && !empty($errors)) {
													printErrors($errors);
												}
												?>

												<form method="post" action="registerAdmin.php">
													<div class="row uniform">
														<div class="12u$">
															 <label for="inputFirstName"><b>First Name:</b></label>
															<input type="text" name="firstname" id="inputFirstName" placeholder="firstname" <?php echo 'value="' . $firstname . '"'; ?>>
														</div>
														
														<div class="12u$">
															  <label for="inputlastName"><b>Last Name:</b></label>
																<input type="text" name="lastname" class="form-control" id="inputlastName" placeholder="lastname" <?php echo 'value="' . $lastname . '"'; ?> >
														</div>
														
														<div class="12u$">
															<label for="inputEmail4"><b>Email:</b></label>
															<input type="email" name="email" class="form-control" id="inputEmail4" placeholder="someone@example.com" value = '<?php echo $email ?>'>
														</div>
														
														<div class="12u$">
															<label for="position"><b>Position:</b> </label>
															<select name='position'>
																<option value='admin'>Admin</option>
																<option value='driver'>Driver</option>
																<option value='assistant_driver'>Assistant Driver</option>
																
																
															</select>
														</div>
														
														<div class="12u$">
															<label for="address"><b>Adress:</b></label>
															<input type="text" name="address" placeholder="address " value='<?php echo $address?>'>
														</div>
														
														<div class="12u$">
															<label for="address"><b>Contact Number:</b></label>
															<input type="text" name="contact_number" placeholder="contact number" value='<?php echo $contact_number?>'>
														</div>
														
														<div class="12u$">
															<label for="password"><b>Password:</b></label>
															<input type="password" id="password" name="password" placeholder="password">

														</div>
														
														<div class="12u$">
															<label for="confirmPassword"><b>Confirm Password:</b></label>
															<input type="password" id="confirmPassword" name="confirmPassword" placeholder="confirm password">
                    
														</div>
																										
														
														<!-- Break -->
														<div class="12u$">
															<ul class="actions">
																<li><input type="submit" name ="register" id="register" value="Register" /></li>
																<!-- <li><input type="reset" value="Reset" class="alt" /></li> -->
																<li><a href="admin.php" class="button alt">Back</a></li>
															</ul>
														</div>
													</div>
												</form>
												<br>
											<!-- Form -->									
										</div>
										<!-- Box -->
										</div>						
					</div>
			</section>
		</div>
		<!-- Footer -->
			<footer id="footer">
				<div class="copyright">
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-snapchat"><span class="label">Snapchat</span></a></li>
					</ul>
					<p>&copy; Untitled. All rights reserved. Design: TEAMSPIRIT</p>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>

 <?php mysqli_close($connection) ?>