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
<title>Update SQL</title>
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
#textarea1 {
 	width: 500px;
    height: 300px;
    max-width: 500px;
    max-height: 300px;
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
String updatetype = request.getParameter("updatetype");
String username="";
String sqlname="";
String sqltext="";
String sqltype="";
String submit="";
String readonly="";
if("details".equals(updatetype)){
	SqlScript sqlScriptm = (SqlScript)request.getAttribute("sqlScriptm");
	username=sqlScriptm.getUsername();
	sqlname=sqlScriptm.getSqlname();
	sqltext=sqlScriptm.getSqltext();
	sqltype="modify";
	submit="Modify";
	request.removeAttribute("sqlScriptm");
	readonly="readonly='readonly'";
}else if("add".equals(updatetype)){
	username=((User)session.getAttribute("currentuser")).getUsername();
	sqlname=request.getParameter("sqlname");
	sqltype="add";
	submit="Create";
	readonly="readonly='readonly'";
	
}else if("readd".equals(updatetype)){
	SqlScript sqlScripta = (SqlScript)session.getAttribute("sqlScripta");
	sqltype="add";
	submit="Create";
	
	username=sqlScripta.getUsername();
	sqlname=sqlScripta.getSqlname();
	sqltext=sqlScripta.getSqltext();
	session.removeAttribute("sqlScripta");
}
%>
<div id="div_1">
	<a href="SQLHandleServlet?sqltype=showAll" style="right:auto">Return</a>
	<table width="680" height="124" border="1" align="center" cellpadding="1" cellspacing="0" id="table_1">
	
		<tr bgcolor="#0033FF"><th height="38">Property</th><th>Value</th></tr>
		
			<form action="SQLHandleServlet?sqltype=<%=sqltype %>" method="post">
				<tr bgcolor="#FFFFFF"><td>User Name</td><td><input type="text" name="username" value="<%=username %>" readonly='readonly' /></td>
				</tr>
									
				<tr bgcolor="#CCFFFF"><td>SQL Name</td><td><input type="text" name="sqlname" value="<%=sqlname %>" <%=readonly %> /></td>
				</tr>
				
				<tr bgcolor="#FFFFFF"><td>SQL Text</td>
				<td>
				<textarea id="textarea1" name="sqltext" ><%=sqltext %>
				</textarea>
				</td>
				</tr>
				<tr bgcolor="#CCFFFF"><td colspan="2"><input type="submit" name="submit" value="<%=submit %>" /></td>
				</tr>
			</form>
	</table>
	</div>
</body>
</html>