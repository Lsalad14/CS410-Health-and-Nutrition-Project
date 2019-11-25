package Prototype1;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class FoodManager {
	
	protected SessionFactory sessionFactory;
	
	private List<Food> planItems = new ArrayList<Food> ();
	
	private int index = 0;
	
	private float protein=0, fat=0, carb=0, calories=0;
	
	public void setup() {
		sessionFactory = new Configuration().configure().buildSessionFactory();
	}
	
	public void exit() {
		sessionFactory.close();
	}
	
	public void create() {
		
	}
	
	// Return search query in table format
	public String read(String keyword, String username) {
		Session session = sessionFactory.openSession();
		String result = "";
		
		Query query = session.createQuery("from Food where name like '% "+keyword+" %'");
		
		Iterator foodList = query.iterate();
		
		while (foodList.hasNext()) {
			Food food = (Food) foodList.next();
			result += "<tr>";
			result += 
				"<td class='tooltip'>" + food.getID() + 
					"<span class='tooltiptext'>" +
					"Protein: " + food.getProtein() + " g<br>" +
					"Fat: " + food.getFat() + " g<br>" +
					"Carbohydrates: " + food.getCarb() + " g<br>" +
					"Calories: " + food.getCalories() + " kCal<br>" +
					"Caffeine: " + food.getCaffeine() + " mg<br>" +
					"Sugar: " + food.getSugar() + " g<br>" +
					"Fiber: " + food.getFiber() + " g<br>" +
					"Calcium: " + food.getCalcium() + " mg<br>" +
					"Iron: " + food.getIron() + " mg<br>" +
					"Magnesium: " + food.getMagnesium() + " mg<br>" +
					"Potassium: " + food.getPotassium() + " mg<br>" +
					"Sodium: " + food.getSodium() + " mg<br>" +
					"Zinc: " + food.getZinc() + " mg<br>" +
					"Copper: " + food.getCopper() + " mg<br>" +
					"Manganese: " + food.getManganese() + " mg<br>" +
					"Selenium: " + food.getSelenium() + " mcg<br>" +
					"Vitamin A: " + food.getVita() + " IU<br>" +
					"Vitamin E: " + food.getVite() + " mg<br>" +
					"Vitamin D: " + food.getVitd() + " mcg<br>" +
					"Vitamin C: " + food.getVitc() + " mg<br>" +
					"Vitamin B12: " + food.getVitb12() + " mg<br>" +
					"Cholesterol: " + food.getCholesterol() + " mg<br>" +
					"Saturated fat: " + food.getSatfat() + " g<br>" +
				"</span></td>" +
					"<td>" + food.getGroup() + "</td>" +
					"<td>" + food.getName() + "</td>" +
					"<td>" + food.getProtein() + "</td>" +
					"<td>" + food.getFat() + "</td>" +
					"<td>" + food.getCarb() + "</td>" +
					"<td>" + food.getCalories() + "</td>" +
					"<td><a href=\"localhost:8080/Prototype1/calcapp.jsp?paramFood=" + food.getID() + "\" target='_blank'>add</a></td>";
					
			result += "</tr>";
		}
		
		session.close();
		return result;
	}
	
	// Return food items in a user's plan in table format
	public String readPlan(int foodid, int count, String username) {
		Session session = sessionFactory.openSession();
		String result = "";
		
		Food food = (Food) session.get(Food.class, foodid);
		result += "<tr>";
		result += 
			"<td class='tooltip'>" + food.getID() + 
					"<span class='tooltiptext'>" +
					"Protein: " + food.getProtein() + " g<br>" +
					"Fat: " + food.getFat() + " g<br>" +
					"Carbohydrates: " + food.getCarb() + " g<br>" +
					"Calories: " + food.getCalories() + " kCal<br>" +
					"Caffeine: " + food.getCaffeine() + " mg<br>" +
					"Sugar: " + food.getSugar() + " g<br>" +
					"Fiber: " + food.getFiber() + " g<br>" +
					"Calcium: " + food.getCalcium() + " mg<br>" +
					"Iron: " + food.getIron() + " mg<br>" +
					"Magnesium: " + food.getMagnesium() + " mg<br>" +
					"Potassium: " + food.getPotassium() + " mg<br>" +
					"Sodium: " + food.getSodium() + " mg<br>" +
					"Zinc: " + food.getZinc() + " mg<br>" +
					"Copper: " + food.getCopper() + " mg<br>" +
					"Manganese: " + food.getManganese() + " mg<br>" +
					"Selenium: " + food.getSelenium() + " mcg<br>" +
					"Vitamin A: " + food.getVita() + " IU<br>" +
					"Vitamin E: " + food.getVite() + " mg<br>" +
					"Vitamin D: " + food.getVitd() + " mcg<br>" +
					"Vitamin C: " + food.getVitc() + " mg<br>" +
					"Vitamin B12: " + food.getVitb12() + " mg<br>" +
					"Cholesterol: " + food.getCholesterol() + " mg<br>" +
					"Saturated fat: " + food.getSatfat() + " g<br>" +
					"</span></td>" +
			"<td>" + food.getGroup() + "</td>" +
			"<td>" + food.getName() + "</td>" +
			"<td>" + food.getProtein() + "</td>" +
			"<td>" + food.getFat() + "</td>" +
			"<td>" + food.getCarb() + "</td>" +
			"<td>" + food.getCalories() + "</td>" +
			"<td><select name='"+food.getID()+"'>\n" + 
			"    <option value='1'>1 ounce</option>\n" + 
			"    <option value='4'>4 ounce</option>\n" + 
			"    <option value='8'>8 ounce</option>\n" + 
			"    <option value='12'>12 ounce</option>\n" + 
			"	 <option value='16'>16 ounce</option>\n" +
			"</select></td>" +
			"<td><a href=\"localhost:8080/Prototype1/calcapp.jsp?deleteID=" + food.getID() + "\" target='_blank'>delete</a></td>";
		result += "</tr>";
		
		planItems.add(food);
		
		session.close();
		return result;
	}
	
	public boolean hasNext() {
		if (index<planItems.size())
			return true;
		else return false;
	}
	
	public int getNextFoodid() {
		Food food = planItems.get(index);
		return food.getID();
	}
	
	public void incrementsFoodid() {
		index++;
	}
	
	public void calculateTotalWithServing(int size) {
		// Default db size is 4 ounce; serving size comes in 1, 4, 8, 12, or 16 ounce
		Food food = planItems.get(index);
		
		protein += (food.getProtein()/4) * size;
		fat += (food.getFat()/4) * size;
		carb += (food.getCarb()/4) * size;
		calories += (food.getCalories()/4) * size;
	}
	
	public String getTotal() {
		String result = "";
		
		result += "<tr>";
		result += 
			"<td></td>" + 
			"<td></td>" +
			"<td>Total</td>" +
			"<td>" + String.format("%.2f", protein) + "</td>" +
			"<td>" + String.format("%.2f", fat) + "</td>" +
			"<td>" + String.format("%.2f", carb) + "</td>" +
			"<td>" + String.format("%.2f", calories) + "</td>" +
			"<td></td>";
		result += "</tr>";
		
		return result;
	}
/*
	public String getTotal() {
		String result = "";
		
		Food food;
		
		for (int i=0; i<planItems.size(); i++) {
			food = planItems.get(i);
			protein += food.getProtein();
			fat += food.getFat();
			carb += food.getCarb();
			calories += food.getCalories();
		}
		
		result += "<tr>";
		result += 
			"<td></td>" + 
			"<td></td>" +
			"<td>Total</td>" +
			"<td>" + String.format("%.2f", protein) + "</td>" +
			"<td>" + String.format("%.2f", fat) + "</td>" +
			"<td>" + String.format("%.2f", carb) + "</td>" +
			"<td>" + String.format("%.2f", calories) + "</td>" +
			"<td></td>";
		result += "</tr>";
		
		return result;
	}
*/
	public void update() {
		
	}
	
	public  void delete() {
		
	}
}
