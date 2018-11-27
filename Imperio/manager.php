<?php session_start() ?>
<?php require_once('includes/connection.php') ?>
<?php require_once('includes/functions.php') ?> 

<?php
if (!isset($_SESSION['manager_id'])) {
    header('Location:index.php');
}
$manager_id = $_SESSION['manager_id'];
?>

<!DOCTYPE HTML>
<!--
	Urban by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Manager Home Page</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/style.css" />
	</head>
	<body class="subpage">

		<!-- Header -->
			<header id="header">
				<div class="logo"><a href="index.html">Supply Chain Management System<span> by TEAMSPIRIT</span></a></div>
				<a href="index.php" class="button small special">Log Out</a>
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
						Dashboard<hr>
						
            <!-- Widgets -->
            <div class="row clearfix">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<a href="registerNew.php">
                    <div class="info-box bg-pink hover-expand-effect">
					
                        <div class="icon">
                             <i class="fa fa-user-plus"></i>
                        </div>
                        <div class="content">
                            <div class="text">EMPLOYEES</div>
                           
                        </div>
                    </div>
				</a>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<a href="#">
                    <div class="info-box bg-cyan hover-expand-effect">
                        <div class="icon">
                            <i class="fa fa-file"></i>
                        </div>
                        <div class="content">
                            <div class="text">REPORTS </div>
                            
                        </div>
                    </div>
				</a>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<a href="manageOrders.php">
                    <div class="info-box bg-light-green hover-expand-effect">
                        <div class="icon">
                            <i class="fa fa-shopping-cart"></i>
                        </div>
                        <div class="content">
                            <div class="text">ORDERS</div>
                            
                        </div>
                    </div>
				</a>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<a href="#">
                    <div class="info-box bg-orange hover-expand-effect">
                        <div class="icon">
                            <i class="fa fa-users"></i>
                        </div>
                        <div class="content">
                            <div class="text">CUSTOMERS</div>
                            
                        </div>
                    </div>
				</a>
                </div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<a href="#">
					<div class="info-box bg-teal hover-expand-effect">
						<div class="icon">
							<i class="fa fa-map-marker"></i>
						</div>
						<div class="content">
							<div class="text">ROUTES</div>
							
						</div>
					</div>
				</a>
				</div>
			</div>
			
            <!-- #END# Widgets -->
						
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