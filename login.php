<?php session_start() ?>
<?php require_once('includes/connection.php') ?>
<?php require_once('includes/functions.php') ?>

<?php
$email = "";
//checking if username and password entered
if (isset($_POST['login'])) {
    $errors = array();
    if (!isset($_POST['email']) || strlen(trim($_POST['email'])) < 1) {
        $errors[] = "Username missing / invalid";
    }
    if (!isset($_POST['password']) || strlen(trim($_POST['password'])) < 1) {
        $errors[] = "Password missing / invalid";
    }
    if (empty($errors)) {
        $email = mysqli_real_escape_string($connection, $_POST['email']);
        $password = mysqli_real_escape_string($connection, $_POST['password']);
        // $hashed_password = sha1($password);
	
		
        $query = "SELECT * FROM users WHERE email='{$email}' AND password=password({$password}) AND is_deleted=0 LIMIT 1";
        $result_set = mysqli_query($connection, $query);
        verifyQuery($result_set);
        if (mysqli_num_rows($result_set) == 1) {
			
			$query = "SELECT * FROM customers WHERE email='{$email}' LIMIT 1";
			$result_set = mysqli_query($connection, $query);
			verifyQuery($result_set);
			if (mysqli_num_rows($result_set) == 1) {
				$customer = mysqli_fetch_assoc($result_set);
				$_SESSION['customer_id'] = $customer['customer_id'];
				header("Location: customer.php?msg=login_success&&customer_id={$_SESSION['customer_id']}");
			}else{
				$errors[] = "not a customer";
			}
		
			$query = "SELECT * FROM managers WHERE email='{$email}' LIMIT 1";
			$result_set = mysqli_query($connection, $query);
			verifyQuery($result_set);
			if (mysqli_num_rows($result_set) == 1) {
				$manager = mysqli_fetch_assoc($result_set);
				$_SESSION['manager_id'] = $manager['manager_id'];
				header("Location: manager.php?msg=login_success&&manager_id={$_SESSION['manager_id']}");
			}else{
				$errors[] = "not a manager";
			}
		
			$query = "SELECT * FROM storeManagers WHERE email='{$email}' LIMIT 1";
			$result_set = mysqli_query($connection, $query);
			verifyQuery($result_set);
			if (mysqli_num_rows($result_set) == 1) {
				$store_manager = mysqli_fetch_assoc($result_set);
				$_SESSION['store_manager_id'] = $store_manager['store_manager_id'];
				header("Location: storeManager.php?msg=login_success&&store_manager_id={$_SESSION['store_manager_id']}");
			}else{
				$errors[] = "not a storeManager";
			}
			
			$query = "SELECT * FROM drivers WHERE email='{$email}' LIMIT 1";
			$result_set = mysqli_query($connection, $query);
			verifyQuery($result_set);
			if (mysqli_num_rows($result_set) == 1) {
				$driver = mysqli_fetch_assoc($result_set);
				$_SESSION['driver_id'] = $driver['driver_id'];
				header("Location: driver.php?msg=login_success&&driver_id={$_SESSION['driver_id']}");
			}else{
				$errors[] = "not a driver";
			}
			
			$query = "SELECT * FROM assistantDrivers WHERE email='{$email}' LIMIT 1";
			$result_set = mysqli_query($connection, $query);
			verifyQuery($result_set);
			if (mysqli_num_rows($result_set) == 1) {
				$assistantDriver = mysqli_fetch_assoc($result_set);
				$_SESSION['assistant_driver_id'] = $assistantDriver['assistant_driver_id'];
				header("Location:assistantDriver.php?msg=login_success&&assistant_driver_id={$_SESSION['assistant_driver_id']}");
			}else{
				$errors[] = "not a assistantDriver";
			}
		}
		$errors[] = "Invalid Username / Password";
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
		<title>Login</title>
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
												<h3>Login Here</h3>
												 <?php
												if (isset($errors) && !empty($errors)) {
													echo "<p class='error'>Invalid Username / Password</p>";
												}
												?>
												<?php
												if (isset($_GET['logout'])) {
													echo '<p class="info">You have successfully logged out</p>';
												}
												?>
												<form method="post" action="login.php">
													<div class="row uniform">
														<div class="12u$">
															<input type="text" name="email" id="email" value="" placeholder="Username" />
														</div>
														
														<div class="12u$">
															<input type="password" name="password" id="password" value="" placeholder="Password" />
														</div>
														
														
														<!-- Break -->
														<div class="6u 12u$(small)">
															<input type="checkbox" id="copy" name="copy">
															<label for="copy">Remember me</label>
														</div>
														
														<!-- Break -->
														<div class="12u$">
															<ul class="actions">
																<li><input type="submit" name ="login" id="login" value="Login" /></li>
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