<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../js/jquery.min.js"></script>
<title>资和信商品后台管理</title>
<style type="text/css">
html{    
    width: 100%;    
    height: 100%;    
    overflow: hidden;    
    font-style: sans-serif;    
}    
body{    
    width: 100%;    
    height: 100%;    
    font-family: 'Open Sans',sans-serif;    
    margin: 0;    
    background-color: #orange;    
}    
#login{    
    position: absolute;    
    top: 50%;    
    left:50%;    
    margin: -150px 0 0 -150px;    
    width: 300px;    
    height: 300px;    
}    
#login h1{    
    color: #red;    
    text-shadow:0 0 10px;    
    letter-spacing: 1px;    
    text-align: center;    
}    
h1{    
    font-size: 2em;    
    margin: 0.67em 0;    
}    
input{    
    width: 278px;    
    height: 18px;    
    margin-bottom: 10px;    
    outline: none;    
    padding: 10px;    
    font-size: 13px;    
    color: #red;    
    text-shadow:1px 1px 1px;    
    border-top: 1px solid #312E3D;    
    border-left: 1px solid #312E3D;    
    border-right: 1px solid #312E3D;    
    border-bottom: 1px solid #56536A;    
    border-radius: 4px;    
    background-color: #orange;    
}    
.but{    
    width: 300px;    
    min-height: 35px;    
    display: block;    
    background-color: #orange;    
    border: 1px solid #pink;    
    color: #red;    
    padding: 9px 14px;    
    font-size: 15px;    
    line-height: normal;    
    border-radius: 5px;    
    margin: 0;    
}   
</style>
</head>
<body style="background:url('../img/3.jpg') repeat;">
	<div id="login">   
		<h1>登录</h1>   
		<table>
			<tr>
				<td>
					<input type="text" id="userName" placeholder="用户名" />
				</td>
			</tr>   
			<tr>
				<td>
					<input type="password" id="userPassword"  placeholder="密码" />
				</td>

		</table>   
		<input type="button" class="but" onclick="landing()" value="登录">  
    </div>   
</body>
<script type="text/javascript">
	//登录
	function landing(){
		var userName=$("#userName").val();
		if(userName==""){
			alert("用户名不能为空")
			return;
		}
		var userPassword=$("#userPassword").val();
		if(userPassword==""){
			alert("密码不能为空")
			return;
		}

		$.ajax({
			url:"/login/LoginAuthentication.jhtml",
			type:'post',
			data:{
				userName:userName,
				userPassword:userPassword,
			},
			datatype:'json',
			success:function(data){
				if(data.falg==1){
				/*	alert("登录成功")*/
					location.href="tree.jsp";
				}
				else if(data.falg==2){
					alert("用户不存在")
				}else{
					alert("密码错误");
				}
			}
		})


	}
	//回车登录
	$(document).keypress(function(e) {
	       var eCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
	        if (eCode == 13){
	        	landing();
	        }
	});
</script>

</html>