<?php session_start(); ?> <!-- starting session -->
<?php require 'function.php'; ?> <!-- Calling  pre-built function -->
<?php ob_start(); ?>  <!--  Starting buffer output -->
<!DOCTYPE html>
<html lang="en-US" ng-app>

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta name="keywords" content="DoryPOS, Appsolic Lab, DevSazal, Sazal Ahamed, Sajal Efran, appsolic.io , DoryPOS - A Crony of Point Of Sale" />
	<meta name="description" content="we are selling the best quality products and we export all over bangladesh.. " />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<title>DoryPOS - A Crony of Point Of Sale</title>

	<!-- Stylesheets -->
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css" media="all" />
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-theme.css" media="all" />
	<link rel="stylesheet" type="text/css" href="assets/css/normalize.css" media="all" />
	<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.html" media="all" />
	<link rel="stylesheet" type="text/css" href="assets/css/style.css" media="all" />
	<link rel="stylesheet" type="text/css" href="assets/css/responsive.css" media="all" />

	<link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.html" />

	<!--sweetalert lib-->
	<script src="assets/js/sweetalert.min.js"></script>
	<link rel="stylesheet" href="assets/css/sweetalert.min.css">
	<!--angular-->
	<script src="assets/js/angular.min.js"></script>
	<!-- [if lt ie 9]> <script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> <![endif] -->
	<script src="assets/js/jquery-3.2.0.min.js"></script>

	<link href='http://fonts.googleapis.com/css?family=Lato:400,400italic,700' rel='stylesheet' type='text/css'>

	<!-- [if lt ie 9]> <script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> <![endif] -->
	<style>
		.about_us {
    padding-top: 12%;
    padding-right: 5%;
}
.login {
    padding-top: 27%;
}
input[type=email]{
	    background: #6a8092bf;
}
</style>
</head>

<body>
	<div class="main">
		<div class="container">
			<div class="row">
				<div class="whole_sytem col-xm-12  col-sm-12  col-md-12">
					<div class="about_us col-xm-6  col-sm-6  col-md-6">
						<div class="row">
							<h2 style="color:#fff;">DoryPOS</h2>
							<span style="color:#2c3e50;">A Crony Of Point of sales</span><br><br>
							<p style="text-align: justify;text-justify: inter-word; font-size:14px;color:#2c3e50;"><b>DoryPOS makes it easy to sell to your customers, whether you use our responsive web-based POS on Mac or PC, or our Vend Register iPad app. <br><a style="color: #314352;"
									  href="tel:">Phone: +88 01631706287</a><br><a style="color: #0d2233;" href="">Developed by SARA || Email: sara@northsouth.edu ||</a></b></p>


						</div>
						<div class="row appsoliclab" style="margin-top: 0;">
							<img class="img-responsive" src="assets/images/logo-4.png" alt="" />
						</div>
					</div>
					<div class="login col-xm-6  col-sm-6  col-md-6 container">
						<div class="row">
							<form action="index.php" method="post">
								<input class="email col-xm-6  col-sm-6  col-md-6 " aria-hidden="true" type="text" value="sara@nsu.com" Placeholder="Email" name="email_" autocomplete="off" />
								<input class="password col-xm-6  col-sm-6  col-md-6 " aria-hidden="true" type="password" value="1234" Placeholder="Password" name="pass_" autocomplete="off" />
								<input class="submit col-xm-6  col-sm-6  col-md-6" type="submit" name="login_submit" value="Sign In" />
							</form>
						</div>
						<div class="row forger-password">
							<a href="#">Forget Password? Call Us.</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- _______________________php login_____________________ -->

		<?php
				$db=db_connect();

				// checking previous session & cookie
				if (isset($_SESSION['dorypos_admin']) && isset($_COOKIE['userlog'])  ) {
		    header('Location: dashboard.php');

		    }

			// clicking login button
			if (isset($_POST['login_submit'])) {
				if (empty($_POST['email_']) || empty($_POST['pass_'])) {

					$error="Invalid email or password !" ?>
					<script>swal("Opss.....","<?php echo $error; ?>", "error");</script> <?php
				}

			else {


				// define user info
				$email=$_POST['email_'];
				$password=$_POST['pass_'];

				// project injection for ssl attack
				$email=stripslashes($email);
				$password=stripslashes($password);
				$email=mysqli_real_escape_string($db,$email);
				$password=mysqli_real_escape_string($db,$password);

				$user=mysqli_query($db,"SELECT * FROM admin WHERE email='$email'");

				if (mysqli_num_rows($user)==1) {
					//got login acces
					$record=mysqli_fetch_assoc($user);
					 if ($record['password']==$password) {
						 // creating session
  					 $_SESSION['dorypos_admin']=$record['id'];
  					 $_SESSION['dorypos_admin_name']=$record['name'];
  					 $_SESSION['dorypos_root']=$record['root'];
						  // cookie  define
							$c_name=$record['name'];
							$cookie_name='userlog';
							if ($_SESSION['dorypos_root']==FALSE) {
							setcookie($cookie_name, $c_name, time()+(60*60*24));
							}
							else {
								setcookie($cookie_name, $c_name, time()+(60*60*24));
							}

							header('Location: dashboard.php');
					 }
					 else {
					 ?> <script>swal("Opss..","Invalid email or password!", "error");</script> <?php
					 }

				}
				else {
					$error="invalid username or password";
					?> <script>swal("Ops...","Invalid email or password!", "error");</script> <?php
				}

			}
		}


		?>

	<!-- _______________________End php login_____________________ -->


	<script src="../../ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.js"></script>
	<script type="text/javascript" src="assets/js/scripts.js"></script>

</body>


</html>
