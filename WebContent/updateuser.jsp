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
<title>Update User</title>
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
	
<script type="text/javascript" charset="utf-8" src="jsfile/updateuser.js">
	

</script>
<%

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String username = "";
String password = "";
String repassword = "";
String realname = "";
String phone = "";
String mail = "";
String sqltype=null;
String title = null;
String readonly = "";
String submit="";
String updatetype=request.getParameter("updatetype");
User user = (User)session.getAttribute("adduser");
if("modify".equals(updatetype)){
	username = request.getParameter("username");
	password = request.getParameter("password");
	repassword = request.getParameter("password");
	realname = request.getParameter("realname");
	phone = request.getParameter("phone");
	mail = request.getParameter("mail");
	sqltype="modify";
	title = "Update User Information";
	submit = "Create";
	readonly="readonly='readonly'";
	submit="Modify";
}else if("readd".equals(updatetype)){
	if(user!=null){
		username = user.getUsername();
		password = user.getPassword();
		repassword = user.getPassword();
		realname = user.getRealname();
		phone = user.getPhone();
		mail = user.getMail();
		session.removeAttribute("adduser");
		sqltype="add";
		title = "Go on Add User";
		submit="Create";
	}
}else{
	sqltype="add";
	title = "Add User";
	submit="Create";
}

%>
<div id="div_1">
<h2><%=title %></h2>
	   <table border="1" align="center" cellpadding="1" cellspacing="0" id="table_1">
	   <form action="UserHandleServlet?sqltype=<%=sqltype %>" method="post" id="form_1" onSubmit="return checkAll()">
	   <tr bgcolor="#0000FF"><th>Option</th><th>Value</th></tr>
	   
	   
		<tr bgcolor="#CCFFFF">
	   		<td class="a"><div align="left"><span>UserName(2~20)</span></div></td>
	   		<td class="b"><div class="form_1"><div align="left"><input type="text" name="username" value="<%=username %>" <%=readonly %> placeholder="zhangsan or zhangsan_1" onKeyUp = "value = value.replace(/[^a-z_0-9]|^[^a-z]/ig,'')" onblur="checkusername(this)" onclick='empty(this,"span_username")' />
	   		<span id="span_username"></span></div></div></td>
	   	</tr>
	  
	   
	   
	   <tr bgcolor="#FFFFFF">
	   		<td class="a"><div align="left"><span>Password(8~16)</span></div></td>
	   		<td class="b"><div class="form_1"><div align="left"><input type="password" name="password" value="<%=password %>" placeholder="Abc_123" onKeyUp = "value = value.replace(/[^A-Za-z_0-9]|^[^A-Za-z]/g,'');checkon(this);checkoff(this)" onblur="checkpassword(this)" onclick='empty(this,"span_password")' />
	   		<span id="span_password"></span></div></div></td>
	   </tr>
	   <tr bgcolor="#CCFFFF">
	   		<td class="a"><div align="left"><span>RePassword(8~16)</span></div></td>
	   		<td class="b"><div class="form_1"><div align="left"><input type="password" name="repassword" value="<%=repassword %>" disabled="disabled" placeholder="Abc_123" onKeyUp = "value = value.replace(/[^A-Za-z_0-9]|^[^A-Za-z]/g,'')" onblur="checkrepassword(this)" onclick='empty(this,"span_repassword")' />
	   		<span id="span_repassword"></div></div></td>
	   </tr>
	   <div><input type="hidden" name="usertype" value="normal" /></div>
	   <tr bgcolor="#FFFFFF">
	   		<td class="a"><div align="left"><span>RealName(2~4)</span></div></td>
	   		<td class="b"><div class="form_1"><div align="left"><input type="text" name="realname" value="<%=realname %>" placeholder="例:张三" onKeyUp = "value = value.replace(/[^\u4E00-\u9FA5]/g,'')" onblur="checkrealname(this)" onclick='empty(this,"span_realname")' />
	   		<span id="span_realname"></div></div></td>
	   </tr>
	   <tr bgcolor="#CCFFFF">
	   		<td class="a"><div align="left"><span>Phone(11)</span><div class="form_1"></div></td>
	     	<td class="b"><div align="left"><input type="text" name="phone" value="<%=phone %>" placeholder="18888888888" onKeyUp = "value = value.replace(/[^0-9]|^[^1]/g,'')" onblur="checkphone(this)" onclick='empty(this,"span_phone")' />
	     	<span id="span_phone"></div></td>
	    
	   </tr>
	   <tr bgcolor="#FFFFFF">
	   		<td class="a"><div align="left"><span>Mail</span></div></td>
	   		<td class="b"><div class="form_1"><div align="left"><input type="text" name="mail" value="<%=mail %>" placeholder="abc@abc.com" onKeyUp = "value = value.replace(/^[^A-Za-z0-9]$/ig,'')" onblur="checkmail(this)" onclick='empty(this,"span_mail")' />
	   		<span id="span_mail"></div></div></td>
	   		</tr>
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