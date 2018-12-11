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

import cn.chenpeng.monitor.dao.DBcfgDao;
import cn.chenpeng.monitor.domain.DBcfg;
import cn.chenpeng.monitor.domain.User;

@WebServlet("/DBcfgHandleServlet")
public class DBcfgHandleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DBcfgHandleServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		User user = (User)request.getSession().getAttribute("currentuser");
		String sqltype = request.getParameter("sqltype");
		if("showAll".equals(sqltype)) {
			DBcfgDao dbcfgDao = new DBcfgDao();
			ArrayList<DBcfg> list=null;
			try {
				list = dbcfgDao.getAllDBcfg(user);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("dbcfgs", list);
			request.getRequestDispatcher("dbcfgshow.jsp").forward(request, response);
			
		}else if("add".equals(sqltype)) {
			DBcfg dbcfg = new DBcfg();
			
			dbcfg.setUsername(request.getParameter("username"));
			dbcfg.setDbtype(request.getParameter("dbtype"));
			dbcfg.setDriver(request.getParameter("driver"));
			dbcfg.setUrl(request.getParameter("url"));
			dbcfg.setUser(request.getParameter("user"));
			dbcfg.setPassword(request.getParameter("password"));
			
			DBcfgDao dbcfgDao =  new DBcfgDao();
			try {
				dbcfgDao.addDBcfg(dbcfg);
			} catch (SQLIntegrityConstraintViolationException e) {
				e.printStackTrace();
				HttpSession session= request.getSession();
				session.setAttribute("addDBcfg", dbcfg);
				response.sendRedirect("fail.jsp?optype=add&text=DBcfg&reason=exist");
				return;
			} catch (SQLException e1) {
				response.sendRedirect("fail.jsp?optype=add&text=DBcfg&reason=other");
				return;
			}
			response.sendRedirect("success.jsp?optype=add&text=DBcfg");
		}else if("delete".equals(sqltype)) {
			DBcfg dbcfg = new DBcfg();
			
			dbcfg.setUsername(request.getParameter("username"));
			dbcfg.setDbtype(request.getParameter("dbtype"));
			dbcfg.setDriver(request.getParameter("driver"));
			dbcfg.setUrl(request.getParameter("url"));
			dbcfg.setUser(request.getParameter("user"));
			dbcfg.setPassword(request.getParameter("password"));
			
			DBcfgDao dbcfgDao =  new DBcfgDao();
			try {
				dbcfgDao.deleteDBcfg(dbcfg);
			}  catch (SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("DBcfgHandleServlet?sqltype=showAll").forward(request, response);
		}else if("modify".equals(sqltype)) {
			DBcfg dbcfg = new DBcfg();
			DBcfg dbcfgOld = new DBcfg();
			
			dbcfg.setUsername(request.getParameter("username"));
			dbcfg.setDbtype(request.getParameter("dbtype"));
			dbcfg.setDriver(request.getParameter("driver"));
			dbcfg.setUrl(request.getParameter("url"));
			dbcfg.setUser(request.getParameter("user"));
			dbcfg.setPassword(request.getParameter("password"));
			
			dbcfgOld.setUsername(request.getParameter("oldusername"));
			dbcfgOld.setDbtype(request.getParameter("olddbtype"));
			dbcfgOld.setDriver(request.getParameter("olddriver"));
			dbcfgOld.setUrl(request.getParameter("oldurl"));
			dbcfgOld.setUser(request.getParameter("olduser"));
			dbcfgOld.setPassword(request.getParameter("oldpassword"));
			
			DBcfgDao dbcfgDao =  new DBcfgDao();
			try {
				dbcfgDao.updateDBcfg(dbcfg,dbcfgOld);
			} catch (SQLException e) {
				e.printStackTrace();
				HttpSession session= request.getSession();
				session.setAttribute("addDBcfg", dbcfg);
				response.sendRedirect("fail.jsp?optype=add&text=DBcfg&reason=other");
				return;
			}
			response.sendRedirect("success.jsp?optype=modify&text=DBcfg");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
