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

import cn.chenpeng.monitor.dao.SQLDao;
import cn.chenpeng.monitor.domain.SqlScript;
import cn.chenpeng.monitor.domain.User;

@WebServlet("/SQLHandleServlet")
public class SQLHandleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SQLHandleServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		User user = (User)request.getSession().getAttribute("currentuser");
		String sqltype = request.getParameter("sqltype");
		if("showAll".equals(sqltype)) {
			SQLDao sqlDao = new SQLDao();
			ArrayList<SqlScript> list = sqlDao.getAllSQL(user);
			
			request.setAttribute("sqls", list);
			request.getRequestDispatcher("sqlshow.jsp").forward(request, response);
			
		}else if("add".equals(sqltype)) {
			SqlScript sqlScript = new SqlScript();
			HttpSession session= request.getSession();
			sqlScript.setUsername(request.getParameter("username"));
			sqlScript.setSqlname(request.getParameter("sqlname"));
			sqlScript.setSqltext(request.getParameter("sqltext"));
			SQLDao sqlDao = new SQLDao();
			try {
				sqlDao.addSQL(sqlScript);
			} catch (SQLIntegrityConstraintViolationException e) {
				e.printStackTrace();
				
				session.setAttribute("sqlScripta", sqlScript);
				request.getRequestDispatcher("fail.jsp?optype=add&text=sqlscript&reason=exist").forward(request, response);
				return;
			} catch (SQLException e) {
				e.printStackTrace();
				session.setAttribute("sqlScripta", sqlScript);
				request.getRequestDispatcher("fail.jsp?optype=add&text=sqlscript&reason=other").forward(request, response);
				return;
			}
			session.setAttribute("sqlScripta", sqlScript);
			request.getRequestDispatcher("success.jsp?optype=add&text=sqlscript").forward(request, response);
		}else if("details".equals(sqltype)) {
			SQLDao sqlDao = new SQLDao();
			SqlScript sqlScript = new SqlScript();
			
			sqlScript.setUsername(request.getParameter("username"));
			sqlScript.setSqlname(request.getParameter("sqlname"));
			sqlScript.setSqltext("");
			SqlScript sqlScriptNew = sqlDao.sqlDetails(sqlScript);
			
			request.setAttribute("sqlScriptm", sqlScriptNew);
			request.getRequestDispatcher("updatesql.jsp?updatetype=details").forward(request, response);
			
		}else if("delete".equals(sqltype)) {
			SqlScript sqlScript = new SqlScript();
			sqlScript.setUsername(request.getParameter("username"));;
			sqlScript.setSqlname(request.getParameter("sqlname"));
			sqlScript.setSqltext(request.getParameter(""));
			
			SQLDao sqlDao = new SQLDao();
			try {
				sqlDao.deleteSQL(sqlScript);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("SQLHandleServlet?sqltype=showAll").forward(request, response);
		}else if("modify".equals(sqltype)) {
			SQLDao sqlDao = new SQLDao();
			SqlScript sqlScript = new SqlScript();
			
			sqlScript.setUsername(request.getParameter("username"));
			sqlScript.setSqlname(request.getParameter("sqlname"));
			sqlScript.setSqltext(request.getParameter("sqltext"));
			try {
				sqlDao.updateSQL(sqlScript);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("SQLHandleServlet?sqltype=showAll").forward(request, response);
			
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
