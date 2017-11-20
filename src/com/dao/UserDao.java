package com.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.entity.User;

public interface UserDao {
	/* SAMPLE DAO CONTENT
	 * 
	 * public String validateLogin(Map<String, Object> params) throws SQLException;*/

	void addUser(Map<String, Object> params) throws SQLException;
	List<User> getAllUsers() throws SQLException;
	void updateUser(Map<String, Object> params) throws SQLException;
	void updatePass(Map<String, Object> params) throws SQLException;
}
