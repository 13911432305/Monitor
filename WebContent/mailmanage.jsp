<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Mail Management</title>
<link rel="stylesheet" href="cssfile/mailmanage.css" type="text/css" />
</head>
<body>
<div id="div_1">
	<div id="div_2"><div id="div_3"><span>Mail Management</span><span id="span_return"><a href="welcome.jsp">Return main page</a></span></div>
	</div>
	<div id="div_4">
		<ul type="disc">
		<div><li><a href="MailHandleServlet?sqltype=showAll" target="jspshow">MailBox Manage</a></li></div>
		<br />
		<div><li><a href="MailGroupHandleServlet?sqltype=showAll" target="jspshow">MailBox Group Manage</a></li></div>
		<br />
		<div><li><a href="outboxsetting。jsp" target="jspshow">Outbox Setting</a></li></div>
		</ul>
	</div>
	<div id="div_5"><iframe id="iframe_1" name="jspshow"></iframe></div>
</div>
</body>
</html>