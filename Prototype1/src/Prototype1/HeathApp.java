package Prototype1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

@WebServlet("/healthApp")
public class HeathApp extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		// Check for valid user name and password
		String username = request.getParameter("userName");;
		String userpass = request.getParameter("userPassword");
		
		UserManager userManager = new UserManager();
		userManager.setup();
		boolean isVerified = userManager.read(username, userpass);
		userManager.exit();
		
		if (isVerified)
			System.out.println("User authentication passed.");
		else System.out.println("User authentication failed.");
		
		// Search for a food item
		boolean searchQueried = (request.getParameter("query")!=null);
		System.out.println("Query checked");
		
		FoodManager foodManager = new FoodManager();
		foodManager.setup();
		
		//String foodTableRows = foodManager.read(11, username);
		String foodTableRows = "";
		
		if (searchQueried) {
			foodTableRows = foodManager.read(request.getParameter("query"), username);
		}
		foodManager.exit();
		
		// Send back HTML
		String docType =
				"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
				"Transitional//EN\">\n";
		
				out.println(docType +		
				"<HTML>" +
				"<HEAD><TITLE>Search Page</TITLE>" +
				"<script src=\"js/jquery.min.js\"></script>\n" + 
				"<script src=\"js/skel.min.js\"></script>\n" + 
				"<script src=\"js/skel-layers.min.js\"></script>\n" + 
				"<script src=\"js/init.js\"></script>\n" + 
				"<noscript>\n" + 
				"	<link rel=\"stylesheet\" href=\"css/skel.css\" />\n" + 
				"	<link rel=\"stylesheet\" href=\"css/style.css\" />\n" + 
				"	<link rel=\"stylesheet\" href=\"css/style-xlarge.css\" />\n" + 
				"</noscript>" +
				"</HEAD><BODY>");
				
				// Nav bar
				out.println(
				"			<header id=\"header\">\n" + 
				"				<h1><a href=\"index.html\">Health and Nutrition</a></h1>\n" + 
				"				<nav id=\"nav\">\n" + 
				"					<ul>\n" + 
				"						<li><a href='index.jsp'>Home</a></li>\n" + 
				"						<li><a href='localhost:8080/Prototype1/calcApp?paramUser=" + username + "' target='_SELF' class='button'>Calculator</a>\"</li>\n" + 
				"					</ul>\n" + 
				"				</nav>\n" + 
				"			</header>");
				
				out.println(
				"			<section id=\"main\" class=\"wrapper\">\n" + 
				"				<div class=\"container\">\n" +
				"					<header class=\"major\">\n" + 
				"						<h2>Create Your Meals</h2>\n" + 
				"						<p>organzie it to your style</p>\n" + 
				"					</header>\n" + 
				"					<a href=\"#\" class=\"image fit\"><img src=\"images/pic09.jpg\" alt=\"\" /></a>\n" + 
				"				</div>\n" + 
				"			</section>");
				
				// Search bar
				out.println(
				"<div class=\"search-container\">" +
			    "<form action=\"healthApp\" target=\"_self\" method=\"POST\">" +
			    	"<input type=\"text\" placeholder=\"Search..\" name=\"query\"><br>" +
			    	"<button type=\"submit\" class='button'>Submit</button>" +
			    	"<input hidden type=\"text\" name=\"userName\" value=\"" + username + "\" class='hide'>" +
			    	"<input hidden type=\"text\" name=\"userPass\" value=\"" + userpass + "\" class='hide'>" + // Clean this up once done
			    "</form>" +
			    "</div>");
				
			if (searchQueried) {
				out.println(
				"<section>\n" + 
				"<div class='table-wrapper'>\n" + 
				"<table class='alt'>"+
				"<th>ID</th>" +
				"<th>Group</th>" +
				"<th>Name</th>" +
				"<th>Protein</th>" +
				"<th>Fat</th>" +
				"<th>Carbohydrates</th>" +
				"<th>Calories</th>" +
				"<th></th>" +
				"</tr>");
				
				out.println(foodTableRows);
				out.println("</table></div></section>");
			}
				out.println(
				"</BODY></HTML>");
	}

	
	public void doPost (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doGet(request, response);
	}
}
