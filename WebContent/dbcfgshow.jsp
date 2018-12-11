<%@page import="cn.chenpeng.monitor.domain.DBcfg"%>
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
<title>Show DBcfg</title>
<link rel="stylesheet" href="cssfile/mailshow.css" type="text/css" />
</head>
<body>
<script type="text/javascript" charset="utf-8">
function empty(node,spanname){
	var oSpanNode = document.getElementById(spanname);
	oSpanNode.innerHTML = "";
}
function checkmail(node){
	 
	var reg=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/g;
	if(reg.test(node.value)){
		var oSpanNode = document.getElementById("span_mail");
		oSpanNode.innerHTML = "OK";
		oSpanNode.style.color='green';
	}else if(node.value.length==0){
		var oSpanNode = document.getElementById("span_mail");
		oSpanNode.innerHTML = "";
	}else{
		var oSpanNode = document.getElementById("span_mail");
		oSpanNode.innerHTML = "Non-Standard!";
		oSpanNode.style.color='red';
	}
}

</script>

<%
request.setCharacterEncoding("utf-8");
ArrayList<DBcfg> list = (ArrayList<DBcfg>)request.getAttribute("dbcfgs");
String[] code = {"#FFFFFF","#CCFFFF"};
%>
<div id="div_1">
	<table width="680" height="124" border="1" align="center" cellpadding="1" cellspacing="0" id="table_1">
		<tr bgcolor="#0033FF"><th height="38">User Name</th><th>DB Type</th><th>Driver</th><th>URL</th><th>User</th><th>Password</th><th colspan="2">Operation</th></tr>
		<% 
		for(int i=0;i<list.size();i++){
			DBcfg dbcfg = list.get(i);
					%>
					<tr bgcolor="<%=code[i%2]%>"><td><%=dbcfg.getUsername() %></td><td><%=dbcfg.getDbtype() %></td><td><%=dbcfg.getDriver() %></td><td><%=dbcfg.getUrl() %></td><td><%=dbcfg.getUser() %></td><td><%=dbcfg.getPassword() %></td>
					<td>
					<a href="DBcfgHandleServlet?sqltype=delete&username=<%=dbcfg.getUsername() %>&dbtype=<%=dbcfg.getDbtype() %>&driver=<%=dbcfg.getDriver() %>&url=<%=dbcfg.getUrl() %>&user=<%=dbcfg.getUser() %>&password=<%=dbcfg.getPassword() %>">Delete</a></td>
					<td>
					<a href="updateDBcfg.jsp?updatetype=modify&username=<%=dbcfg.getUsername() %>&dbtype=<%=dbcfg.getDbtype() %>&driver=<%=dbcfg.getDriver() %>&url=<%=dbcfg.getUrl() %>&user=<%=dbcfg.getUser() %>&password=<%=dbcfg.getPassword() %>">Modify</a></td>
					</tr>
					<%
			}
				%>
				
				
	</table>
	</div>
</body>
</html>