package cn.chenpeng.monitor.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cn.chenpeng.monitor.domain.DBcfg;
import cn.chenpeng.monitor.domain.User;
import cn.chenpeng.monitor.utils.MySQLUtil;

public class DBcfgDao {
	public ArrayList<DBcfg> getAllDBcfg(User user) throws SQLException{
		String username = user.getUsername();
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<DBcfg> list = null;
		String sql = "select * from dbcfg where username =?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,username);
			rs = ps.executeQuery();
			list = new ArrayList<DBcfg>();
			while(rs.next()) {
				DBcfg dbcfg = new DBcfg();
				dbcfg.setUsername(rs.getString("username"));
				dbcfg.setDbtype(rs.getString("dbtype"));
				dbcfg.setDriver(rs.getString("driver"));
				dbcfg.setUrl(rs.getString("url"));
				dbcfg.setUser(rs.getString("user"));
				dbcfg.setPassword(rs.getString("password"));
				list.add(dbcfg);
			}
			return list;
		}finally {
			util.freeConn(conn);
		}
	}
	
	public void addDBcfg(DBcfg dbcfg) throws SQLException{
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		PreparedStatement ps = null;
		String sql = "insert into dbcfg(username,dbtype,driver,url,user,password) values(?,?,?,?,?,?)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,dbcfg.getUsername());
			ps.setString(2,dbcfg.getDbtype());
			ps.setString(3,dbcfg.getDriver());
			ps.setString(4,dbcfg.getUrl());
			ps.setString(5,dbcfg.getUser());
			ps.setString(6,dbcfg.getPassword());
			ps.executeUpdate();
		
		}finally {
			util.freeConn(conn);
		}
	}
	public void deleteDBcfg(DBcfg dbcfg) throws SQLException{
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		PreparedStatement ps = null;
		String sql = "delete from dbcfg where username=? and dbtype=?"
				+ " and driver=? and url=? and user=? and password=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,dbcfg.getUsername());
			ps.setString(2,dbcfg.getDbtype());
			ps.setString(3,dbcfg.getDriver());
			ps.setString(4,dbcfg.getUrl());
			ps.setString(5,dbcfg.getUser());
			ps.setString(6,dbcfg.getPassword());
			ps.executeUpdate();
		
		}finally {
			util.freeConn(conn);
		}
	}
	public void updateDBcfg(DBcfg dbcfg,DBcfg dbcfgOld) throws SQLException{
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		PreparedStatement ps = null;
		String sql = "update dbcfg set dbtype=?,driver=?,url=?,user=?,password=? "
				+ "where username=? and dbtype=? and driver=? and url=? and user=? and password=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,dbcfg.getDbtype());
			ps.setString(2,dbcfg.getDriver());
			ps.setString(3,dbcfg.getUrl());
			ps.setString(4,dbcfg.getUser());
			ps.setString(5,dbcfg.getPassword());
			
			ps.setString(6,dbcfgOld.getUsername());
			ps.setString(7,dbcfgOld.getDbtype());
			ps.setString(8,dbcfgOld.getDriver());
			ps.setString(9,dbcfgOld.getUrl());
			ps.setString(10,dbcfgOld.getUser());
			ps.setString(11,dbcfgOld.getPassword());
			ps.executeUpdate();
		
		}finally {
			util.freeConn(conn);
		}
	}
	
}
