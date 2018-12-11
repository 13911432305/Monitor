<%@page import="java.util.Iterator"%>
<%@page import="cn.chenpeng.monitor.domain.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Show Users</title>
<style type="text/css">
<!--
#div_1 {
	background-color: #CCFFFF;
	overflow: hidden;
	position: absolute;
	visibility: inherit;
	z-index: auto;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;	
}

td {
	height: 7mm;
	width: 3cm;
	text-align: center;
	vertical-align: middle;
}
td {font-size: 11px}
-->
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
ArrayList<User> list = (ArrayList<User>)request.getAttribute("users");
String[] code = {"#FFFFFF","#CCFFFF"};

%>
<div id="div_1">
<h2>User Show</h2>
	<table width="680" height="124" border="1" align="center" cellpadding="1" cellspacing="0" id="table_1">
	
		<tr bgcolor="#0033FF"><th height="38">UserName</th><th>Password</th><th>UserType</th><th>RealName</th><th>Phone</th><th>Mail</th><th colspan="2">Operation</th></tr>
		<% 
		
		for(int i=0;i<list.size();i++){
			
				User user = list.get(i);
				if("mrchen".equals(user.getUsername())){
					%>
					<tr bgcolor="<%=code[i%2]%>"><td><%=user.getUsername() %></td><td><%=user.getPassword() %></td><td><%=user.getUsertype() %></td><td><%=user.getRealname() %></td><td><%=user.getPhone() %></td><td><%=user.getMail() %></td><td>
					</td>
					<td></td></tr>
									
					<%
				}else{
					%>
					<tr bgcolor="<%=code[i%2]%>"><td><%=user.getUsername() %></td><td><%=user.getPassword() %></td><td><%=user.getUsertype() %></td><td><%=user.getRealname() %></td><td><%=user.getPhone() %></td><td><%=user.getMail() %></td><td>
					<a href="UserHandleServlet?sqltype=delete&username=<%=user.getUsername() %>&password=<%=user.getPassword() %>&usertype=<%=user.getUsertype() %>&realname=<%=user.getRealname() %>&phone=<%=user.getPhone() %>&mail=<%=user.getMail() %>">Delete</a></td>
					<td><a href="updateuser.jsp?updatetype=modify&username=<%=user.getUsername() %>&password=<%=user.getPassword() %>&usertype=<%=user.getUsertype() %>&realname=<%=user.getRealname() %>&phone=<%=user.getPhone() %>&mail=<%=user.getMail() %>">Modify</a></td></tr>
									
					<%
				}
				
			}
		%>
		
	</table>
	</div>
</body>
</html>