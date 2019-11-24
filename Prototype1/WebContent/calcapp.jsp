<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Calculator Page</title>
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
<%@ page import="java.util.*" %> 
<%@ page import="Prototype1.*" %>

	<header id="header">
		<h1><a href="index.jsp">Health and Nutrition</a></h1>
		<nav id="nav">
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="healthapp.jsp">Search Page</a></li>
			</ul>
		</nav>
	</header>
	
<%
int foodid;
String username = (String) session.getAttribute("username");

String planTableRows = "";
String totalTableRow = "";

PlanManager planManager = new PlanManager();
planManager.setup();
if (request.getParameter("paramFood")!=null) {
	foodid = Integer.parseInt(request.getParameter("paramFood"));
	planManager.create(username, foodid);
}
else if (request.getParameter("deleteID")!=null) {
	foodid = Integer.parseInt(request.getParameter("deleteID"));
	planManager.delete(username, foodid);
}

String planTokens = planManager.read(username);
StringTokenizer stk = new StringTokenizer(planTokens);

planManager.exit();

FoodManager foodManager = new FoodManager();
foodManager.setup();

while (stk.hasMoreTokens()) {
	foodid = Integer.parseInt(stk.nextToken());
	int count = Integer.parseInt(stk.nextToken());
	
	planTableRows += foodManager.readPlan(foodid, count, username);
}
totalTableRow = foodManager.getTotal();

foodManager.exit();
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
				<th>Count</th>
				<th></th>
				</tr>
				<%= planTableRows %>
				<%= totalTableRow %>
			</table>
		</div>
	</section>

</body>
</html>