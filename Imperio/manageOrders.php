<?php session_start() ?>
<?php require_once('includes/connection.php') ?>
<?php require_once('includes/functions.php') ?> 

<?php
if (!isset($_SESSION['manager_id'])) {
    header('Location:index.php');
}
?>

<?php
$orderList = '';
$query = "SELECT * FROM orders WHERE delivery_status='PENDING'";
$orders = mysqli_query($connection, $query);
verifyQuery($orders);

while ($order = mysqli_fetch_assoc($orders)) {
    // $doctorObject = $doctor['object'];
    // $doctorObj = base64_encode($doctorObject);
    // $doctorObject = unserialize($doctorObject);
    $order_number = $order['order_number'];
    $customer_id = $order['customer_id'];
	$delivery_add = $order['to_building_number'].','.$order['to_street'].','.$order['to_city'];
    $order_price = $order['order_price'];
	$order_size = $order['order_size'];
    $route_no = $order['route_no'];
    // $activeTimeList = $doctorObject->getAvailableTime();
    // $activeTime = '';
    // foreach ($activeTimeList as $day => $time) {
        // $activeTime.=$day . ' &nbsp ' . 'From ' . $time['startTime'] . 'To ' . $time['endTime'] . '<br>';
    // }
    $orderList.="<tr>";
    $orderList.="<td>{$order_number}</td>";
    $orderList.="<td>{$customer_id}</td>";
    $orderList.="<td>{$delivery_add}</td>";
    $orderList.="<td>{$order_price}</td>";
    $orderList.="<td>{$order_size}</td>";
    $orderList.="<td>{$route_no}</td>";
	
	 $orderList.="<td><a href=\"issueOrder.php?order_number={$order_number}\" class=\"button fit\">SEND</a></td></tr>";
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
		<title>Orders</title>
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
						Accept Orders<hr>
						<div class="table-wrapper">
											<table class="alt">
												<thead>
													<tr>
														<th>Order Number</th>
														<th>Customer ID</th>
														<th>Delivery Address</th>
														<th>Order Price</th>
														<th>Order Size</th>
														<th>Route Number</th>
														
													</tr>
												</thead>
												<tbody>
													<?php echo $orderList ?>
												</tbody>
												
											</table>
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