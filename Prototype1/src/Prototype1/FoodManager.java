package Prototype1;

import java.util.Iterator;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class FoodManager {
	
	protected SessionFactory sessionFactory;
	
	protected void setup() {
		sessionFactory = new Configuration().configure().buildSessionFactory();
	}
	
	protected void exit() {
		sessionFactory.close();
	}
	
	protected void create() {
		
	}
	
	// Return the first 'count' elements of food items in table format
	protected String read(String keyword, String username) {
		Session session = sessionFactory.openSession();
		String result = "";
		
		Query query = session.createQuery("from Food where name like '%"+keyword+"%'");
		//query.setParameter(0, "%"+keyword+"%");
		
		Iterator foodList = query.iterate();
		
//		for (int i=1001; i<=(count+1000); i++) {
//			food = (Food) session.get(Food.class, i);
//			
//			result += "<tr>";
//			result += 
//				"<td>" + food.getID() + "</td>" + 
//				"<td>" + food.getGroup() + "</td>" +
//				"<td>" + food.getName() + "</td>" +
//				"<td>" + food.getProtein() + "</td>" +
//				"<td>" + food.getFat() + "</td>" +
//				"<td>" + food.getCarb() + "</td>" +
//				"<td>" + food.getCalories() + "</td>" +
//				"<td><a href=\"localhost:8080/Prototype1/calcApp?paramFood=" + food.getID() + "&paramUser=" + username + "\" target=\"_BLANK\">add</a></td>";
//			result += "</tr>";
//		}
		
		while (foodList.hasNext()) {
			Food food = (Food) foodList.next();
			result += "<tr>";
			result += 
					"<td>" + food.getID() + "</td>" + 
					"<td>" + food.getGroup() + "</td>" +
					"<td>" + food.getName() + "</td>" +
					"<td>" + food.getProtein() + "</td>" +
					"<td>" + food.getFat() + "</td>" +
					"<td>" + food.getCarb() + "</td>" +
					"<td>" + food.getCalories() + "</td>" +
					"<td><a href=\"localhost:8080/Prototype1/calcApp?paramFood=" + food.getID() + "&paramUser=" + username + "\" target=\"_BLANK\">add</a></td>";
			result += "</tr>";
		}
		
		session.close();
		return result;
	}
	
	protected String readPlan(int foodid, int count) {
		Session session = sessionFactory.openSession();
		String result = "";
		
		Food food = (Food) session.get(Food.class, foodid);
		result += "<tr>";
		result += 
			"<td>" + food.getID() + "</td>" + 
			"<td>" + food.getGroup() + "</td>" +
			"<td>" + food.getName() + "</td>" +
			"<td>" + food.getCalories() + "</td>" +
			"<td>" + count + "</td>";
		result += "</tr>";
		
		session.close();
		return result;
	}
	
	protected void update() {
		
	}
	
	protected void delete() {
		
	}
}
