<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>SQL Management</title>
<link rel="stylesheet" href="cssfile/sqlmanage.css" type="text/css" />
</head>
<body>
<div id="div_1">
	<div id="div_2"><div id="div_3"><span>SQL Management</span><span id="span_return"><a href="welcome.jsp">Return main page</a></span></div>
	</div>
	<div id="div_4">
		<ul type="disc">
		<div><li><a href="SQLHandleServlet?sqltype=showAll" target="jspshow">Show SQL Files</a></li></div>
		</ul>
	</div>
	<div id="div_5"><iframe id="iframe_1" name="jspshow"></iframe></div>
</div>
</body>
</html>