package com.cir.services.rest.v1.dao.api;

import java.util.List;

import com.cir.services.rest.v1.model.User;

public interface UserDao {
	
	public List<User> getUsers();
	
	public User getUser(String id);

	public int createUser(User user);

	public int updateUser(User user);

	public int deleteUser(String id);
	

}
