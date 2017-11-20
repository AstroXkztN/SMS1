package com.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.dao.UserDao;
import com.entity.User;
import com.service.UserMaintenanceService;

public class UserMaintenanceServiceImpl implements UserMaintenanceService{

	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	@Override
	public List<User> getAllUser() throws SQLException {
		System.out.println("UserMaintenanceServiceImpl - ");
		// TODO Auto-generated method stub
		return this.getUserDao().getAllUsers();
	}

	@Override
	public void updateUser(HttpServletRequest req) throws SQLException {
		Map<String,Object> params = new HashMap<>();
		params.put("newUserID", req.getParameter("user_id"));
		params.put("newFirstName", req.getParameter("first_name"));
		params.put("newLastName", req.getParameter("last_name"));
		params.put("newMiddleInitial", req.getParameter("middle_initial"));
		params.put("newEmailAddress", req.getParameter("email_address"));
		params.put("newActiveTag", req.getParameter("active_tag"));
		params.put("newAccessLevel", req.getParameter("access_level"));
		params.put("newLastUser", req.getParameter("last_user"));
		params.put("currUserID", req.getParameter("curr_id"));
		
		this.getUserDao().updateUser(params);
	}

	@Override
	public void addUser(HttpServletRequest req) throws SQLException {
		Map<String,Object> params = new HashMap<>();
		params.put("setUserID", req.getParameter("user_id"));
		params.put("setPassword", req.getParameter("password"));
		params.put("setFirstName", req.getParameter("first_name"));
		params.put("setLastName", req.getParameter("last_name"));
		params.put("setMiddleInitial", req.getParameter("middle_initial"));
		params.put("setEmailAddress", req.getParameter("email_address"));
		params.put("setActiveTag", req.getParameter("active_tag"));
		params.put("setAccessLevel", req.getParameter("access_level"));
		params.put("setLastUser", req.getParameter("last_user"));
		
		this.getUserDao().addUser(params);
	}

	@Override
	public void updatePassword(HttpServletRequest req) throws SQLException {
		Map<String,Object> params = new HashMap<>();
		params.put("currPass", req.getParameter("curr_password"));
		params.put("newPass", req.getParameter("new_password"));
		params.put("lastUser", req.getParameter("last_user"));
		
		this.getUserDao().updatePass(params);
	}

}
