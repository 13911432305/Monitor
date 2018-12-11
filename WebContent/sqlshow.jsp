<%@page import="cn.chenpeng.monitor.domain.SqlScript"%>
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
<link rel="stylesheet" href="cssfile/sqlshow.css" type="text/css" />
</head>
<body>
	<script type="text/javascript" charset="utf-8"
		src="jsfile/mailgroupshow.js">
		
	</script>

	<%
		request.setCharacterEncoding("utf-8");
		ArrayList<SqlScript> list = (ArrayList<SqlScript>) request.getAttribute("sqls");
		String[] code = { "#FFFFFF", "#CCFFFF" };
		User user = (User) session.getAttribute("currentuser");
	%>

	<div id="div_1">

		<table width="680" height="124" border="1" align="center"
			cellpadding="1" cellspacing="0" id="table_1">
			<tr bgcolor="#0033FF">
				<th height="38">User Name</th>
				<th>SQL Name</th>
				<th colspan="2">Operation</th>
			</tr>
			<%
				for (int i = 0; i < list.size(); i++) {
					SqlScript sql = list.get(i);
			%>
			<tr bgcolor="<%=code[i % 2]%>">
				<td><%=sql.getUsername()%></td>
				<td><%=sql.getSqlname()%></td>
				<td><a
					href="SQLHandleServlet?sqltype=delete&username=<%=sql.getUsername()%>&sqlname=<%=sql.getSqlname()%>">Delete</a></td>
				<td><a
					href="SQLHandleServlet?sqltype=details&username=<%=sql.getUsername()%>&sqlname=<%=sql.getSqlname()%>">Details</a></td>
			</tr>
			<%
				}
			%>
			<tr bgcolor="#FFFF99">
				<form action="updatesql.jsp?updatetype=add" method="post"
					onSubmit="return checkAddMail()">
					<td height="30" colspan="2" style="text-align: left"><span>Add
							SQL </span><input type="text" name="sqlname"
						placeholder="sqlname:congestion"
						onKeyUp="value = value.replace(/[^a-z_0-9]|^[^a-z]/ig,'')"
						onblur="checkgroupname(this)"
						onclick='empty(this,"span_groupname")'><span
						id="span_groupname"></td>
					<td colspan="2"><input type="hidden" name="username"
						value="<%=user.getUsername()%>"> <input type="submit"
						name="submit" value="Add"></input></td>
				</form>
			</tr>
		</table>
	</div>
</body>
</html>