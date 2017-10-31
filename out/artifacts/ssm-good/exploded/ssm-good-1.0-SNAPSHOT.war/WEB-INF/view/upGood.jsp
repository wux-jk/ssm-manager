<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/31 0031
  Time: 上午 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
  <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
  <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
</head>
<body>
<div style="padding:10px 10px 10px 10px">
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
          <td>商品描述:</td>
          <td>
              <textarea style="width:800px;height:300px;visibility:hidden;" name="goodDesc" value="${us.goodDesc}" ></textarea>
          </td>
      </tr>




  </table>
</form>
</div>
</body>

<script type="text/javascript">

    var itemAddEditor ;
    //页面初始化完毕后执行此方法
    $(function(){
        //创建富文本编辑器
        itemAddEditor = E3.createEditor("#itemAddForm [name=goodDesc]");
        //初始化类目选择和图片上传器

    });

</script>
</html>
