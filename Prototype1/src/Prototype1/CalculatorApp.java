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
		if (request.getParameter("param1")!=null && request.getParameter("param2")!=null) {
			foodid = Integer.parseInt(request.getParameter("param1"));
			username = request.getParameter("param2");
			planManager.create(username, foodid);
		}
		
		// Read the details of the food in the plan
		String planTableRows = "";
		String planTokens = planManager.read(username);
		StringTokenizer stk = new StringTokenizer(planTokens);
		
		planManager.exit();
		FoodManager foodManager = new FoodManager();
		foodManager.setup();
		
		while (stk.hasMoreTokens()) {
			foodid = Integer.parseInt(stk.nextToken());
			int count = Integer.parseInt(stk.nextToken());
			planTableRows += foodManager.readPlan(foodid, count);
		}
		foodManager.exit();
		
		//Send back HTML
		String docType =
				"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
				"Transitional//EN\">\n";
				out.println(docType +		
				"<HTML>\n" +
				"<HEAD><TITLE>Calculator</TITLE></HEAD>\n" +
				"<BODY BGCOLOR=\"#FDF5E6\">\n");
				
				out.println(
				"<table>" +
				"<tr>" +
				"<th>ID</th>" +
				"<th>Group</th>" +
				"<th>Name</th>" +
				"<th>Calories</th>" +
				"<th>Count</th>" +
				"</tr>");
				
				out.println(planTableRows);
				
				out.println("</table>");
				
				out.println(
				"</BODY></HTML>");
	}
}
