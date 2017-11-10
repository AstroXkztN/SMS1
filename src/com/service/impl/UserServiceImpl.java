package com.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.dao.UserDao;
import com.entity.User;
import com.service.UserService;

public class UserServiceImpl implements UserService{

	/* SAMPLE SERVICEIMPL CONTENT
	 * 
	 * private UserDao userDao;
	
	@Override
	public String validateLogin(HttpServletRequest req) throws SQLException {
		Map<String,Object> params = new HashMap<>();
		params.put("userName", req.getParameter("userName"));
		params.put("password", req.getParameter("password"));
		return this.getUserDao().validateLogin(params);
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public void addUser(HttpServletRequest req) throws SQLException {
		Map<String,Object> params = new HashMap<>();
		params.put("userName", req.getParameter("userName"));
		params.put("password", req.getParameter("password"));
		
		this.getUserDao().addUser(params);
	}

	@Override
	public void updateUser(HttpServletRequest req) throws SQLException {
		Map<String,Object> params = new HashMap<>();
		params.put("uName", req.getParameter("uName"));
		params.put("toChange", req.getParameter("toChange"));
		
		this.getUserDao().updateUser(params);
	}

	@Override
	public List<User> getAllUser() throws SQLException {
		// TODO Auto-generated method stub
		return this.getUserDao().getAllUsers();
	}*/
	
}
