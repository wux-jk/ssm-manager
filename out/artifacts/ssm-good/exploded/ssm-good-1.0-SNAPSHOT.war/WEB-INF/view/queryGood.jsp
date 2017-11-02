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
<%--  <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
  <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>--%>

</head>
<body>
<div id="p" class="easyui-panel" title="搜索"
     style="width:750px;padding:10px;background:#fafafa;"
     data-options="iconCls:'icon-save',closable:true,collapsible:true,minimizable:true,maximizable:true">


  <table cellpadding="5px">
    <tr>
      <td>商家:</td>
      <td>
        <select class="easyui-combobox" data-options="panelHeight:'auto',editable:false,valueField:'bid',textField:'brandName',width:130"  name="goodType">
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


<!--数据表格的工具栏  -->
<%--<div id="tb">
  &lt;%&ndash;<a href="javascript:void(0);"   class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="dialog('<%=request.getContextPath()%>/product!dialogProduct.html')">添加</a>&ndash;%&gt;

   <table>

      <tr>
        <td><button onclick="updateGood();" class="easyui-linkbutton" iconCls="icon-edit" plain="true" >编辑</button></td>
        <td><button onclick="deleteProducts();" class="easyui-linkbutton" iconCls="icon-remove" plain="true"  >删除</button></td>
        <td><button onclick="refresh();" class="easyui-linkbutton" iconCls="icon-remove" plain="true"  >刷新</button></td>
      </tr>
    </table>

</div>--%>
<div id="tb">
<%--  <a href="javascript:void(0);"   class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="dialog('<%=request.getContextPath()%>/product!dialogProduct.html')">添加</a>--%>
  <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" plain="true"  onclick="updateGood();">编辑</a>
  <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" plain="true"   onclick="deleteProducts();">批量删除</a>
  <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="refresh();" >刷新</a>
</div>

 <!--table  表格 -->
<div><table id="goodTable"></table></div>


<!--  对话框  -->
<div id="divGood"></div>


<script type="text/javascript">
  function searchGood(){
    //条查
      var goodType=$("[name='goodType']").val();

      var goodNumber=$("[name='goodNumber']").val();

    $('#goodTable').datagrid({
      url: "/good/queryGoodList.jhtml",
      fitColumns: true,
      pagination: true,
      queryParams: {
        goodType: goodType,
        goodNumber: goodNumber,
      },
      columns:[[
        {field:'ckecked',checkbox:true},
        {field:'goodID',title:'ID',width:30,align:'center'},
        {field:'goodName',title:'商品名称',width:50,align:'center'},
        {field:'goodNumber',title:'商品编号',width:30,align:'center'},
        {field:'goodPrice',title:'商品价格',width:35,align:'center'},
        {field:'goodStock',title:'商品库存',width:30,align:'center'},
        {field:'goodDesc',title:'商品描述',width:50,align:'center'},
        {field:'goodStatus',title:'状态',width:20,align:'center', },
        {field:'goodType',title:'商家',width:20,align:'center',
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



  //---------------------------------------------------------------------------------
  //编辑
  function updateGood(){

    var selectedRows = $("#goodTable").datagrid("getSelections");
    if (selectedRows.length != 1) {
      $.messager.alert("系统提示", "请选择一条要编辑的数据！");
      return;
    }
    var id = selectedRows[0].goodID;

    alert(id)
    /*location.href="<%=request.getContextPath()%>/good/findGoodByid.jhtml?goodID='+id,*/
    //  调用  dialog
 $('#divGood').dialog({
     title: '修改',
     width: 1000,
   height:500,
     closed: false,
     cache: false,
     href:'/good/findGoodByid.jhtml?goodID='+id,

     modal: true,
     buttons:[{
     text:'保存',
     iconCls:"icon-ok",
     handler:function(){
     $.ajax({
     type:"post",
      url:'<%=request.getContextPath()%>/good/updateGood.jhtml',
     data:$("#upGoodForm").serialize(),
     success:function (msg){
     $.messager.alert('我的消息','修改成功！','info');
     $("#divGood").dialog("close");
     searchGood();
     }
     });
     }
     },{
     text:'关闭',
     iconCls:"icon-no",
     handler:function(){
     $('#divGood').dialog('close');
     }
     }]

     });
     $("#goodTable").datagrid('reload');

  }
</script>

</body>

</html>
