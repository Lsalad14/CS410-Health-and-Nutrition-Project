<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Register</title>
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
<%@ page import="java.io.*" %> 
<%@ page import="Prototype1.*" %>
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
	
	<section id="two" class="wrapper style2 special">
		<div class="container">
			<form action="registration.jsp" method="get">
				<fieldset>
					<h1>Register</h1>
					<p>Username: </p>
					<input type="text" name="userName">
	
					<p>Password: </p>
					<input type="text" name="userPassword">
				</fieldset>
	
				<input type="submit" value="Submit">
			</form>
		</div>
	</section>
<%
String username=request.getParameter("userName");
String password=request.getParameter("userPassword");

if (username!=null&&!username.trim().equals("")&&password!=null&&!password.trim().equals("")){
	UserManager userManager = new UserManager();
	userManager.setup();
	boolean flag = userManager.userRegister(username, password);
	userManager.exit();
	
	if(flag) {
		%><script type="text/javascript">window.location.replace("login.jsp");</script><%
	}
	else { 
		%><script type="text/javascript">window.location.replace("registration.jsp");</script><%
	}
}

%>

</body>
</html>