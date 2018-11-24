<?php session_start() ?>
<?php require_once('includes/functions.php') ?>
<?php require_once('includes/connection.php') ?>

<?php
$firstname = '';
$lastname = '';
$email = '';
$password = '';
$contact_number = '';
$address = '';
$confirmPassword = '';
$type = '';
if (isset($_POST['register'])) {
	$errors = array();
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $email = mysqli_real_escape_string($connection, $_POST['email']);
    $password = $_POST['password'];
	$contact_number = $_POST['contact_number'];
	$address = $_POST['address'];
    $type= $_POST['type'];
    // checking required fields
    $reqFields = array('firstname', 'lastname', 'email','contact_number','address','password', 'type');
    $errors = array_merge($errors, checkReqFields($reqFields));

    // check max len fields
    $maxLenFields = array('email' => 100, 'password' => 8);
    $errors = array_merge($errors, checkMaxLenFields($maxLenFields));
	
	//check validate number
	// $LenFields = array('contact_number' => 10);
    // $errors = array_merge($errors, checkEqualLenFields($LenFields));

    //checking if passwords match
    if (!($_POST['password'] === $_POST['confirmPassword'])) {
        $errors[] = "password not match";
    }
    //check if email already exists...
    $query = "SELECT * FROM customers WHERE email='{$email}'";
    $resultSet = mysqli_query($connection, $query);
    verifyQuery($resultSet);
    if (mysqli_num_rows($resultSet) > 0) {
        $errors[] = "email already exists";
    }
    $query = "SELECT * FROM admins WHERE email='{$email}'";
    $result = mysqli_query($connection, $query);
    verifyQuery($result);
    if (mysqli_num_rows($result) > 0) {
        $errors[] = 'email already exists';
    }
    $query = "SELECT * FROM drivers WHERE email='{$email}'";
    $result = mysqli_query($connection, $query);
    verifyQuery($result);
    if (mysqli_num_rows($result) > 0) {
        $errors[] = 'email already exists';
    }
	$query = "SELECT * FROM assistantDrivers WHERE email='{$email}'";
    $result = mysqli_query($connection, $query);
    verifyQuery($result);
    if (mysqli_num_rows($result) > 0) {
        $errors[] = 'email already exists';
    }

      if (empty($errors)) {

        $firstname = mysqli_real_escape_string($connection, $_POST['firstname']);
        $lastname = mysqli_real_escape_string($connection, $_POST['lastname']);
        $email = mysqli_real_escape_string($connection, $_POST['email']);
		$contact_number = mysqli_real_escape_string($connection, $_POST['contact_number']);
		$address = mysqli_real_escape_string($connection, $_POST['address']);
        $password = mysqli_real_escape_string($connection, $_POST['password']);
        $hashedPassword = sha1($password);
        $type = $_POST['type'];
		$query = "INSERT INTO customers(first_name,last_name,customer_role,email,contact_number,address,password,is_deleted) VALUES('{$firstname}','{$lastname}','{$type}','{$email}','{$contact_number}','{$address}',password({$password}),0)";
        $result = mysqli_query($connection, $query);
        verifyQuery($result);
		
		
		// $query = "CREATE USER '{$email}'@localhost IDENTIFIED BY '{$password}';";
		// $result = mysqli_query($connection, $query);
        // verifyQuery($result);
		// $query = "GRANT SELECT ON *.* TO '{$email}'@localhost' WITH GRANT OPTION;";
		// $result = mysqli_query($connection, $query);
        // verifyQuery($result);
		
		
		
        // $query = "SELECT * FROM customers WHERE email='{$email}' LIMIT 1";
        // $result = mysqli_query($connection, $query);
        // verifyQuery($result);
        // if (mysqli_num_rows($result) != 1) {
            // echo 'Error';
        // } else {
            // $customer = mysqli_fetch_assoc($result);
            // $userObject = $user['object'];
            // $userId = $user['id'];
            // $userObject = unserialize($userObject);
            // $userObject->setuserId($userId);

            // $userObject = serialize($userObject);

			//save back in data base
            // $query = "UPDATE users SET object='{$userObject}' WHERE id='{$userId}'";
            // $result = mysqli_query($connection, $query);
            // verifyQuery($result);

            //send welcome message
            // $message = "Welcome To Vertex Medical Center";
            // $time = time();
            // $query = "INSERT INTO messages(senderId,senderType,recieverId,recieverType,message,isRead,senderName,timeStamp) VALUES(99999,'system','{$userId}','user','{$message}',0,'vertex medical center','{$time}')";
            // $result = mysqli_query($connection, $query);
            // verifyQuery($result);

            header('Location:index.php?msg=register_successful');
        //}
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
					<li><a href="login.php">Login</a></li>
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
												<h3>Register Here</h3>
												<?php
												if (isset($errors) && !empty($errors)) {
													printErrors($errors);
												}
												?>
												<form method="post" action="registerCustomer.php">
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
															<label for="inputContactNumber"><b>Contact Number:</b></label>
															<input type="text" name="contact_number" class="form-control" id="inputContactNumber" placeholder="0000000000" value = '<?php echo $contact_number ?>'>
														</div>
														
														<div class="12u$">
															<label for="inputAddress"><b>Address:</b></label>
															<input type="text" name="address" class="form-control" id="inputAddress" placeholder="no,street,city,country,postal code" value = '<?php echo $address ?>'>
														</div>
														
														<div class="12u$">
															<label for="type"><b>Customer Type:</b> </label>
															<select name='type'>
																<option value='end customer' id="type">End customer</option>
																<option value='wholesaler' id="type">Wholesaler</option>
																<option value='retailer' id="type">Retailer</option>
																
																
															</select>
														</div>
														
														<div class="12u$">
															<label for="password"><b>Password:</b></label>
															<input type="password"  id="password" name="password" placeholder="password">

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
																<li><a href="index.php" class="button alt">Back</a></li>
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