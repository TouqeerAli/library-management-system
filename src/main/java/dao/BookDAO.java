package dao;

import java.util.List;

import model.Book;

public interface BookDAO {
	List<Book> getAllBooks();
	void addBook(Book book);
	void deleteBook(int id);
	void updateBook(Book book);
}
