package cn.chenpeng.monitor.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cn.chenpeng.monitor.domain.SqlScript;
import cn.chenpeng.monitor.domain.User;
import cn.chenpeng.monitor.utils.MySQLUtil;

public class SQLDao {
	public ArrayList<SqlScript> getAllSQL(User user) {
		
		String username = user.getUsername();
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<SqlScript> list = null;
		String sqltext = "select * from sqlscript where username =?";
		
		try {
			ps = conn.prepareStatement(sqltext);
			ps.setString(1,username);
			rs = ps.executeQuery();
			list = new ArrayList<SqlScript>();
			while(rs.next()) {
				SqlScript sql = new SqlScript();
				sql.setUsername(rs.getString("username"));
				sql.setSqlname(rs.getString("sqlname"));
				sql.setSqltext("");
				list.add(sql);
			}
			return list;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			util.freeConn(conn);
		}
		return list;
	}
	public SqlScript sqlDetails(SqlScript sqlScript) {
		
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		SqlScript sqlScriptNew = null;
		String sqltext = "select * from sqlscript where username =? and sqlname=?";
		
		try {
			ps = conn.prepareStatement(sqltext);
			ps.setString(1,sqlScript.getUsername());
			ps.setString(2,sqlScript.getSqlname());
			rs = ps.executeQuery();
			rs.next();
			sqlScriptNew = new SqlScript();
			sqlScriptNew.setUsername(rs.getString("username"));
			sqlScriptNew.setSqlname(rs.getString("sqlname"));
			sqlScriptNew.setSqltext(rs.getString("sqltext"));
			return sqlScriptNew;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			util.freeConn(conn);
		}
		return sqlScriptNew;
	}
	public void addSQL(SqlScript sqlScript) throws SQLException {
		
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		PreparedStatement ps = null;
		String sqltext = "insert into sqlscript(username,sqlname,sqltext) values(?,?,?)";
		
		try {
			ps = conn.prepareStatement(sqltext);
			ps.setString(1,sqlScript.getUsername());
			ps.setString(2,sqlScript.getSqlname());
			ps.setString(3,sqlScript.getSqltext());
			ps.executeUpdate();
		}finally {
			util.freeConn(conn);
		}
	}
public void updateSQL(SqlScript sqlScript) throws SQLException {
		
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		PreparedStatement ps = null;
		String sqltext = "update sqlscript set sqltext=? where username=? and sqlname=?";
		
		try {
			ps = conn.prepareStatement(sqltext);
			ps.setString(1,sqlScript.getSqltext());
			ps.setString(2,sqlScript.getUsername());
			ps.setString(3,sqlScript.getSqlname());
			
			ps.executeUpdate();
		}finally {
			util.freeConn(conn);
		}
	}
public void deleteSQL(SqlScript sqlScript) throws SQLException {
	
	MySQLUtil util = MySQLUtil.getUtil();
	Connection conn = util.getConn();
	PreparedStatement ps = null;
	String sqltext = "delete from sqlscript where username=? and sqlname=?";
	
	try {
		ps = conn.prepareStatement(sqltext);
		ps.setString(1,sqlScript.getUsername());
		ps.setString(2,sqlScript.getSqlname());
		ps.executeUpdate();
	}finally {
		util.freeConn(conn);
	}
}
	
}
