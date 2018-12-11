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
import cn.chenpeng.monitor.dao.MailGroupDao;
import cn.chenpeng.monitor.domain.Mail;
import cn.chenpeng.monitor.domain.MailGroup;
import cn.chenpeng.monitor.domain.User;
@WebServlet("/MailGroupHandleServlet")
public class MailGroupHandleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MailGroupHandleServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String sqltype = request.getParameter("sqltype");
		
		User user = (User)request.getSession().getAttribute("currentuser");
		if("showAll".equals(sqltype)) {
			MailGroupDao mailGroupDao = new MailGroupDao();
			ArrayList<MailGroup> list=null;
			try {
				list = mailGroupDao.getAllMailGroup(user);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("mailgroups", list);
			request.getRequestDispatcher("mailgroupshow.jsp").forward(request, response);
			
		}else if("details".equals(sqltype)) {
			MailGroupDao mailGroupDao = new MailGroupDao();
			MailDao mailDao = new MailDao();
			MailGroup mailGroup = new MailGroup();
			mailGroup.setGroupname(request.getParameter("groupname"));
			mailGroup.setUsername(request.getParameter("username"));
			ArrayList<MailGroup> list = null;
			ArrayList<Mail> list2=null;
			try {
				list = mailGroupDao.getGroupDetails(mailGroup);
				list2 = mailDao.getAllMail(user);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("mailgroupdetails", list);
			request.setAttribute("mails", list2);
			request.getRequestDispatcher("groupdetails.jsp").forward(request, response);
		}else if("detailsdelete".equals(sqltype)) {
			MailGroupDao mailGroupDao = new MailGroupDao();
			MailGroup mailGroup = new MailGroup();
			mailGroup.setMailaddr(request.getParameter("mailaddr"));
			mailGroup.setGroupname(request.getParameter("groupname"));
			mailGroup.setUsername(request.getParameter("username"));
			try {
				mailGroupDao.deleteDetails(mailGroup);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("MailGroupHandleServlet?sqltype=details").forward(request, response);
		}else if("addGroup".equals(sqltype)) {
			request.getRequestDispatcher("MailGroupHandleServlet?sqltype=details").forward(request, response);
		}else if("addDetails".equals(sqltype)) {
			MailGroupDao mailGroupDao = new MailGroupDao();
			MailGroup mailGroup = new MailGroup();
			mailGroup.setMailaddr(request.getParameter("mailaddr"));
			mailGroup.setGroupname(request.getParameter("groupname"));
			mailGroup.setUsername(request.getParameter("username"));
			try {
				mailGroupDao.addDetails(mailGroup);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("MailGroupHandleServlet?sqltype=details").forward(request, response);
		}else if("deletegroup".equals(sqltype)) {
			MailGroupDao mailGroupDao = new MailGroupDao();
			MailGroup mailGroup = new MailGroup();
			mailGroup.setGroupname(request.getParameter("groupname"));
			mailGroup.setUsername(request.getParameter("username"));
			try {
				mailGroupDao.deleteGroup(mailGroup);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("MailGroupHandleServlet?sqltype=showAll").forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
