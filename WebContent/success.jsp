<%@page import="cn.chenpeng.monitor.domain.SqlScript"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Success Page</title>
<link rel="stylesheet" href="cssfile/success.css" type="text/css" />
</head>
<body style="height: 10cm; width: 15cm">
	<%
		String massage = null;
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String optype = request.getParameter("optype");
		String text = request.getParameter("text");
		String target = null;
		String target2 = null;
		String display = "";
		String display2 = "";

		if ("add".equals(optype)) {
			if ("DBcfg".equals(text)) {
				massage = "Add DBcfg successful!";
				target = "updateDBcfg.jsp?updatetype=add";
				target2 = "DBcfgHandleServlet?sqltype=showAll";
			} else if ("user".equals(text)) {
				massage = "Add User successful!";
				target = "updateuser.jsp?updatetype=add";
				target2 = "UserHandleServlet?sqltype=showAll";
			} else if ("sqlscript".equals(text)) {
				massage = "Add SqlScript successful!";
				target = "updatesql.jsp?updatetype=readd";
				target2 = "SQLHandleServlet?sqltype=showAll";
			}
		} else if ("modify".equals(optype)) {
			if ("DBcfg".equals(text)) {
				massage = "Update DBcfg successful!";
				target = "updateDBcfg.jsp?updatetype=add";
				target2 = "DBcfgHandleServlet?sqltype=showAll";
				display = "style='display:none'";
			} else if ("user".equals(text)) {
				massage = "Update User successful!";
				target = "updateuser.jsp?updatetype=add";
				target2 = "UserHandleServlet?sqltype=showAll";
				display = "style='display:none'";
			} else if ("sqlscript".equals(text)) {
				massage = "Update SqlScript successful!";
				target = "updatesql.jsp?updatetype=add";
				target2 = "SQLHandleServlet?sqltype=showAll";
				display = "style='display:none'";
			}
		}
	%>

	<div id="div_1">

		<div id="div_2">
			<img src="image/success.jpg" height="35" width="35" />
		</div>

		<div id="div_3">
			<span id="span_1"><%=massage%></span>
		</div>

		<div id="div_4" <%=display%>>
			<a href="<%=target%>">Return and go on</a>
		</div>

		<div id="div_5" <%=display2%>>
			<a href="<%=target2%>">Look up all data</a>
		</div>
	</div>

</body>
</html>