package Prototype1;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class PlanManager {
	
	protected SessionFactory sessionFactory;
	
	public void setup() {
		sessionFactory = new Configuration().configure().buildSessionFactory();
	}
	
	public void exit() {
		sessionFactory.close();
	}
	
	public void create(String username, int foodid) {
		Session session = sessionFactory.openSession();
		
		Plan plan = new Plan();
		plan.setUsername(username);
		plan.setFoodid(foodid);
		plan.setCount(1);
	    
	    Transaction tx=null;
		try {
			tx = session.beginTransaction();
			//Update Plan java object
			plan.setUsername(username);
			plan.setFoodid(foodid);
			plan.setCount(1);
			
			//Save java object Plan to database
			session.save(plan);
			session.flush();
			tx.commit();
		}catch(Exception se) {
			tx.rollback();
		}finally {
			if(session.isOpen()) session.close();
		}
	}
	
	public String read(String username) {
		Session session = sessionFactory.openSession();
		String result = "";
		
		Iterator planList = session.createQuery("from Plan where username='" + username + "'").iterate();
		
		//Plan[] planArray = (Plan[]) planList.toArray();
		
		while (planList.hasNext()) {
			Plan plan = (Plan) planList.next();
			result += plan.getFoodid() + " " + plan.getCount() + " ";
		}
		System.out.println(result);
		
		//for (int i=0; i<planList.size(); i++) {
		//	result += planArray[i].getFoodid() + " " + planArray[i].getCount() + " ";
		//}
		
		return result;
	}
	
	public void update() {
		
	}
	
	public void delete(String username, int foodid) {
		Session session = sessionFactory.openSession();
		
		Transaction transaction = session.beginTransaction();
		try {
		  String hql = "delete from Plan where username='" + username + "' AND foodid=" + foodid;
		  Query query = session.createQuery(hql);
		  
		  System.out.println(query.executeUpdate());
		  

		  transaction.commit();
		} catch (Throwable t) {
		  transaction.rollback();
		  throw t;
		}
	}

}
