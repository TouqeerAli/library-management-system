package dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import dao.BookDAO;
import model.Book;
import model.User;

public class BookDAOImpl implements BookDAO{
	Configuration cofiguration = new Configuration().configure("hibernate.cfg.xml");
	SessionFactory sessionFactory = cofiguration.buildSessionFactory();
	
	
	@Override
	public List<Book> getAllBooks() {
		Session session = sessionFactory.openSession();
		Transaction transaction	= session.beginTransaction();
		List<Book> books = session.createQuery("FROM Book",Book.class).getResultList();
		System.out.println("getAllBooks method called");
		return books;
	}

	@Override
	public void addBook(Book book) {
		Session session = sessionFactory.openSession();
		 	Transaction transaction = session.beginTransaction();
			session.save(book);
			transaction.commit();
			session.close();		
	}

	@Override
	public void deleteBook(int id) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Object persistentInstance = session.load(Book.class, id);
		if (persistentInstance != null) {
		    session.delete(persistentInstance);
		}
		
		transaction.commit();
		session.close();
	}

	@Override
	public void updateBook(Book book) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(book);
		transaction.commit();
		session.close();
		
	}

}
