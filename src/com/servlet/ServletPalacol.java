package com.servlet;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDaoPalacol;
import com.dao.impl.UserDaoPalacolImpl;
import com.entity.UserPalacol;
import com.service.ServicePalacol;
import com.service.impl.ServicePalacolImpl;

public class ServletPalacol extends HttpServlet{
	private static final long serialVersionUID = 1L;
	public static String accessLevel; 
	public static int userAttempt = 3; 
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String view = "";
		ServicePalacol service = new ServicePalacolImpl();
		UserDaoPalacol daoUser = new UserDaoPalacolImpl();
		List<UserPalacol> users = daoUser.getAllUsers();
		
		if(action.equals("login")){ //LOGIN
			boolean loginSuccess = service.login(request);
			
			if(loginSuccess){ 
				userAttempt = 3; //resets the counter to 3 para pag nakalogin, balik lang sa 3 ang attempt
				String user = request.getParameter("userName");
				request.setAttribute("user", user);
				session.setAttribute("userSession", user);
				
				view = "views/structure.jsp";
			}else{// if login unsuccessful
				view = service.validateLogin(request, users);
			}
		}else if("checkSession".equals(action)){ //SESSION CHECK
			view = service.checkSession(request);
		}else if(action.equals("logout")){ // LOGOUT
			session.invalidate();
			view = "views/login.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}//doPost()
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String view="";
		UserDaoPalacol daoUser = new UserDaoPalacolImpl();
		List<UserPalacol> users = daoUser.getAllUsers();
		ServicePalacol service = new ServicePalacolImpl();
		
		if("forgot".equals(action)) {
			view = "views/forgot.jsp";
		}
		if("emailSent".equals(action)) {
			view = service.validateEmail(request, users);
		}else if("cancel".equals(action)) {
			view = "views/login.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}//doGet()
}//HttpServlet