function empty(node,spanname){
	var oSpanNode = document.getElementById(spanname);
	oSpanNode.innerHTML = "";
}
function checkgroupname(node){
	
	var reg = /^[A-Za-z]{1,}[_]?[A-Za-z0-9]*$/;
	if(reg.test(node.value)&&node.value.length>=2&&node.value.length<=20){
		var oSpanNode = document.getElementById("span_groupname");
		oSpanNode.innerHTML = "OK";
		oSpanNode.style.color='green';
	}else if(node.value.length==0){
		var oSpanNode = document.getElementById("span_groupname");
		oSpanNode.innerHTML = "";
	}else{
		var oSpanNode = document.getElementById("span_groupname");
		oSpanNode.innerHTML = "Non-Standard!";
		oSpanNode.style.color='red';
	}
}