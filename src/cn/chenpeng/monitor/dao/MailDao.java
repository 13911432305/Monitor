package cn.chenpeng.monitor.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cn.chenpeng.monitor.domain.Mail;
import cn.chenpeng.monitor.domain.User;
import cn.chenpeng.monitor.utils.MySQLUtil;

public class MailDao {
	public ArrayList<Mail> getAllMail(User user) throws SQLException{
		String username = user.getUsername();
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Mail> list = null;
		String sql = "select * from mail where username =?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,username);
			rs = ps.executeQuery();
			list = new ArrayList<Mail>();
			while(rs.next()) {
				Mail mail = new Mail();
				mail.setMailaddr(rs.getString("mailaddr"));
				mail.setUsername(rs.getString("username"));
				list.add(mail);
			}
			return list;
		}finally {
			util.freeConn(conn);
		}
	}
	
	public void addMail(Mail mail) throws SQLException{
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		PreparedStatement ps = null;
		String sql = "insert into mail(mailaddr,username) values(?,?)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,mail.getMailaddr());
			ps.setString(2,mail.getUsername());
			ps.executeUpdate();
		}finally {
			util.freeConn(conn);
		}
	}
	
	public void deleteMail(Mail mail) throws SQLException {
		MySQLUtil util = MySQLUtil.getUtil();
		Connection conn = util.getConn();
		PreparedStatement ps = null;
		String sql = "delete from mail where mailaddr=? and username=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,mail.getMailaddr());
			ps.setString(2,mail.getUsername());
			
			ps.executeUpdate();
		}finally {
			util.freeConn(conn);
		}
	}
	
}
