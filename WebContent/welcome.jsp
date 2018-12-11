<%@page import="cn.chenpeng.monitor.domain.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>User Management</title>
<link rel="stylesheet" href="cssfile/welcome.css" type="text/css" />
</head>
<body>
<script type="text/javascript" charset="utf-8">

</script>
<% 
	User user = (User)session.getAttribute("currentuser");
%>
<div id="div_1">
	<div id="div_2"><div id="div_3"><span>Welcome to the platform</span><span id="span_return"><a href="login.jsp">Logout</a></span></div>
	</div>
	<div id="div_4">
		<ul type="none" style="list-style:none;margin:0px;padding:0px;">
		<%
			if ("Administrator".equals(user.getUsertype())){
			%>
				<div id="div_4_1" onmouseover="this.style.backgroundColor='#FF9933'" onmouseout="this.style.backgroundColor=''"><li><a href="usermanagement.jsp">User Management</a></li></div>
				<div id="div_4_1" onmouseover="this.style.backgroundColor='#FF9933'" onmouseout="this.style.backgroundColor=''"><li><a href="monitormanage.jsp">Monitor Management</a></li></div>
				<div id="div_4_1" onmouseover="this.style.backgroundColor='#FF9933'" onmouseout="this.style.backgroundColor=''"><li><a href="mailmanage.jsp">Mail Management</a></li></div>
				<div id="div_4_1" onmouseover="this.style.backgroundColor='#FF9933'" onmouseout="this.style.backgroundColor=''"><li><a href="sqlmanage.jsp">SQL File Management</a></li></div>
				<div id="div_4_1" onmouseover="this.style.backgroundColor='#FF9933'" onmouseout="this.style.backgroundColor=''"><li><a href="dbcfgmanage.jsp">DBcfg Management</a></li></div>
				<div id="div_4_1" onmouseover="this.style.backgroundColor='#FF9933'" onmouseout="this.style.backgroundColor=''"><li><a href="mailmanage.jsp">Work Record</a></li></div>
			<%
			}else {
			%>
				
				<div id="div_4_1"><li><a href="monitormanage.jsp">MonitorManagement</a></li></div>
				<div id="div_4_1"><li><a href="mailmanage.jsp">WorkRecord</a></li></div>
			<%
			}
			%>
		</ul>
	</div>
	<div id="div_5"></div>
</div>
</body>
</html>