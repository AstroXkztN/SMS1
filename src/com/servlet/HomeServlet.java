package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.service.UserMaintenanceService;


public class HomeServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = req.getParameter("action");
		String view = "";
		try{
			ApplicationContext context = new ClassPathXmlApplicationContext("/com/resource/applicationContext.xml");
			if("home".equals(action)){
				req.setAttribute("firstname", ServletPalacol.firstName);
				view = "views/menu/home.jsp";
			}else if("usermaintenance".equals(action)){
				UserMaintenanceService userMaintenanceService = (UserMaintenanceService) context.getBean("userMaintenanceService");
				req.setAttribute("userTable", userMaintenanceService.getAllUser());
				req.setAttribute("userID", ServletPalacol.userID);
				view = "views/menu/maintenance/userMaintenance.jsp";
			}else if("supplytypesmaintenance".equals(action)){
				view = "views/menu/maintenance/supplyTypesMaintenance.jsp";
			}else if("suppliesmaintenance".equals(action)){
				view = "views/menu/maintenance/suppliesMaintenance.jsp";
			}else if("supplies".equals(action)){
				view = "views/menu/supplies.jsp";
			}else if("stocks".equals(action)){
				view = "views/menu/stocks.jsp";
			}else if("changepassword".equals(action)){
				req.setAttribute("userID", ServletPalacol.userID);
				req.setAttribute("password", ServletPalacol.password);
				view = "views/menu/changePassword.jsp";
			}else if("signout".equals(action)){
				view = "views/login.jsp";
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			RequestDispatcher dispatcher = req.getRequestDispatcher(view);
			dispatcher.forward(req, resp);
		}
	}
}
