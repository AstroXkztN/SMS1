package com.dao;

import java.util.List;

import com.entity.UserPalacol;

public interface UserDaoPalacol {
	List<UserPalacol> getAllUsers();
	void lockUser(String user_id);
	void updateLastLogin(String user_id);
}
