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

public class UserMaintenanceServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = req.getParameter("action");
		String view = "";
		
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/resource/applicationContext.xml");
		UserMaintenanceService userMaintenanceService = (UserMaintenanceService) context.getBean("userMaintenanceService");

		try{
			if("updateUser".equals(action)){
				userMaintenanceService.updateUser(req);
				req.setAttribute("userTable", userMaintenanceService.getAllUser());
				view = "views/menu/maintenance/userMaintenance.jsp";
			}else if("addUser".equals(action)){
				userMaintenanceService.addUser(req);
				req.setAttribute("userTable", userMaintenanceService.getAllUser());
				view = "views/menu/maintenance/userMaintenance.jsp";
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			RequestDispatcher dispatcher = req.getRequestDispatcher(view);
			dispatcher.forward(req, resp);
		}
	}
}
