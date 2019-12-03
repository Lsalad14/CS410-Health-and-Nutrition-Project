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
				<li><a href="calcapp.jsp">Calculator</a></li>
			</ul>
		</nav>
	</header>
	
	<div class="search-container">
		<form action="sample.jsp" method="get">
			<select name="prebuiltid">
				<option value="sample1" selected>Spaghetti with Meatballs & Garlic Bread (protein)</option>
				<option value="sample2">Grilled Tuna Teriyaki (low fat)</option>
				<option value="sample3">Szechwan Shrimp (low fat)</option>
				<option value="sample4">Bacon Egg cups (low carb)</option>
				<option value="sample5">Scrambled Eggs (low carb)</option>
				<option value="sample6">Red Lentil Curry (vegetarian)</option>
				<option value="sample7">Chickpea Curry (vegetarian)</option>
				<option value="sample8">Spaghetti Squash w/ Focaccia (vegetarian)</option>
			</select>
			<button type="submit" class="button" name="view" value="view">View plan</button>
			<button type="submit" class="button" name="add" value="add">Add to my plan</button>
		</form>
	</div>
	
<%
int foodid;
String username = (String) session.getAttribute("username");
String prebuiltid = request.getParameter("prebuiltid");

String planTableRows = "";
String totalTableRow = "";

PlanManager planManager = new PlanManager();
planManager.setup();

String planTokens = planManager.read(prebuiltid);
StringTokenizer stk = new StringTokenizer(planTokens);

planManager.exit();

FoodManager foodManager = new FoodManager();
foodManager.setup();

while (stk.hasMoreTokens()) {
	foodid = Integer.parseInt(stk.nextToken());
	int count = Integer.parseInt(stk.nextToken());
	
	planTableRows += foodManager.readPlan(foodid, count, prebuiltid);
}

while (foodManager.hasNext()) {
	int nextfoodid = foodManager.getNextFoodid();
	int size = 4;
	if (request.getParameter(nextfoodid+"")!=null) {
		size = Integer.parseInt(request.getParameter(nextfoodid+""));
		
	}
	foodManager.calculateTotalWithServing(size);
	foodManager.incrementsFoodid();
}

totalTableRow = foodManager.getTotal();

foodManager.exit();

if (request.getParameter("add") != null) {
	if (request.getParameter("add").equals("add")) {
		planManager = new PlanManager();
		planManager.setup();
	
		planTokens = planManager.read(prebuiltid);
		stk = new StringTokenizer(planTokens);
		
		while (stk.hasMoreTokens()) {
			foodid = Integer.parseInt(stk.nextToken());
			int count = Integer.parseInt(stk.nextToken());
			planManager.create(username, foodid);
		}
	
		planManager.exit();
	}
}
%>

	<section>
		<div class="table-wrapper">
			<form action="calcapp.jsp" method="get">
				<table class="alt">
					<tr>
					<th>ID</th>
					<th>Group</th>
					<th>Name</th>
					<th>Protein</th>
					<th>Fat</th>
					<th>Carbohydrates</th>
					<th>Calories</th>
					<th>Serving Size</th>
					<th></th>
					</tr>
					<%= planTableRows %>
					<%= totalTableRow %>
				</table>
				<input type="submit" value="Calculate">
			</form>
		</div>
	</section>

</body>
</html>