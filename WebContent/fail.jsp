<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Fail Page</title>
<link rel="stylesheet" href="cssfile/fail.css" type="text/css" />
</head>
<body style="height:10cm;width:15cm">
<%
String massage1 = null;
String massage2 = null;
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String optype = request.getParameter("optype");
String text = request.getParameter("text");
String reason = request.getParameter("reason");
String target = null;

if("add".equals(optype)){
	if("DBcfg".equals(text)){
		massage1="Add DBcfg fail";
		target = "updateDBcfg.jsp?updatetype=readd";
	}else if("user".equals(text)){
		massage1="Add User fail";
		target = "updateuser.jsp?updatetype=readd";
	}else if("sqlscript".equals(text)){
		massage1="Add SqlScript fail";
		target = "updatesql.jsp?updatetype=readd";
	}
}else if("modify".equals(optype)){
	if("DBcfg".equals(text)){
		massage1="Update DBcfg fail";
		target = "updateDBcfg.jsp?updatetype=readd";
	}else if("user".equals(text)){
		massage1="Update User fail";
		target = "updateuser.jsp?updatetype=readd";
	}else if("sqlscript".equals(text)){
		massage1="Update SqlScript fail";
		target = "updatesql.jsp?updatetype=readd";
	}
}

if("exist".equals(reason)){
	if("DBcfg".equals(text)){
		massage2="DBcfg has already exist!";
	}else if("user".equals(text)){
		massage2="User has already exist!";
	}
}else if("other".equals(reason)){
	massage2="Unknown cause!";
}

String massage = massage1 + "-Reason:[" + massage2 +"]";
%>

	<div id="div_1">
		
		<div id="div_2"><img src="image/fail.jpg" height="35" width="35" /></div>
		
		<div id="div_3"><span id="span_1"><%=massage %></span></div>
		
		<div id="div_4"><a href="<%=target %>">Return and go on</a></div>
</div>
	
</body>
</html>