<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>User Management</title>
<style type="text/css">
<!--
#div_1 {
	background-color: #333333;
	overflow: hidden;
	position: absolute;
	visibility: inherit;
	z-index: auto;
	height: 14.1cm;
	width: 27.1cm;
	left: 128px;
	top: 40px;
	-moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    border-radius: 10px;
}
#div_2 {
	height: 2cm;
	width: 100%;
	background-color: #CCCCCC;
}
#div_3 {
	font-size: 36px;
	position: relative;
	left: 1cm;
	top: 3mm;
}
#div_4 {
	overflow: hidden;
	position: relative;
	visibility: inherit;
	z-index: auto;
	height: 11.5cm;
	width: 6cm;
	left: 3mm;
	top: 3mm;
	bottom: 3px;
	background-color: #CCFFFF;
	-moz-border-radius: 10px;
    -webkit-border-radius: 10px;
	border-radius: 10px;
	clear: left;
	float: left;
}
#div_5 {
	background-color: #CCFFFF;
	position: relative;
	top: 3mm;
	right: 3mm;
	height: 11.5cm;
	width: 20.3cm;
	bottom: 3mm;
	clear: right;
	float: right;
	-moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    border-radius: 10px;
}
#div_6 {
	height: 100%;
	width: 100%;
	position: absolute;
}
#iframe_1 {
	height: 100%;
	width: 100%;
}
#span_return {
	font-size: 18px;
	position: relative;
	right: 2cm;
	top: 0.8cm;
	clear: right;
	float: right;
}
-->
</style>
</head>
<body>
<div id="div_1">
	<div id="div_2"><div id="div_3"><span>UserManagement</span><span id="span_return"><a href="welcome.jsp">Return main page</a></span></div>
	</div>
	
	<div id="div_4">
		<ul type="disc">
		
		<div><li><a href="UserHandleServlet?sqltype=showAll" target="jspshow">Show All Users</a></li></div>
		<br /><div><li><a href="updateuser.jsp" target="jspshow">Add User</a></li></div>
		<br /><div><li><a href="updateuser.jsp" target="jspshow">Show users online</a></li></div>
		
		</ul>
	
	</div>
	<div id="div_5"><div id="div_6"><iframe id="iframe_1" name="jspshow"></iframe></div></div>
	
	
	
</div>
</body>
</html>