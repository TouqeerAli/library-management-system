package dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
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

	@Override
	public User getUserWithBooks(Integer userId) {
	
		String hql = "FROM User u LEFT JOIN FETCH u.books WHERE u.id = :userId";
	    
	    return session.createQuery(hql, User.class)
	            .setParameter("userId", userId)
	            .uniqueResult();
	}

	@Override
	public Integer getIdeByUserName(String userName) {
		 try (Session session = sessionFactory.openSession()) {
	            String hql = "SELECT u.id FROM User u WHERE u.email = :userName";
	            Integer userId = session.createQuery(hql, Integer.class)
	                                .setParameter("userName", userName)
	                                .uniqueResult();
	            return userId;
	        } catch (HibernateException e) {
	            // Handle exception
	            e.printStackTrace();
	            return null;
	        }
	    }

	@Override
	public int getTotalUsers() {
		return session.createQuery("SELECT COUNT(u) FROM User u", Long.class).getSingleResult().intValue();
	}
	}
	
	
	
	

	
	

