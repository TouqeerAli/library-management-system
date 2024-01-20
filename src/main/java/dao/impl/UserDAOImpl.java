package dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import dao.UserDAO;
import model.User;

public class UserDAOImpl implements UserDAO{
	Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
	SessionFactory sessionFactory = configuration.buildSessionFactory(); 
    
    Session session = sessionFactory.openSession();
    
	@Override
	public List<User> getUsers() {
		Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
		SessionFactory sessionFactory	= configuration.buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction	= session.beginTransaction();
		List<User> users = session.createQuery("FROM User",User.class).getResultList();
		
		return users;
	}

	@Override
	public void addUser(User user) {
		Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
		SessionFactory sessionFactory = configuration.buildSessionFactory(); 
	    
	    Session session = sessionFactory.openSession();
	    Transaction transaction = session.beginTransaction();
		session.save(user);
		transaction.commit();
        session.close();
        System.out.println(sessionFactory);
		
		
		
	}
	
	

	
	
}
