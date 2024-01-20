package dao;

import java.util.List;

import model.User;

public interface UserDAO {
	List<User> getUsers();
	void addUser(User user);
}
