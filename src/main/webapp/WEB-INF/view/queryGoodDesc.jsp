<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/7
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <script type="text/javascript" src="js/common.js"></script>

  <link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
  <script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
  <script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

</head>
<body>
<form id="GoodForm" class="itemForm" method="post">
  <input type="hidden"  name="goodID" value="${us.goodID}"/>
<textarea style="width:400px;height:600px;"  name="goodDesc" >${us.goodDesc}</textarea>
</form>
</body>

</html>
