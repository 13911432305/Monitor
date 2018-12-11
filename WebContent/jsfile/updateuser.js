window.onload = function(){
	handleAll();
}
	
function handleAll(){
	var oInputNode1 = document.getElementsByName("username")[0];
	var oInputNode2 = document.getElementsByName("password")[0];
	var oInputNode3 = document.getElementsByName("repassword")[0];
	var oInputNode4 = document.getElementsByName("realname")[0];
	var oInputNode5 = document.getElementsByName("phone")[0];
	var oInputNode6 = document.getElementsByName("mail")[0];
	var reg1 = /^[A-Za-z]{1,}[_]?[A-Za-z0-9]*$/;
	if(reg1.test(oInputNode1.value)&&oInputNode1.value.length>=2&&oInputNode1.value.length<=20){
		var oSpanNode = document.getElementById("span_username");
		oSpanNode.innerHTML = "OK";
		oSpanNode.style.color='green';
	}else if(node.value.length==0){
		var oSpanNode = document.getElementById("span_username");
		oSpanNode.innerHTML = "";
	}else{
		var oSpanNode = document.getElementById("span_username");
		oSpanNode.innerHTML = "Non-Standard!";
		oSpanNode.style.color='red';
	}
	
	var reg2 = /^[A-Za-z]{1,}[_]?[A-Za-z0-9]*$/;
	if(reg2.test(oInputNode2.value)&&oInputNode2.value.length>=8&&oInputNode2.value.length<=16){
		var oSpanNode = document.getElementById("span_password");
		oSpanNode.innerHTML = "OK";
		oSpanNode.style.color='green';
		//oInputNode3.disabled="";
	}else if(node.value.length==0){
		var oSpanNode = document.getElementById("span_password");
		oSpanNode.innerHTML = "";
	}else{
		var oSpanNode = document.getElementById("span_password");
		oSpanNode.innerHTML = "Non-Standard!";
		oSpanNode.style.color='red';
	}
	if(oInputNode2.value==oInputNode3.value){
			var oSpanNode = document.getElementById("span_repassword");
			oSpanNode.innerHTML = "OK";
			oSpanNode.style.color='green';
	}else if(node.value.length==0){
		var oSpanNode = document.getElementById("span_repassword");
		oSpanNode.innerHTML = "";
	}else{
		var oSpanNode = document.getElementById("span_repassword");
		oSpanNode.innerHTML = "!=password";
		oSpanNode.style.color='red';
	}
	
	var reg4=/[\u4E00-\u9FA5]/g;
	if(reg4.test(oInputNode4.value)&&oInputNode4.value.length>=2&&oInputNode4.value.length<=4){
		var oSpanNode = document.getElementById("span_realname");
		oSpanNode.innerHTML = "OK";
		oSpanNode.style.color='green';
	}else if(node.value.length==0){
		var oSpanNode = document.getElementById("span_realname");
		oSpanNode.innerHTML = "";
	}else{
		var oSpanNode = document.getElementById("span_realname");
		oSpanNode.innerHTML = "Non-Standard!";
		oSpanNode.style.color='red';
	}
	var reg5=/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/g;
	if(reg5.test(oInputNode5.value)&&oInputNode5.value.length==11){
		var oSpanNode = document.getElementById("span_phone");
		oSpanNode.innerHTML = "OK";
		oSpanNode.style.color='green';
	}else if(node.value.length==0){
		var oSpanNode = document.getElementById("span_phone");
		oSpanNode.innerHTML = "";
	}else{
		var oSpanNode = document.getElementById("span_phone");
		oSpanNode.innerHTML = "Non-Standard!";
		oSpanNode.style.color='red';
	}
	var reg6=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/g;
	if(reg6.test(oInputNode6.value)){
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
function checkAll(){
		var oSpanNode1 = document.getElementById("span_username");
		var oSpanNode2 = document.getElementById("span_password");
		var oSpanNode3 = document.getElementById("span_repassword");
		var oSpanNode4 = document.getElementById("span_realname");
		var oSpanNode5 = document.getElementById("span_phone");
		var oSpanNode6 = document.getElementById("span_mail");
		
		if(oSpanNode1.innerHTML!="OK"||oSpanNode2.innerHTML!="OK"||oSpanNode3.innerHTML!="OK"||oSpanNode4.innerHTML!="OK"||oSpanNode5.innerHTML!="OK"||oSpanNode6.innerHTML!="OK"){
			var oSpanNode = document.getElementById("span_submit");
			oSpanNode.innerHTML = "Not-All-Standard!";
			oSpanNode.style.color='red';
			return false;
		}else{
			return true;
		}
	}
	function empty(node,spanname){
		var oSpanNode = document.getElementById(spanname);
		oSpanNode.innerHTML = "";
	}
	function checkusername(node){
		
		var reg = /^[A-Za-z]{1,}[_]?[A-Za-z0-9]*$/;
		if(reg.test(node.value)&&node.value.length>=2&&node.value.length<=20){
			var oSpanNode = document.getElementById("span_username");
			oSpanNode.innerHTML = "OK";
			oSpanNode.style.color='green';
		}else if(node.value.length==0){
			var oSpanNode = document.getElementById("span_username");
			oSpanNode.innerHTML = "";
		}else{
			var oSpanNode = document.getElementById("span_username");
			oSpanNode.innerHTML = "Non-Standard!";
			oSpanNode.style.color='red';
		}
	}
	function checkpassword(node){
		 
		var reg = /^[A-Za-z]{1,}[_]?[A-Za-z0-9]*$/;
		if(reg.test(node.value)&&node.value.length>=8&&node.value.length<=16){
			var oSpanNode = document.getElementById("span_password");
			oSpanNode.innerHTML = "OK";
			oSpanNode.style.color='green';
		}else if(node.value.length==0){
			var oSpanNode = document.getElementById("span_password");
			oSpanNode.innerHTML = "";
		}else{
			var oSpanNode = document.getElementById("span_password");
			oSpanNode.innerHTML = "Non-Standard!";
			oSpanNode.style.color='red';
		}
	}
	function checkrepassword(node){
		var reg = /^[A-Za-z]{1,}[_]?[A-Za-z0-9]*$/;
		var oInputNode1 = document.getElementsByName("password")[0];
		var oInputNode2 = node;
		
		if(node.value.length==0){
			var oSpanNode = document.getElementById("span_repassword");
			oSpanNode.innerHTML = "";
		}else {
			if(oInputNode1.value==oInputNode2.value){
				if(reg.test(node.value)&&node.value.length>=8&&node.value.length<=16){
					var oSpanNode = document.getElementById("span_repassword");
					oSpanNode.innerHTML = "OK";
					oSpanNode.style.color='green';
				}
			}else{
			var oSpanNode = document.getElementById("span_repassword");
			oSpanNode.innerHTML = "!=password";
			oSpanNode.style.color='red';
			}
		}
	}
	function checkrealname(node){
		 
		var reg=/[\u4E00-\u9FA5]/g;
		if(reg.test(node.value)&&node.value.length>=2&&node.value.length<=4){
			var oSpanNode = document.getElementById("span_realname");
			oSpanNode.innerHTML = "OK";
			oSpanNode.style.color='green';
		}else if(node.value.length==0){
			var oSpanNode = document.getElementById("span_realname");
			oSpanNode.innerHTML = "";
		}else{
			var oSpanNode = document.getElementById("span_realname");
			oSpanNode.innerHTML = "Non-Standard!";
			oSpanNode.style.color='red';
		}
	}
	function checkphone(node){
		 
		var reg=/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/g;
		if(reg.test(node.value)&&node.value.length==11){
			var oSpanNode = document.getElementById("span_phone");
			oSpanNode.innerHTML = "OK";
			oSpanNode.style.color='green';
		}else if(node.value.length==0){
			var oSpanNode = document.getElementById("span_phone");
			oSpanNode.innerHTML = "";
		}else{
			var oSpanNode = document.getElementById("span_phone");
			oSpanNode.innerHTML = "Non-Standard!";
			oSpanNode.style.color='red';
		}
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
	function checkon(node){
			var reg = /^[A-Za-z]{1,}[_]?[A-Za-z0-9]*$/;
			//alert(node.value);
			if(reg.test(node.value)&&node.value.length>=8&&node.value.length<=16){
				var oInputNode1 = document.getElementsByName("repassword")[0];
				oInputNode1.disabled="";
			}
	}
	function checkoff(node){
		var reg = /^[A-Za-z]{1,}[_]?[A-Za-z0-9]*$/;
		//alert(node.value);
		if(reg.test(node.value)&&node.value.length>=8&&node.value.length<=16){
			
		}else{
			var oInputNode1 = document.getElementsByName("repassword")[0];
			oInputNode1.disabled="disabled";
		}
	}
	