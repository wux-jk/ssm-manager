//解决ajax重定向
$.ajaxSetup({
	//设置ajax请求结束后的执行动作
	complete:function(XMLHttpRequest, textStatus) {
		// 通过XMLHttpRequest取得响应头，sessionstatus
		var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
		if (sessionstatus == "TIMEOUT") {
			var win = window;
			while (win != win.top){
				win = win.top;
			}
			win.location.href= XMLHttpRequest.getResponseHeader("CONTEXTPATH");
		}
	}
});

$(document).ajaxComplete(function(event, xhr, settings) {
	if(xhr.getResponseHeader("sessionstatus")=="timeOut"){
		if(xhr.getResponseHeader("loginPath")){
			alert("会话过期，请重新登陆!");
			window.location.replace(xhr.getResponseHeader("loginPath"));
		}else{
			alert("请求超时请重新登陆 !");
		}
	}
});