package cn.chenpeng.monitor.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.chenpeng.monitor.dao.UserDao;
import cn.chenpeng.monitor.domain.User;

@WebServlet("/UserHandleServlet")
public class UserHandleServlet extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
    
    public UserHandleServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String sqltype = request.getParameter("sqltype");
		if("showAll".equals(sqltype)) {
			UserDao userDao = new UserDao();
			ArrayList<User> list = userDao.getAllUser();
			
			request.setAttribute("users", list);
			request.getRequestDispatcher("usershow.jsp").forward(request, response);
			
		}else if("delete".equals(sqltype)) {
			User user = new User();
			user.setUsername(request.getParameter("username"));
			user.setPassword(request.getParameter("password"));
			user.setUsertype(request.getParameter("usertype"));
			user.setRealname(request.getParameter("realname"));
			user.setPhone(request.getParameter("phone"));
			user.setMail(request.getParameter("mail"));
			UserDao userDao = new UserDao();
			try {
				userDao.deleteUser(user);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("UserHandleServlet?sqltype=showAll");
		}else if("query".equals(sqltype)) {
			
		}else if("add".equals(sqltype)) {
			User user = new User();
			String username = request.getParameter("username");
			
			user.setUsername(username);
			user.setPassword(request.getParameter("password"));
			user.setRealname(request.getParameter("realname"));
			user.setPhone(request.getParameter("phone"));
			user.setMail(request.getParameter("mail"));
			user.setUsertype("normal");
			UserDao userDao = new UserDao();
			
			try {
				userDao.addUser(user);
			} catch (SQLIntegrityConstraintViolationException e) {
				e.printStackTrace();
				HttpSession session= request.getSession();
				session.setAttribute("adduser", user);
				response.sendRedirect("fail.jsp?optype=add&text=user&reason=exist");
				return;
			} catch (SQLException e) {
				e.printStackTrace();
				HttpSession session= request.getSession();
				session.setAttribute("adduser", user);
				response.sendRedirect("fail.jsp?optype=add&text=user&reason=other");
				return;
			}
			HttpSession session= request.getSession();
			session.setAttribute("adduser", user);
			response.sendRedirect("success.jsp?optype=add&text=user");
		}else if("modify".equals(sqltype)) {
			User user = new User();
			
			user.setUsername(request.getParameter("username"));
			user.setPassword(request.getParameter("password"));
			user.setRealname(request.getParameter("realname"));
			user.setPhone(request.getParameter("phone"));
			user.setMail(request.getParameter("mail"));
			user.setUsertype("normal");
			
			UserDao userDao = new UserDao();
			
			try {
				userDao.updateUser(user);
			} catch (SQLException e) {
				e.printStackTrace();
				HttpSession session= request.getSession();
				session.setAttribute("adduser", user);
				response.sendRedirect("fail.jsp?optype=modify&text=user&reason=other");
			}
			response.sendRedirect("success.jsp?optype=modify&text=user");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
