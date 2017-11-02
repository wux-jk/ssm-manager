<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/31 0031
  Time: 上午 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html>--%>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="js/common.js"></script>

    <link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>

</head>
<body>


<div style="padding:10px 10px 10px 10px">
<form id="upGoodForm">
    <input type="hidden"  name="goodID" value="${us.goodID}"/><br/>
  <table >

      <tr>
          <td>商品名称:</td>
          <td><input class="easyui-textbox" type="text" name="goodName" value="${us.goodName}"  style="width: 150px;"/></td>
      </tr>

      <tr>
          <td>商品编号:</td>
          <td>
              <input class="easyui-textbox" type="text" name="goodNumber" value="${us.goodNumber}" />
          </td>
      </tr>


      <tr>
          <td>商品价格:</td>
          <td><input class="easyui-numberbox" type="text" name="goodPrice" value="${us.goodPrice}" />
              <input type="hidden" name="goodPrice"/>
          </td>
      </tr>
      <tr>
          <td>库存数量:</td>
          <td><input class="easyui-numberbox" type="text" name="goodStock" value="${us.goodStock}" /></td>
      </tr>
     <%-- <tr>
          <td>商品图片:</td>
          <td>
              <a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">上传图片</a>
              <input type="hidden" name="image"/>
          </td>
      </tr>--%>
<%--
     <tr>
          <td>商品描述:</td>
          <td>
              <textarea style="width:800px;height:300px;visibility:hidden;"  id="goodDesc" name="goodDesc" ></textarea>
          </td>
      </tr>--%>

  </table>
</form>
</div>
</body>
</html>
