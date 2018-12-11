<%@page import="cn.chenpeng.monitor.domain.MailGroup"%>
<%@page import="cn.chenpeng.monitor.domain.Mail"%>
<%@page import="java.util.Iterator"%>
<%@page import="cn.chenpeng.monitor.domain.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Group Details</title>
<style type="text/css">
<!--
#div_1 {
	height: 97%;
	width: 97%;
	overflow: scroll;
	position: absolute;
	visibility: inherit;
	z-index: auto;
	left: 10px;
	top: 10px;
}

td {
	height: 7mm;
	width: 3cm;
	text-align: center;
	vertical-align: middle;
	font-size: 11px;
}
-->
</style>
</head>
<body>
<script type="text/javascript" charset="utf-8">


</script>

<%
request.setCharacterEncoding("utf-8");
ArrayList<MailGroup> list = (ArrayList<MailGroup>)request.getAttribute("mailgroupdetails");
ArrayList<Mail> list2 = (ArrayList<Mail>)request.getAttribute("mails");

String[] code = {"#FFFFFF","#CCFFFF"};
String groupname = request.getParameter("groupname");
String username = request.getParameter("username");
%>
<div id="div_1">
	<a href="MailGroupHandleServlet?sqltype=showAll" style="right:auto">Return</a>
	<table width="680" height="124" border="1" align="center" cellpadding="1" cellspacing="0" id="table_1">
	
		<tr bgcolor="#0033FF"><th height="38">Mail Address</th><th>Group Name</th><th>User Name</th><th>Operation</th></tr>
		
		<% 
		
		for(int i=0;i<list.size();i++){
			
				MailGroup mailGroup = list.get(i);
				
					%>
					<tr bgcolor="<%=code[i%2]%>"><td><%=mailGroup.getMailaddr() %></td><td><%=mailGroup.getGroupname() %></td><td><%=mailGroup.getUsername() %></td><td>
					<a href="MailGroupHandleServlet?sqltype=detailsdelete&mailaddr=<%=mailGroup.getMailaddr() %>&groupname=<%=mailGroup.getGroupname() %>&username=<%=mailGroup.getUsername() %>">Delete</a>
					</tr>
									
					<%
			}
				%>
				<tr bgcolor="#FFFF99">
					<form action="MailGroupHandleServlet?sqltype=addDetails" method="post">
					<td height="30" colspan="2" style="text-align:left"><span>Add Email-Address </span>
					<select name="mailaddr">
					<%

					for(int j=0;j<list2.size();j++){
						
							Mail mail = list2.get(j);
					%>
						<option><%=mail.getMailaddr() %></option>
					<%
					}
					%>
					
					  
					</select>
					
					</td>
					<td colspan="2">
					<input type="hidden" name="groupname" value="<%=groupname %>">
					<input type="hidden" name="username" value="<%=username %>">
					<input type="submit" name="submit" value="Add">
					</input></td>
					</form>
				</tr>
				<br />
	</table>
	</div>
</body>
</html>