<%@page import="cn.chenpeng.monitor.domain.DBcfg"%>
<%@page import="cn.chenpeng.monitor.domain.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>Update DBcfg</title>
<style type="text/css">
<!--
#div_1 {
	background-color: #CCFFFF;
	overflow: hidden;
	position: absolute;
	visibility: inherit;
	z-index: auto;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;	

}
form {
	height: 10mm;
	width: 3cm;
	text-align: center;
	vertical-align: middle;

}
span {
text-align:left;
}
td.a {
	height: 10mm;
	width: 4cm;
	text-align: center;
	vertical-align: middle;
}
td.b {
	height: 10mm;
	width: 8cm;
	text-align: center;
	vertical-align: middle;
}
-->
</style>
</head>
<body>
	
<script type="text/javascript" charset="utf-8">
	

</script>
<%
User currentuser = (User)request.getSession().getAttribute("currentuser");
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String username = "";
String dbtype = "";
String driver = "";
String url = "";
String user = "";
String password = "";

String sqltype=null;
String title = null;
String readonly = "";
String submit="";
DBcfg dbcfg = (DBcfg)request.getSession().getAttribute("addDBcfg");
String updatetype=request.getParameter("updatetype");
if("modify".equals(updatetype)){
	username = request.getParameter("username");
	dbtype = request.getParameter("dbtype");
	driver = request.getParameter("driver");
	url = request.getParameter("url");
	user = request.getParameter("user");
	password = request.getParameter("password");
	sqltype="modify";
	title = "Modify DBcfg Information";
	readonly="readonly='readonly'";
	submit="Modify";
}else if("readd".equals(updatetype)){
	if(dbcfg!=null){
		username = dbcfg.getUsername();
		dbtype = dbcfg.getPassword();
		driver = dbcfg.getPassword();
		url = dbcfg.getUrl();
		user = dbcfg.getUser();
		password = dbcfg.getPassword();
		session.removeAttribute("addDBcfg");
		sqltype="add";
		title = "Go on Add DBcfg";
		submit="Create";
		readonly="readonly='readonly'";
		session.removeAttribute("addDBcfg");
	}
}else{
	username=currentuser.getUsername();
	sqltype="add";
	title = "Add DBcfg";
	readonly="readonly='readonly'";
	submit="Create";
}

%>
<div id="div_1">
<h2><%=title %></h2>
	   <table border="1" align="center" cellpadding="1" cellspacing="0" id="table_1">
	   <form action="DBcfgHandleServlet?sqltype=<%=sqltype %>" method="post" id="form_1">
	   <tr bgcolor="#0000FF"><th>Option</th><th>Value</th></tr>
	   
	   
		<tr bgcolor="#CCFFFF">
	   		<td class="a"><div align="left"><span>UserName</span></div></td>
	   		<td class="b"><div class="form_1"><div align="left"><input type="text" name="username" value="<%=username %>" <%=readonly %>/>
	   		<span id="span_username"></span></div></div></td>
	   	</tr>
	   
	   <tr bgcolor="#FFFFFF">
	   		<td class="a"><div align="left"><span>DBType</span></div></td>
	   		<td class="b"><div class="form_1"><div align="left">
	   		<select name="dbtype">
				<option>Oracle</option>
				<option>MySQL</option>
				<option>SQLServer</option>
			</select>
	   		
	   		<span id="span_password"></span></div></div></td>
	   </tr>
	   <tr bgcolor="#CCFFFF">
	   		<td class="a"><div align="left"><span>Driver</span></div></td>
	   		<td class="b"><div class="form_1"><div align="left"><input type="text" name="driver" value="<%=driver %>" />
	   		<span id="span_repassword"></div></div></td>
	   </tr>
	   <div><input type="hidden" name="usertype" value="normal" /></div>
	   <tr bgcolor="#FFFFFF">
	   		<td class="a"><div align="left"><span>URL</span></div></td>
	   		<td class="b"><div class="form_1"><div align="left"><input type="text" name="url" value="<%=url %>" />
	   		<span id="span_realname"></div></div></td>
	   </tr>
	   <tr bgcolor="#CCFFFF">
	   		<td class="a"><div align="left"><span>User</span><div class="form_1"></div></td>
	     	<td class="b"><div align="left"><input type="text" name="user" value="<%=user %>" />
	     	<span id="span_phone"></div></td>
	    
	   </tr>
	   <tr bgcolor="#FFFFFF">
	   		<td class="a"><div align="left"><span>Password</span></div></td>
	   		<td class="b"><div class="form_1"><div align="left"><input type="text" name="password" value="<%=password %>" />
	   		<span id="span_mail"></div></div></td>
	   		</tr>
	   <input type="hidden" name="oldusername" value="<%=username %>" />
	   <input type="hidden" name="olddbtype" value="<%=dbtype %>" />
	   <input type="hidden" name="olddriver" value="<%=driver %>" />
	   <input type="hidden" name="oldurl" value="<%=url %>" />
	   <input type="hidden" name="olduser" value="<%=user %>" />
	   <input type="hidden" name="oldpassword" value="<%=password %>" />
	   <tr bgcolor="#CCFFFF">
	   		<td colspan="2" style="text-align:center"><div><input type="submit" name="submit" value="<%=submit %>" />
	   		<span>           </span>
	   		<input type="reset" name="reset" value="ReSet" />
	   		<span id="span_submit"></span></div></td>
	   </tr>
	   
	   </form>
	   </table>
</div>

</body>
</html>