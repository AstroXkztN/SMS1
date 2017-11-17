package com.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

import com.dao.UserDaoPalacol;
import com.dao.impl.UserDaoPalacolImpl;
import com.entity.UserPalacol;
import com.service.ServicePalacol;
import com.servlet.ServletPalacol;


public class ServicePalacolImpl implements ServicePalacol{
	private final String senderEmailID = "pakolyte0196@gmail.com";
	private final String senderPassword = "pakolgaming0196";
	private final String emailSMTPserver = "smtp.gmail.com";
	private final String emailServerPort = "465";
	private static String emailSubject = null;
	private static String emailBody = null;

	@Override
	public boolean login(HttpServletRequest request) {
		boolean loginSuccess = false;
		UserDaoPalacol daoUser = new UserDaoPalacolImpl();
		List<UserPalacol> users = daoUser.getAllUsers();
		String userName = request.getParameter("userName").trim();
		String password = request.getParameter("password");
		
		for(UserPalacol user : users) {
			if(userName.equals(user.getUserName()) && password.equals(user.getPassword()) ){
				if(user.getActiveTag().equals("Y")) {
					loginSuccess = true;
					ServletPalacol.accessLevel = user.getAccessLevel();
					daoUser.updateLastLogin(user.getUserName());
				}
				break;
			}//if
		}//for
		return loginSuccess;
	}//login()
	
	@Override
	public String validateLogin(HttpServletRequest request, List<UserPalacol> users) {
		String view="";
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		UserDaoPalacol daoUser = new UserDaoPalacolImpl();
		
		for(UserPalacol user : users) {
			if(userName.equals(user.getUserName()) && !password.equals("")) {
				if(user.getActiveTag().equals("Y")) {
					request.setAttribute("loginMessage", "invalid"); 
					request.setAttribute("attempts", --ServletPalacol.userAttempt);
					view = "views/login.jsp";
					
					if( ServletPalacol.userAttempt <= 0) {
						request.setAttribute("loginMessage", "inactive"); 
						daoUser.lockUser(user.getUserName());
						ServletPalacol.userAttempt = 3;
					}
				}else { //if active_tag = N
					request.setAttribute("loginMessage", "inactive"); 
				}
				break;
			}else if(userName.equals("") || password.equals("")){
				request.setAttribute("isNull", "isNull");
			}else {
				request.setAttribute("loginMessage", "not in database");
			}
		}//for
		return view;
	}//validateLogin()
	
	@Override
	public String checkSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String view="";
		String userSession = (String)session.getAttribute("userSession");
		
		if(userSession == null) {
			request.setAttribute("chkSession", "Y");
			view = "views/login.jsp";
		}else {
			request.setAttribute("user", " back "+userSession);
			
			if(ServletPalacol.accessLevel.equals("A")) {
				view = "views/sampleAdmin.jsp";
			}else {
				view = "views/sampleUser.jsp";
			}
		}//else
		return view;
	}//checkSession()
	
	@Override
	public String validateEmail(HttpServletRequest request, List<UserPalacol> users) {
		String view = "";
		String email = request.getParameter("email").trim();

		for(UserPalacol user : users) {
			if(user.getEmail().equals(email)) {
				sendEmail(email, "SMS Account Password", "This is your password: "+user.getPassword());
				view = "views/login.jsp";
				request.setAttribute("emailStatus", "emailActive");
				break;
			}else if("".equals(email)){
				request.setAttribute("message", "emailNull");
				view = "views/message.jsp";
			}else{
				request.setAttribute("message", "emailInactive");
				view = "views/message.jsp";
			}
		}
		return view;
	}//validateEmail()

	@Override
	public void sendEmail(String receiverEmailID, String Subject, String Body) {
		// Subject
		ServicePalacolImpl.emailSubject=Subject;
		// Body
		ServicePalacolImpl.emailBody=Body;
		Properties props = new Properties();
		props.put("mail.smtp.user",senderEmailID);
		props.put("mail.smtp.host", emailSMTPserver);
		props.put("mail.smtp.port", emailServerPort);
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.socketFactory.port", emailServerPort);
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		try{  
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getInstance(props, auth);
			MimeMessage msg = new MimeMessage(session);
			msg.setText(emailBody);
			msg.setSubject(emailSubject);
			msg.setFrom(new InternetAddress(senderEmailID));
			msg.addRecipient(Message.RecipientType.TO,
			new InternetAddress(receiverEmailID));
			Transport.send(msg);
		}catch (Exception mex){
			mex.printStackTrace();
		}//catch
	}//sendEmail()
	
	public class SMTPAuthenticator extends javax.mail.Authenticator{
		  public PasswordAuthentication getPasswordAuthentication(){
			  return new PasswordAuthentication(senderEmailID, senderPassword);
		  }
	}//SMTPAuthenticator
	
}//ServicePalacolImpl


