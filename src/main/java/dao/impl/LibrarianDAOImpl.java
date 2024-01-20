package dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import dao.LibrarianDAO;
import model.Librarian;
import model.User;

public class LibrarianDAOImpl implements LibrarianDAO{
	Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
	SessionFactory sessionFactory = configuration.buildSessionFactory(); 
    
    Session session = sessionFactory.openSession();

	@Override
	public List<Librarian> getUsers() {
		Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
		SessionFactory sessionFactory	= configuration.buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction	= session.beginTransaction();
		List<Librarian> librarian = session.createQuery("FROM Librarian",Librarian.class).getResultList();
		
		return librarian;
	}

	@Override
	public void addUser(Librarian librarian) {
		Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
		SessionFactory sessionFactory = configuration.buildSessionFactory(); 
	    
	    Session session = sessionFactory.openSession();
	    Transaction transaction = session.beginTransaction();
		session.save(librarian);
		transaction.commit();
        session.close();
        
		
	}
    
}
