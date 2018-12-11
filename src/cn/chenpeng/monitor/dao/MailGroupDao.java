package cn.chenpeng.monitor.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cn.chenpeng.monitor.domain.MailGroup;
import cn.chenpeng.monitor.domain.User;
import cn.chenpeng.monitor.utils.MySQLUtil;

public class MailGroupDao {
	public ArrayList<MailGroup> getAllMailGroup(User user) throws SQLException{
		String username = user.getUsername();
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<MailGroup> list = null;
		String sql = "select groupname,username from mailgroup where username=? group by username,groupname";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,username);
			rs = ps.executeQuery();
			list = new ArrayList<MailGroup>();
			while(rs.next()) {
				MailGroup mailGroup = new MailGroup();
				mailGroup.setGroupname(rs.getString("groupname"));
				mailGroup.setUsername(rs.getString("username"));
				list.add(mailGroup);
			}
			return list;
		}finally {
			util.freeConn(conn);
		}
	}
	public ArrayList<MailGroup> getGroupDetails(MailGroup mailGroup) throws SQLException{
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<MailGroup> list = null;
		String sql = "select * from mailgroup where groupname=? and username=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,mailGroup.getGroupname());
			ps.setString(2,mailGroup.getUsername());
			rs = ps.executeQuery();
			list = new ArrayList<MailGroup>();
			while(rs.next()) {
				MailGroup mailGroupNew = new MailGroup();
				mailGroupNew.setMailaddr(rs.getString("mailaddr"));
				mailGroupNew.setGroupname(rs.getString("groupname"));
				mailGroupNew.setUsername(rs.getString("username"));
				list.add(mailGroupNew);
			}
			return list;
		}finally {
			util.freeConn(conn);
		}
	}
	
	public void addDetails(MailGroup mailGroup) throws SQLException{
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		PreparedStatement ps = null;
		String sql = "insert into mailgroup(mailaddr,groupname,username) values(?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,mailGroup.getMailaddr());
			ps.setString(2,mailGroup.getGroupname());
			ps.setString(3,mailGroup.getUsername());
			
			ps.executeUpdate();
		}finally {
			util.freeConn(conn);
		}
	}
	
	public void deleteDetails(MailGroup mailGroup) throws SQLException {
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		PreparedStatement ps = null;
		String sql = "delete from mailgroup where mailaddr=? and groupname=? and username=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,mailGroup.getMailaddr());
			ps.setString(2,mailGroup.getGroupname());
			ps.setString(3,mailGroup.getUsername());
			
			ps.executeUpdate();
		}finally {
			util.freeConn(conn);
		}
	}
	public void deleteGroup(MailGroup mailGroup) throws SQLException {
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		PreparedStatement ps = null;
		String sql = "delete from mailgroup where groupname=? and username=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,mailGroup.getGroupname());
			ps.setString(2,mailGroup.getUsername());
			
			ps.executeUpdate();
		}finally {
			util.freeConn(conn);
		}
	}
}
