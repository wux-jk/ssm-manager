<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/31 0031
  Time: 上午 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>


</head>
<body>


<div style="padding:10px 10px 10px 10px" id="editor" >
<form id="itemeEditForm" class="itemForm" method="post">
  <table >
      <input type="hidden"  name="goodID"/><br/>

      <tr>
          <td>商品名称:</td>
          <td><input class="easyui-textbox" type="text" name="goodName" value="${us.goodName}" data-options="required:true" style="width: 150px;"/></td>
      </tr>

      <tr>
          <td>商品编号:</td>
          <td>
              <input class="easyui-textbox" type="text" name="goodNumber" value="${us.goodNumber}" data-options="validType:'length[1,30]'" />
          </td>
      </tr>


      <tr>
          <td>商品价格:</td>
          <td><input class="easyui-numberbox" type="text" name="goodPrice" value="${us.goodPrice}" data-options="min:1,max:99999999,precision:2,required:true" />
              <input type="hidden" name="goodPrice"/>
          </td>
      </tr>
      <tr>
          <td>库存数量:</td>
          <td><input class="easyui-numberbox" type="text" name="goodStock" value="${us.goodStock}" data-options="min:1,max:99999999,precision:0,required:true" /></td>
      </tr>
      <tr>
          <td>商品图片:</td>
          <td>
              <a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">上传图片</a>
              <input type="hidden" name="image"/>
          </td>
      </tr>

     <%-- <tr>
          <td>商品描述:</td>
          <td>
              <textarea style="width:800px;height:300px;visibility:hidden;"  id="myEditor" name="goodDesc" >123</textarea>
          </td>
      </tr>--%>
      <script type="text/plain" id="myEditor" name="myEditor"></script>

      <script type="text/javascript">
          var ue = UE.getEditor('myEditor');
      </script>
  </table>
</form>
</div>
</body>



</html>
