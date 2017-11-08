<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/31 0031
  Time: 上午 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript" src="js/common.js"></script>

<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>


<div style="padding:10px 10px 10px 10px">
<form id="upGoodForm" class="itemForm" method="post">
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


     <tr>
          <td>商品描述:</td>
          <td>
              <textarea style="width:100px;height:600px;visibility:hidden;" id="desc" name="goodDesc">${us.goodDesc}</textarea>
          </td>
      </tr>

  </table>
</form>
</div>

<script>
var itemEditEditor ;
$(function(){
//实例化编辑器
itemEditEditor = E3.createEditor("#upGoodForm [name=goodDesc]");
});
</script>

