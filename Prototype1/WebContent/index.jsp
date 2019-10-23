<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Health And Nutrition App</title>
	<script src="js/jquery.min.js"></script>
	<script src="js/skel.min.js"></script>
	<script src="js/skel-layers.min.js"></script>
	<script src="js/init.js"></script>
	<noscript>
		<link rel="stylesheet" href="css/skel.css" />
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="css/style-xlarge.css" />
	</noscript>
</head>

<body class="landing">

	<!-- Header -->
	<header id="header">
		<h1><a href="index.jsp">Health And Nutrition App</a></h1>
		<nav id="nav">
			<ul>
				<li><a href="login.jsp" class="button special">Sign In</a></li>
			</ul>
		</nav>
	</header>

	<!-- Banner -->
	<section id="banner">
		<h2>Welcome to Health and Nutrition App.</h2>
		<p>A simple web app for you to manage your diet plan.</p>
		<ul class="actions">
			<li>
				<a href="login.jsp" class="button big">Try me!</a>
			</li>
		</ul>
	</section>

	<!-- One -->
	<section id="one" class="wrapper style1 special">
		<div class="container">
			<header class="major">
				<h2>Function</h2>
				<p>Create a website manage to manage your diet plan. This web application will allow you to
				slection the food you consume into a meal plan that will display all of the nurtitional values.</p>
			</header>
		</div>
	</section>

	<!-- Two -->
	<section id="two" class="wrapper style2 special">
		<div class="container">
			<header class="major">
				<h2>Team Members</h2>
			</header>
			<section class="profiles">
				<div class="row">
					<section class="3u 6u(medium) 12u$(xsmall) profile">
						<img src="images/profile_placeholder.gif" alt="" />
						<h4>Kevin Kemmerer</h4>
						<p>Team Management</p>
					</section>
					<section class="3u 6u(medium) 12u$(xsmall) profile">
						<img src="images/profile_placeholder.gif" alt="" />
						<h4>Mike Desch</h4>
						<p>Database Management</p>
					</section>
					<section class="3u 6u$(medium) 12u$(xsmall) profile">
						<img src="images/profile_placeholder.gif" alt="" />
						<h4>Kevin Her</h4>
						<p>Front End Development</p>
					</section>
					<section class="3u$ 6u$(medium) 12u$(xsmall) profile">
						<img src="images/profile_placeholder.gif" alt="" />
						<h4>Liban Salad</h4>
						<p>Front End Development</p>
					</section>
					<section class="3u$ 6u$(medium) 12u$(xsmall) profile">
						<img src="images/profile_placeholder.gif" alt="" />
						<h4>Thang Huynh</h4>
						<p>Back End Development</p>
					</section>
				</div>
			</section>
		</div>
	</section>
	
	<!-- Three -->
	<section id="three" class="wrapper style3 special">
		<div class="container">
			<header class="major">
				<h2>Leave a Message</h2>
				<p>Give us your feedbacks</p>
			</header>
		</div>
		<div class="container 50%">
			<form action="#" method="post">
				<div class="row uniform">
					<div class="6u 12u$(small)">
						<input name="name" id="name" value="" placeholder="Name" type="text">
					</div>
					<div class="6u$ 12u$(small)">
						<input name="email" id="email" value="" placeholder="Email" type="email">
					</div>
					<div class="12u$">
						<textarea name="message" id="message" placeholder="Message" rows="6"></textarea>
					</div>
					<div class="12u$">
						<ul class="actions">
							<li><input value="Send Message" class="special big" type="submit"></li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</section>

	<footer>
		<p>Group project for CS410, Professor Iyengar</p>
	</footer>
</body>
</html>