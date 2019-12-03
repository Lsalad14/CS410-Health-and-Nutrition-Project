<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
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
<%@ page import="java.io.*" %> 
<%@ page import="Prototype1.*" %>

	<!-- Header -->
	<header id="header">
		<h1><a href="index.jsp">Health And Nutrition App</a></h1>
		<nav id="nav">
			<ul>
				<li><a href="#" class="button special">Sign In</a></li>
			</ul>
		</nav>
	</header>
	
	<section id="two" class="wrapper style2 special">
		<div class="container">
			<form action="login.jsp" method="get">
				<fieldset>
					<h1>Log-in</h1>
					<p>Username: </p>
					<input type="text" name="username">
	
					<p>Password: </p>
					<input type="password" name="userpassword">
				</fieldset>
	
				<input type="submit" value="Submit">
			</form>
		</div>
	</section>
	
<%
String username = request.getParameter("username");
String userpassword = request.getParameter("userpassword");

UserManager userManager = new UserManager();
userManager.setup();
boolean isVerified = false;

if (request.getParameter("username")!=null && request.getParameter("userpassword")!=null) {
	isVerified = userManager.read(username, userpassword);

	if (isVerified) {
		session.setAttribute("username", username);
		%> <script type="text/javascript">window.location.replace("healthapp.jsp");</script> <%
	}
	else {
		%> <script type="text/javascript">window.location.replace("registration.jsp");</script> <%
	}
}
userManager.exit();
%>
</body>
</html>