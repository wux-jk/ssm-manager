<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui/themes/gray/easyui.css" />
<link rel="stylesheet" type="text/css" href="js/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="css/e3.css" />
<link rel="stylesheet" type="text/css" href="css/default.css" />
	<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-easyui/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>

	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
	<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>

	<style type="text/css">
	.content {
		padding: 10px 10px 10px 10px;
	}
	</style>


</head>
<body class="easyui-layout">
    <!-- 头部标题 -->
	<div data-options="region:'north',border:false" style="height:60px; padding:5px; background:#F3F3F3"> 
		<center><span class="northTitle">商品后台管理系统</span></center>
	    <span class="loginInfo">登录用户：admin&nbsp;&nbsp;角色：系统管理员</span>
	</div>
    <div data-options="region:'west',title:'菜单',split:true" style="width:180px;">
    	<ul id="menu" class="easyui-tree" style="margin-top: 10px;margin-left: 5px;">
         	<li>
         		<span>商品管理</span>
         		<ul>
					<li data-options="attributes:{'url':'edit.jhtml'}">商品查询</li>
	         		<li data-options="attributes:{'url':'item-add'}">新增商品</li>
		      	</ul>
			</li>
         </ul>
    </div>

    <div data-options="region:'center',title:''">
    	<div id="tabs" class="easyui-tabs">
		    <div title="首页" style="padding:20px;">
		        	
		    </div>
		</div>
    </div>
    <!-- 页脚信息 -->
	<div data-options="region:'south',border:false" style="height:20px; background:#F3F3F3; padding:2px; vertical-align:middle;">
		<span id="sysVersion">系统版本：V5.0</span>
	    <span id="nowTime"></span>
	</div>
<script type="text/javascript">
$(function(){
	$('#menu').tree({
		onClick: function(node){
			if($('#menu').tree("isLeaf",node.target)){
				var tabs = $("#tabs");
				var tab = tabs.tabs("getTab",node.text);
				if(tab){
					tabs.tabs("select",node.text);
				}else{
					tabs.tabs('add',{
					    title:node.text,
					    href: node.attributes.url,
					    closable:true,
					    bodyCls:"content"
					});
				}
			}
		}
	});
});
setInterval("document.getElementById('nowTime').innerHTML=new Date().toLocaleString()+'星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
</script>
</body>
</html>