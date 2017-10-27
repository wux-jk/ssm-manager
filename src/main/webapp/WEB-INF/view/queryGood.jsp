<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/26 0026
  Time: 下午 4:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
  <link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet"/>
  <link rel="stylesheet" type="text/css" href="css/default.css" />
  <link rel="stylesheet" type="text/css" href="js/jquery-easyui/themes/icon.css" />
  <script type="text/javascript" src="js/jquery-easyui.jquery.min.js"></script>
  <script type="text/javascript" src="js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
  <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
  <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>

</head>
<body>
<div id="p" class="easyui-panel" title="搜索"
     style="width:750px;padding:10px;background:#fafafa;"
     data-options="iconCls:'icon-save',closable:true,collapsible:true,minimizable:true,maximizable:true">


  <table cellpadding="5px">
    <tr>
      <td>商家:</td>
      <td>
        <select class="easyui-combobox" data-options="panelHeight:'auto',editable:false,valueField:'bid',textField:'brandName',width:130"  name="goodName">
          <option value="0">--请选择--</option>
          <option value="1">京东</option>
          <option value="2">麦德龙</option>
        </select>
      </td>
      <td>商品编号:</td>
      <td><input class="easyui-textbox" name="goodNumber" name="product.pro_name" data-options="iconCls:'',prompt:'请输入编号'" style="width:100px"> </td>
      <td width="100px"><button onclick="searchGood()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</button></td>


    </tr>
  </table>
</div>

<div><table id="goodTable"></table></div>

<script type="text/javascript">
  function searchGood(){
      var goodName=$("[name='goodName']").val();
      var goodNumber=$("[name='goodNumber']").val();

    $('#goodTable').datagrid({
      url: "/good/queryGoodList.jhtml",
      fitColumns: true,
      pagination: true,
      queryParams: {
        goodName: goodName,
        goodNumber: goodNumber,
      },
      columns:[[
        {field:'ckecked',checkbox:true},
        {field:'goodID',title:'ID',width:100,align:'center'},
        {field:'goodName',title:'商品名称',width:100,align:'center'},
        {field:'goodNumber',title:'商品编号',width:100,align:'center'},
        {field:'goodPrice',title:'商品价格',width:100,align:'center'},
        {field:'goodStock',title:'商品库存',width:100,align:'center'},
        {field:'goodType',title:'商家',width:100,align:'center',
          formatter: function(value,row,index){
            if(row.goodType == 1){
              return '京东';
            }else if(row.goodType == 2){
              return '麦德龙';
            }
          }
        },

      ]]




    })
  }
</script>

</body>

</html>
