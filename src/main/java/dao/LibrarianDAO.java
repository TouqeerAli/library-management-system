package dao;

import java.util.List;

import model.Librarian;


public interface LibrarianDAO {
	List<Librarian> getUsers();
	void addUser(Librarian librarian);
}
