package dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import model.Book;
import model.User;

public class UserBookRelationDAOImpl {
		
	public void assign(Integer user_id, Integer book_id) {
		Configuration cofiguration = new Configuration().configure("hibernate.cfg.xml");
		SessionFactory sessionFactory = cofiguration.buildSessionFactory();
		
		Session session = sessionFactory.openSession();
		User user = session.get(User.class, user_id);
		Book book = session.get(Book.class, book_id);
	 	Transaction transaction = session.beginTransaction();
	 	user.getBooks().add(book);
		session.save(user);
		
		transaction.commit();
		session.close();
		
	}
	
	public void returnBook(Integer user_id, Integer book_id) {
		Configuration cofiguration = new Configuration().configure("hibernate.cfg.xml");
		SessionFactory sessionFactory = cofiguration.buildSessionFactory();
		
		Session session = sessionFactory.openSession();
		User user = session.get(User.class, user_id);
		Book book = session.get(Book.class, book_id);
	 	Transaction transaction = session.beginTransaction();
	 	user.getBooks().remove(book);
		session.save(user);
		
		transaction.commit();
		session.close();
		
	}
	
	
	
}
