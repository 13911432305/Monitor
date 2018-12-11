package cn.chenpeng.monitor.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLUtil {
	private static MySQLUtil util = new MySQLUtil();
	private Connection conn = null;
	private final String url = "jdbc:mysql://localhost:3306/test?allowMultiQueries=true&serverTimezone=UTC";
	private final String user = "root";
	private final String password = "Chen1985";
	private MySQLUtil() {
		
	}
	public static MySQLUtil getUtil() {
		return util;
	}
	
	public Connection getConn() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			return conn;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}finally {
			conn = null;
		}
	}
	
	public void freeConn(Connection conn) {
		this.conn = conn;
		
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			conn=null;
		}
	}
}
