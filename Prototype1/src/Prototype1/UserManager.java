package Prototype1;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class UserManager {
	
	protected SessionFactory sessionFactory;
	
	public void setup() {
		sessionFactory = new Configuration().configure().buildSessionFactory();
	}
	
	public void exit() {
		sessionFactory.close();
	}
	
	public void create() {
		
	}
	
	// Verifying user
	public boolean read(String username, String password) {
		Session session = sessionFactory.openSession();

	    User user = (User) session.get(User.class, username);

	    session.close();
	    
	    if (user==null)
	    	return false;
	    
	    if (user.getName().equals(username) && user.getPassword().equals(password))
	    	return true;
	    else return false;
	}
	
	public boolean userRegister(String username, String password) {
		Session session = sessionFactory.openSession();

	    User user = new User();
	    user.setName(username);
	    user.setPassword(password);
	    
	    session.beginTransaction();
	    session.save(user);
	    session.getTransaction().commit();
	    
	    return true;
	}
	
	public void update() {
		
	}
	
	public void delete() {
		
	}
	
}
