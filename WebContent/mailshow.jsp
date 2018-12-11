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
<title>Show Mails</title>
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
ArrayList<Mail> list = (ArrayList<Mail>)request.getAttribute("mails");
String[] code = {"#FFFFFF","#CCFFFF"};
%>
<div id="div_1">
	<table width="680" height="124" border="1" align="center" cellpadding="1" cellspacing="0" id="table_1">
		<tr bgcolor="#0033FF"><th height="38">Mail Address</th><th>User Name</th><th>Operation</th></tr>
		<% 
		for(int i=0;i<list.size();i++){
				Mail mail = list.get(i);
					%>
					<tr bgcolor="<%=code[i%2]%>"><td><%=mail.getMailaddr() %></td><td><%=mail.getUsername() %></td><td>
					<a href="MailHandleServlet?sqltype=delete&mailaddr=<%=mail.getMailaddr() %>&username=<%=mail.getUsername() %>">Delete</a></td>
					</tr>
					<%
			}
				%>
				<tr bgcolor="#FFFF99">
					<form action="MailHandleServlet?sqltype=add" method="post" onSubmit="return checkAddMail()">
					<th height="30" colspan="2" style="text-align:left"><span>Add Email-Address </span><input id="mailaddr" type="text" name="mailaddr" placeholder="abc@abc.com" onKeyUp = "value = value.replace(/^[^A-Za-z0-9]$/ig,'')" onblur="checkmail(this)" onclick='empty(this,"span_mail")'></input><span id="span_mail"></th>
					<th><input type="submit" name="submit" value="Add">
					</input></th>
					</form>
				</tr>
				<br />
	</table>
	</div>
</body>
</html>