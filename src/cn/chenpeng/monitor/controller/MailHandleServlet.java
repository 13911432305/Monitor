package cn.chenpeng.monitor.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.chenpeng.monitor.dao.MailDao;
import cn.chenpeng.monitor.domain.Mail;
import cn.chenpeng.monitor.domain.User;

@WebServlet("/MailHandleServlet")
public class MailHandleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MailHandleServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		User user = (User)request.getSession().getAttribute("currentuser");
		String sqltype = request.getParameter("sqltype");
		ArrayList<Mail> list = null;
		if("showAll".equals(sqltype)) {
			MailDao mailDao = new MailDao();
			try {
				list = mailDao.getAllMail(user);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("mails", list);
			request.getRequestDispatcher("mailshow.jsp").forward(request, response);
			
		}else if("add".equals(sqltype)) {
			MailDao mailDao = new MailDao();
			Mail mail = new Mail();
			
			mail.setMailaddr(request.getParameter("mailaddr"));
			mail.setUsername(user.getUsername());
			
			try {
				mailDao.addMail(mail);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("MailHandleServlet?sqltype=showAll").forward(request, response);
			
		}else if("delete".equals(sqltype)) {
			Mail mail = new Mail();
			String mailaddr = request.getParameter("mailaddr");
			mail.setMailaddr(mailaddr);
			mail.setUsername(user.getUsername());
			
			MailDao mailDao = new MailDao();
			try {
				mailDao.deleteMail(mail);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("MailHandleServlet?sqltype=showAll").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
