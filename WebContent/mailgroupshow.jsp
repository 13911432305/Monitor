<%@page import="cn.chenpeng.monitor.domain.MailGroup"%>
<%@page import="java.util.Iterator"%>
<%@page import="cn.chenpeng.monitor.domain.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Show Mail Group</title>
<link rel="stylesheet" href="cssfile/mailgroupshow.css" type="text/css" />
</head>
<body>
<script type="text/javascript" charset="utf-8" src="jsfile/mailgroupshow.js">
	
</script>

<%
request.setCharacterEncoding("utf-8");
ArrayList<MailGroup> list = (ArrayList<MailGroup>)request.getAttribute("mailgroups");
String[] code = {"#FFFFFF","#CCFFFF"};
User user = (User)session.getAttribute("currentuser");
%>

<div id="div_1">
	
	<table width="680" height="124" border="1" align="center" cellpadding="1" cellspacing="0" id="table_1">
		<tr bgcolor="#0033FF"><th height="38">Group Name</th><th>User Name</th><th colspan="2">Operation</th></tr>
		<% 
		for(int i=0;i<list.size();i++){
				MailGroup mailGroup = list.get(i);
					%>
					<tr bgcolor="<%=code[i%2]%>"><td><%=mailGroup.getGroupname() %></td><td><%=mailGroup.getUsername() %></td>
					<td><a href="MailGroupHandleServlet?sqltype=deletegroup&groupname=<%=mailGroup.getGroupname() %>&username=<%=mailGroup.getUsername() %>">Delete</a></td>
					<td><a href="MailGroupHandleServlet?sqltype=details&groupname=<%=mailGroup.getGroupname() %>&username=<%=mailGroup.getUsername() %>">Details</a></td>
					</tr>
					<%
			}
				%>
				<tr bgcolor="#FFFF99">
					<form action="MailGroupHandleServlet?sqltype=addGroup" method="post" onSubmit="return checkAddMail()">
					<td height="30" colspan="2" style="text-align:left"><span>Add Mail Group </span><input id="groupid" type="text" name="groupname" placeholder="congestion or congestion_1" onKeyUp = "value = value.replace(/[^a-z_0-9]|^[^a-z]/ig,'')" onblur="checkgroupname(this)" onclick='empty(this,"span_groupname")'></input><span id="span_groupname"></td>
					<td colspan="2">
					<input type="hidden" name="username" value="<%=user.getUsername() %>">
					<input type="submit" name="submit" value="Add"></input>
					</td>
					</form>
				</tr>
	</table>
	</div>
</body>
</html>