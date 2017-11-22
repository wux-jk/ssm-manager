<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/15 0015
  Time: 下午 3:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

  <link rel="stylesheet" type="text/css" href="css/default.css" />
  <link rel="stylesheet" type="text/css" href="js/jquery-easyui/themes/icon.css" />
  <script type="text/javascript" src="js/jquery-easyui.jquery.min.js"></script>
  <script type="text/javascript" src="js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
  <style>
    .fl {
      float: left;
    }
    div {

      display:inline-block ;

    }
    .clear:after {
      content: '';
      display: block;
      clear: both;
    }

  </style>
</head>
<body>

<div id="p" class="easyui-panel" title="搜索"
     style="width:750px;padding:10px;background:#fafafa;"  data-options="iconCls:'icon-save',closable:true,collapsible:true,minimizable:true,maximizable:true">
  <table cellpadding="5px">
    <tr>
      <td>供应商:</td>
      <td>
        <select class="easyui-combobox" data-options="panelHeight:'auto',editable:false,valueField:'bid',textField:'brandName',width:130"  name="channel_ID">
          <option value="0">--请选择--</option>
          <option value="1">京东</option>
          <option value="2">麦德龙</option>
        </select>
      </td>
      <td>商品编号SKU:</td>
      <td><input class="easyui-textbox" name="channel_SKU"  data-options="iconCls:'',prompt:'请输入编号SKU'" style="width:100px"> </td>
      <td width="100px"><button onclick="searchGoodType()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</button></td>
    </tr>

  </table>
</div>


<div id="divGood" style="display: none">
<!-- 左边表-->
  <div id="gengduo" class="div-inline fl" style="float: left; margin: 20px 0 0 20px;" >
      <form>
          <table border="1">
            <tr>
              <td>供应商的sku:</td>
              <td><input class="easyui-textbox" type="text" name="channel_SKU"   style="width: 150px;"/></td>
            </tr>
             <tr>
              <td>商品名称:</td>
              <td><input class="easyui-textbox" type="text" name="name" style="width: 150px;"/></td>
            </tr>
            <tr>
              <td>商品品牌:</td>
              <td>
                <input class="easyui-textbox" type="text" name="brand_Name"  />
              </td>
            </tr>
            <tr>
              <td>重量:</td>
              <td>
                <input class="easyui-numberbox" type="text" name="weight"  />
              </td>
            </tr>
            <tr>
              <td>协议价:</td>
              <td><input class="easyui-numberbox" type="text" name="agreement_Price" />
                <input type="hidden" name="agreement_Price"/>
              </td>
            </tr>
            <tr>
              <td>供应商售卖价:</td>
              <td><input class="easyui-numberbox" type="text" name="sale_Price"  />
                <input type="hidden" name="sale_Price"/>
              </td>
            </tr>
            <%--<tr>
              <td>主图:</td>
              <td><input class="easyui-textbox" type="text" name="descRiption"  /></td>
            </tr>--%>
            <tr>
              <td>商品描述（详情）:</td>
              <td>
                <input type="button" value="查看" class="btn btn-info" onclick="findGoodDesc()"/>
              </td>
            </tr>
          </table>
      </form>
  </div>

  <div id="gengduo1" class="div-inline fl" style="float: left; margin: 20px 0 0 20px;">
    <!-- 这个右  表单是回显数据-->
     <form>
       <input type="hidden"  name="id" value="${id}"/>
       <table border="1">
         <tr>
           <td>ZHXSKU:</td>
           <td><input class="easyui-textbox" type="text" id="ssssssss_11" name="goodName" value="${us.goodName}"  style="width: 150px;"/></td>
         </tr>
         <tr>
           <td>商品名称:</td>
           <td><input class="easyui-textbox" type="text" name="goodName" value="${us.goodName}"  style="width: 150px;"/></td>
         </tr>
         <tr>
           <td>品牌:</td>
           <td>
             <input class="easyui-textbox" type="text" name="goodNumber" value="${us.goodNumber}" />
           </td>
         </tr>
        <%-- <tr>
           <td>主图:</td>
           <td>
             <input class="easyui-textbox" type="text" name="goodNumber" value="${us.goodNumber}" />
           </td>
         </tr>--%>

         <tr>
           <td>协议价:</td>
           <td>
             <input class="easyui-numberbox" type="text" name="goodPrice" value="${us.goodPrice}" />
             <input type="hidden" name="goodPrice"/>
           </td>
         </tr>
         <tr>
           <td>供应商售卖价:</td>
           <td>
             <input class="easyui-numberbox" type="text" name="goodPrice" value="${us.goodPrice}" />
             <input type="hidden" name="goodPrice"/>
           </td>
         </tr>
         <tr>
           <td>重量:</td>
           <td>
             <input class="easyui-numberbox" type="text" name="weight"  />
             <input type="hidden" name="goodPrice"/>
           </td>
         </tr>
         <tr>
           <td>商品详情:</td>
           <td> <input type="button" value="查看" class="btn btn-info" onclick="findGoodDesc()"/></td>
         </tr>
         <tr align="center">
           <td colspan="2">
             <input  type="button" value="导入资和信商品库" onclick="sumitGood()" />
           </td>
         </tr>
       </table>
       </form>
  </div>

</div>



<script type="text/javascript">

  function searchGoodType() {
    //d当触发查询按钮事件  显示表格
      $("#divGood").show();
       var channel_ID=$("[name='channel_ID']").val();
    alert(1111);
       var channel_SKU=$("[name='channel_SKU']").val();
      $.ajax({
          url:"/good/queryGoodList.jhtml",
         data:{"channel_ID":channel_ID,"channel_SKU":channel_SKU},
         type:"post",
         success:function(msg){
           $("#ssssssss_11").textbox('setText', "啦啦啦啦啦");

           }
       })

   }
//---------------------------------------------

function sumitGood(){
  $.ajax({
    type:"post",
    url:'/good/findGoodpro.jhtml',
   /* data:$("#userForm").serialize()||$("#userForm").serialize(),*/
    success:function (msg){
      /*$.messager.alert('我的消息','添加成功！','info');
      $("#divUser").dialog("close");
      $("#show-user").datagrid('reload');*/

    }
  });
}


</script>
</body>
</html>
