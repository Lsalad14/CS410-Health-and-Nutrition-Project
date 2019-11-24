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

<body>
<%@ page import="java.io.*" %> 
<%@ page import="Prototype1.*" %>

	<header id="header">
		<h1><a href="index.jsp">Health and Nutrition</a></h1>
		<nav id="nav">
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="calcapp.jsp">Calculator</a></li>
			</ul>
		</nav>
	</header>

	<section id="main" class="wrapper">
		<div class="container">
			<header class="major">
				<h2>Create Your Meals</h2>
				<p>organize it to your style</p>
			</header>
			<a href="#" class="image fit"><img src="images/pic09.jpg" alt=""></a>
		</div>
	</section>
	
	<div class="search-container">
		<form action="healthapp.jsp" method="get">
			<input type="text" placeholder="Search.." name="query"><br>
			<button type="submit" class="button">Submit</button>
		</form>
	</div>

<%
if (request.getParameter("query")!=null) {
	FoodManager foodManager = new FoodManager();
	foodManager.setup();
	
	String foodTableRows = "";
	foodTableRows = foodManager.read(request.getParameter("query"),(String)session.getAttribute("username"));
%>
	<section>
		<div class="table-wrapper">
			<table class="alt">
				<tr>
				<th>ID</th>
				<th>Group</th>
				<th>Name</th>
				<th>Protein</th>
				<th>Fat</th>
				<th>Carbohydrates</th>
				<th>Calories</th>
				<th></th>
				</tr>
				<%= foodTableRows %>
			</table>
		</div>
	</section>
<%
}
%>





















</body>
</html>