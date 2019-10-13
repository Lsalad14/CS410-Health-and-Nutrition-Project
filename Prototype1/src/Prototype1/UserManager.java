package Prototype1;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class UserManager {
	
	protected SessionFactory sessionFactory;
	
	protected void setup() {
		sessionFactory = new Configuration().configure().buildSessionFactory();
	}
	
	protected void exit() {
		sessionFactory.close();
	}
	
	protected void create() {
		
	}
	
	// Verifying user
	protected boolean read(String username, String password) {
		Session session = sessionFactory.openSession();

	    User user = (User) session.get(User.class, username);

	    session.close();
	    
	    if (user.getName().equals(username) && user.getPassword().equals(password))
	    	return true;
	    else return false;
	}
	
	protected void update() {
		
	}
	
	protected void delete() {
		
	}
	
}
