package cn.chenpeng.monitor.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cn.chenpeng.monitor.domain.User;
import cn.chenpeng.monitor.utils.MySQLUtil;

public class UserDao {
	
	public int addUser(User user) throws SQLException {
		int result = 0;
		PreparedStatement ps = null;
		String sql = "insert into acount(username,password,usertype,realname,phone,mail) values(?,?,?,?,?,?);";
		
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getUsertype());
			ps.setString(4, user.getRealname());
			ps.setString(5, user.getPhone());
			ps.setString(6, user.getMail());
			result = ps.executeUpdate();
			return result;
		}finally {
			util.freeConn(conn);
		}
		
	}
	
	public void deleteUser(User user) throws SQLException {
		PreparedStatement ps = null;
		String sql = "delete from acount where username=? and password=? and usertype=?"
				+ "and realname=? and phone=? and mail=?";
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getUsertype());
			ps.setString(4, user.getRealname());
			ps.setString(5, user.getPhone());
			ps.setString(6, user.getMail());
			ps.executeUpdate();
		}finally {
			util.freeConn(conn);
		}
	}
	
	public int updateUser(User user) throws SQLException {
		PreparedStatement ps = null;
		String sql = "update acount set password =?,usertype=?,realname=?,phone=?,mail=? where username=?";
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, user.getPassword());
			ps.setString(2, user.getUsertype());
			ps.setString(3, user.getRealname());
			ps.setString(4, user.getPhone());
			ps.setString(5, user.getMail());
			ps.setString(6, user.getUsername());
			int result = ps.executeUpdate();
			return result;
		}finally {
			util.freeConn(conn);
		}
	}
	
	public User findUser(String username,String password) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		User user = null;
		String sql = "select * from acount where username=? and password=?";
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setObject(1, username);
			ps.setObject(2, password);
			rs = ps.executeQuery();
			while(rs.next()) {
				user = new User();
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setUsertype(rs.getString("usertype"));
				user.setRealname(rs.getString("realname"));
				user.setPhone(rs.getString("phone"));
				user.setMail(rs.getString("mail"));
			}
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}finally {
			util.freeConn(conn);
		}
		
	}
	
	public ArrayList<User> getAllUser() {
		
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<User> list = null;
		String sql = "select * from acount order by usertype,username";
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			list = new ArrayList<User>();
			while(rs.next()) {
				User user = new User();
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setUsertype(rs.getString("usertype"));
				user.setRealname(rs.getString("realname"));
				user.setPhone(rs.getString("phone"));
				user.setMail(rs.getString("mail"));
				list.add(user);
			}
			return list;
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}finally {
			util.freeConn(conn);
		}
		
	}
	public boolean findByUserName(String username) {
		boolean result = false;
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select username from acount where username=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while(rs.next()) {
				String user = rs.getString("username");
				if (username.equals(user)) {
					result = true;
				}
			}
			return result;
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}finally {
			util.freeConn(conn);
		}
	}
}
