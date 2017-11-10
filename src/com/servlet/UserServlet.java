package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;*/

import com.service.UserService;

public class UserServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/* SAMPLE SERVLET
	 * 
	 * @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = req.getParameter("action");
		String view = "";
		
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/resource/applicationContext.xml");
		UserService userService = (UserService) context.getBean("userService");

		try{
			if("login".equals(action)){
				String login = userService.validateLogin(req);
				if(login == null){
					req.setAttribute("message", "");
					view = "views/message.jsp";
				}else{
					req.setAttribute("userList", userService.getAllUser());
					view = "views/home.jsp";
				}
			}else if("addUser".equals(action)){
				userService.addUser(req);
			}else if("updateUser".equals(action)){
				userService.updateUser(req);
			}
		}catch(Exception e){
			req.setAttribute("msg", e.getMessage());
			view = "views/message.jsp";
			e.printStackTrace();
		}finally{
			RequestDispatcher dispatcher = req.getRequestDispatcher(view);
			dispatcher.forward(req, resp);
		}
	}*/
	
}
