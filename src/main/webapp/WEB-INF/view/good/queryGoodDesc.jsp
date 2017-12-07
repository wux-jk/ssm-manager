<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/7
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <title></title>
  <script type="text/javascript" src="js/common.js"></script>

  <link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
  <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
  <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>

</head>


<textarea style="width:100px;height:800px;visibility:hidden;"  id="product_Desc" name="product_Desc">${us.product_Desc}</textarea>

<script>
  var itemEditEditor_desc ;
  $(function(){
    //实例化编辑器
    itemEditEditor_desc = E3.createEditor("#product_Desc");
    itemEditEditor_desc.readonly(true);
  });
</script>



