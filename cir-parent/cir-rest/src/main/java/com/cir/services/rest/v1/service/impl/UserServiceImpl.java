package com.cir.services.rest.v1.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cir.services.rest.v1.dao.api.UserDao;
import com.cir.services.rest.v1.model.User;
import com.cir.services.rest.v1.service.api.UserService;
@Component
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;

	@Override
	public List<User> getUsers() {

		return userDao.getUsers();
	}

	@Override
	public User getUser(String id) {
		return userDao.getUser(id);
	}

	@Override
	public int createUser(User user) {
		 return userDao.createUser(user);	
	}

	@Override
	public int updateUser(User user) {
		return userDao.updateUser(user);
	}

	@Override
	public int deleteUser(String id) {
		return userDao.deleteUser(id);
	}

}
