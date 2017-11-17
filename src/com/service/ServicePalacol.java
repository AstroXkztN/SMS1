package com.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.entity.UserPalacol;

public interface ServicePalacol {
	boolean login(HttpServletRequest request);
	String validateLogin(HttpServletRequest request, List<UserPalacol> users);
	String checkSession(HttpServletRequest request);
	String validateEmail(HttpServletRequest request, List<UserPalacol> users);
	void sendEmail(String receiverEmailID, String Subject, String Body);
}
