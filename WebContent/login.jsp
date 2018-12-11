<%@page import="cn.chenpeng.monitor.domain.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>User Login</title>
<link rel="stylesheet" href="cssfile/login.css" type="text/css" />
</head>
<body>
<script type="text/javascript">

function emptyhint(){
	
	var oSpanNode=document.getElementById("span_hint");
	oSpanNode.innerHTML = "";
	
}

</script>

<% 

	User user = (User)session.getAttribute("currentuser");
	if(user != null){
		String sessionId = (String)session.getServletContext().getAttribute(user.getUsername());
		if(sessionId!=null){
			session.getServletContext().removeAttribute(user.getUsername());
		}
		session.removeAttribute("currentuser");
	}	

	String resulttype = (String)request.getParameter("resulttype");
	
%>
<div id="div_1">


  <div id="div_2">
		
  <div id="div_3">
	    <div class="STYLE3" id="div_4">User Login</div>
    </div>
	  
	  <div id="div_5">
	  	
		<form action="LoginHandleServlet" method="post">
		<%
		if ("error".equals(resulttype)){
			%>
				<div id="div_15" class="result_1" ><span id="span_hint">Incorrect!Try again!</span></div>
			<%
		}else if("none".equals(resulttype)){
			%>
			<div id="div_15" class="result_1" ><span id="span_hint">Login first please!</span></div>
		<%
		}else if("logged".equals(resulttype)){
			%>
			<div id="div_15" class="result_1" ><span id="span_hint">Logged elsewhere!</span></div>
		<%
		}
		
		%>
		
		<div id="div_6">
			<div id="div_7"><span class="STYLE4">User Name</span></div>
			<div id="div_8"><input class="input1" type="text" name="username" onclick="emptyhint()" /></div>
		</div>
		<div id="div_9">
			<div id="div_10"><span class="STYLE4">Password</span></div>
			<div id="div_11"><input class="input2" type="password" name="password" onclick="emptyhint()" /></div>
		</div>
			<div id="div_12">
			<div id="div_13"><input class="input3" height="8mm" width="15mm" type="submit" name="submit" value="Login" /></div>
			<div id="div_14"><input class="input4" type="reset" name="reset" value="ReSet" /></div>
		</div>
		</form>
	  </div>
  </div>
	
</div>


</div>
</body>
</html>