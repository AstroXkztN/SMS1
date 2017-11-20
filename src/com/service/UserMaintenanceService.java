package com.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.entity.User;

public interface UserMaintenanceService {
	List<User> getAllUser() throws SQLException;
	void updateUser(HttpServletRequest req) throws SQLException;
	void updatePassword(HttpServletRequest req) throws SQLException;
	void addUser(HttpServletRequest req) throws SQLException;
}
