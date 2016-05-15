package com.cir.services.rest.v1.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.List;

import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.cir.services.rest.v1.dao.api.UserDao;
import com.cir.services.rest.v1.db.AbstractBaseDAO;
import com.cir.services.rest.v1.model.User;

@Repository
@Component
public class UserDaoImpl extends AbstractBaseDAO implements UserDao {

	@Override
	public List<User> getUsers() {
		return jdbcTemplate.query(getQuery("USERS_SELECT_QUERY"), new Object[] {}, new UserMapper());
	}

	@Override
	public User getUser(String id) {
		User user = jdbcTemplate.queryForObject(getQuery("USER_SELECT_QUERY"), new Object[] { id }, new UserMapper());
		return user;
	}

	@Override
	public int createUser(final User user) {
		return jdbcTemplate.update(getQuery("PERSIST_User_DETAILS"),new Object[]{user.getUsername(),user.getPassword(),user.getRoleId()});
	}

	@Override
	public int updateUser(User user) {     
		return jdbcTemplate.update(getQuery("UPDATE_USER_DETAILS"),user.getUsername(),user.getPassword(),user.getUserId());	
	}

	@Override
	public int deleteUser(String id) {
		int[] types = {Types.BIGINT};
		return jdbcTemplate.update(getQuery("DELETE_USER_BYID"), new Object[]{id}, types);
	}
	
}
