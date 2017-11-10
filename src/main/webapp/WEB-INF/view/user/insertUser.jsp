<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/9 0009
  Time: 下午 4:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form class="user_form" id="userForm">
  <div class="easyui-panel" style="padding:30px 60px;">
    <div class="input_container">
      <input class="easyui-textbox" label="用户名：" labelPosition="top"  name="userName" data-options="prompt:'请输入用户名',iconCls:'icon-man'" style="width:100%;height:40px">
    </div>
    <div class="input_container">
      <input class="easyui-textbox" label="密码：" labelPosition="top"  name="userPassword" data-options="prompt:'请输入密码',iconCls:'icon-lock'" style="width:100%;height:35px">
    </div>

  </div>
</form>

</body>
</html>
