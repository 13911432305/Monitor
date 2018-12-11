package cn.chenpeng.monitor.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.chenpeng.monitor.dao.UserDao;
import cn.chenpeng.monitor.domain.User;
@WebServlet("/LoginHandleServlet")
public class LoginHandleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginHandleServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		String sessionId = (String)request.getSession().getServletContext().getAttribute(username);
		
		if(sessionId!=null&&sessionId!=session.getId()) {
			response.sendRedirect("login.jsp?resulttype=logged");
		}else {
			UserDao userDao = new UserDao();
			
			User user = userDao.findUser(username, password);
			
			if(user == null) {
				response.sendRedirect("login.jsp?resulttype=error");
			}else {
				session.setAttribute("currentuser", user);
				session.getServletContext().setAttribute(user.getUsername(),session.getId());
				Cookie cookie = new Cookie("JSESSIONID", session.getId()); 
				cookie.setMaxAge(60*120);
				response.addCookie(cookie);
				response.sendRedirect("welcome.jsp");
			}
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
