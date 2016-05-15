package com.cir.services.rest.v1.service.api;

import java.util.List;

import com.cir.services.rest.v1.model.User;

public interface UserService {
	
	public List<User> getUsers();
	
	public User getUser(String id);

	public int createUser(User user);

	public int updateUser(User user);

	public int deleteUser(String id);

}
