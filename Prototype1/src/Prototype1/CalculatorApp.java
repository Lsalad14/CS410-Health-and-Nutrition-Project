package Prototype1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

@WebServlet("/calcApp")
public class CalculatorApp extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		int foodid;
		String username="";
		
		PlanManager planManager = new PlanManager();
		planManager.setup();
		
		// Check for user input and update the user_plan table
		if (request.getParameter("paramFood")!=null && request.getParameter("paramUser")!=null) {
			foodid = Integer.parseInt(request.getParameter("paramFood"));
			username = request.getParameter("paramUser");
			planManager.create(username, foodid);
		} else if (request.getParameter("paramUser")!=null) {
			username = request.getParameter("paramUser");
		}
		
		// Read the details of the food in the plan
		String planTableRows = "";
		String planTokens = planManager.read(username);
		String totalTableRow = "";
		StringTokenizer stk = new StringTokenizer(planTokens);
		
		planManager.exit();
		FoodManager foodManager = new FoodManager();
		foodManager.setup();
		
		while (stk.hasMoreTokens()) {
			foodid = Integer.parseInt(stk.nextToken());
			int count = Integer.parseInt(stk.nextToken());
			planTableRows += foodManager.readPlan(foodid, count);
		}
		
		totalTableRow = foodManager.getTotal();
		foodManager.exit();
		
		//Send back HTML
		String docType =
				"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
				"Transitional//EN\">\n";
				out.println(docType +		
				"<HTML>\n" +
				"<HEAD><TITLE>Calculator</TITLE></HEAD>\n" +
				"<BODY>\n");
				
				out.println(
				"<form action=\"healthApp\" target=\"_SELF\" method=\"POST\">" +
						"<button type=\"submit\">Search Page</button>" +
						"<input hidden type=\"text\" name=\"userName\" value=\"" + username + "\">" +
		    	"</form>");
				
				out.println(
				"<table>" +
				"<tr>" +
				"<th>ID</th>" +
				"<th>Group</th>" +
				"<th>Name</th>" +
				"<th>Protein</th>" +
				"<th>Fat</th>" +
				"<th>Carbohydrates</th>" +
				"<th>Calories</th>" +
				"<th>Count</th>" +
				"</tr>");
				
				out.println(planTableRows);
				out.println(totalTableRow);
				
				out.println("</table>");
				
				out.println(
				"</BODY></HTML>");
	}
}
