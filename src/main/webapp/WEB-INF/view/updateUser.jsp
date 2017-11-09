<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/9 0009
  Time: 下午 3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form id="upUserForm" class="itemForm" method="post">
  <input type="hidden"  name="userID" value="${user.userID}"/><br/>
  <table >

    <tr>
      <td>用户名:</td>
      <td><input class="easyui-textbox" type="text" name="userName" value="${user.userName}"  style="width: 150px;"/></td>
    </tr>
    <tr>
      <td>密码:</td>
      <td><input class="easyui-textbox" type="password" name="userPassword" value="${user.userPassword}"  style="width: 150px;"/></td>
    </tr>


  </table>
</form>
</body>
</html>
