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
<%--  <link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">--%>
  <link rel="stylesheet" type="text/css" href="css/default.css" />
  <link rel="stylesheet" type="text/css" href="js/jquery-easyui/themes/icon.css" />
  <script type="text/javascript" src="js/jquery-easyui.jquery.min.js"></script>
  <script type="text/javascript" src="js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>

  <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
  <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
  <script type="text/javascript" src="js/common.js"></script>


</head>
<body>
<div id="p" class="easyui-panel" title="搜索"
     style="width:750px;padding:10px;background:#fafafa;"
     data-options="iconCls:'icon-save',closable:true,collapsible:true,minimizable:true,maximizable:true">


  <table cellpadding="5px">
    <tr>
      <td>供应商:</td>
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

<div id="tb">
<%--  <a href="javascript:void(0);"   class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="dialog('<%=request.getContextPath()%>/product!dialogProduct.html')">添加</a>--%>
  <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" plain="true"  onclick="updateGood();">编辑</a>
  <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="putawayGood();">上架</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="soldGood();">下架</a>
  <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="refresh();" >刷新</a>
</div>

 <!--table  表格 -->
<div><table id="goodTable"></table></div>



<!-- 预览商品弹框-->
<div id="goodDesc"></div>
<!--  修改页面对话框  -->
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
        {field:'ckecked',checkbox:true,name:'check'},
        {field:'goodID',title:'ID',width:30,align:'center'},
        {field:'goodName',title:'商品名称',width:50,align:'center'},
        {field:'goodNumber',title:'商品编号',width:30,align:'center'},
        {field:'goodPrice',title:'商品价格',width:35,align:'center'},
        {field:'goodStock',title:'商品库存',width:30,align:'center'},
        {field:'goodStatus',title:'状态',width:20,align:'center',
            formatter: function(value,row,index){
                if(row.goodStatus == 1){
                    return '草稿';
                }else if(row.goodStatus == 2){
                    return '上架';
                }else{
                    return '失效';
                }
            }
        },
        {field:'goodType',title:'商家',width:20,align:'center',
          formatter: function(value,row,index){
            if(row.goodType == 1){
              return '京东';
            }else if(row.goodType == 2){
              return '麦德龙';
            }
          }
        }, {field:'crud',title:'操作',width:20,align:'center',
          formatter: function (value,row,index){
            var str = '<input type="button" value="预览商品" class="btn btn-info" onclick="findGoodDesc(\''+row.goodID+'\')"/>';
            return str;


          }
        }


      ]]


    })
  }

//========================



//---------------------------------

  //---------------------------------------------------------------------------------
  //编辑



  function updateGood(){
      var selectedRows = $("#goodTable").datagrid("getSelections");
      if (selectedRows.length != 1) {
          $.messager.alert("系统提示", "请选择一条要编辑的数据！");
          return;
      }
      var id = selectedRows[0].goodID;
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
                  ($("#desc").val()); //获取修改页面的desc的id选择器
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



  //----------------------------------

  //商品上架
  function putawayGood(){

      var selectedRow = $("#goodTable").datagrid("getSelections");
     if (selectedRow.length != 1) {
          $.messager.alert("系统提示", "请选择一条要操作的数据！");
         return;
      }
      var goodID = selectedRow[0].goodID;
      var goodStatus = selectedRow[0].goodStatus;
      alert(goodStatus)
      if(goodStatus != 2) {
          $('#divGood').dialog({
              title: '上架',
              width: 300,
              height: 300,
              closed: false,
              cache: false,
              href: '/good/toPutawayGood.jhtml',
              modal: true,
              buttons: [{
                  text: '确定上架',
                  iconCls: "icon-ok",
                  handler: function () {
                      $.ajax({
                          type: "post",
                          url: '/good/upGoodStock.jhtml',
                          data: {"goodStatus":goodStatus,},
                          success: function (msg) {

                              $.messager.alert('我的消息', '上架成功！', 'info');
                              $("#divGood").dialog("close");
                              searchGood();
                          }
                      });
                  }
              }, {
                  text: '关闭',
                  iconCls: "icon-no",
                  handler: function () {
                      $('#divGood').dialog('close');
                  }
              }]

          });
      }else{

          $.messager.alert("系统提示","该商品已上架","warning");

      }
  }


//=================================
  //下架
  function soldGood(){


      var selectedRow = $("#goodTable").datagrid("getSelections");
      var goodID = selectedRow[0].goodID;
      if (selectedRow.length != 1) {
          $.messager.alert("系统提示", "请选择一条要操作的数据！");
          return;
      }
        if(selectedRow[0].goodStatus == 2){
            $.messager.confirm("系统提示","确认下架吗？",function(s){
                if(s){
                    $.ajax({
                        url:"/good/updateGoodStatus.jhtml",
                        data:{"goodID":goodID,"goodStatus":3},
                        type:"post",
                        success:function(msg){
                            $.messager.alert('我的消息','操作成功！','info');
                            searchGood();
                        }
                    })
                }
            });
        }else{
            $.messager.alert('系统消息','该商品不可操作！','info');
        }













  }





  //-----------------------------------------

  //   查看   介绍
  function findGoodDesc(goodID){

    $('#goodDesc').dialog({
      title: '预览商品',
      width: 400,
      height: 600,
      href: '<%=request.getContextPath()%>/good/findKinderitor.jhtml?goodID='+goodID,
      modal: true,
    /*  onLoad:function (){
        editor.readonly(true);   // 设置  kindeditor  只读
      },*/
      buttons:[{
        text:"退出",
        iconCls:"icon-no",
        handler:function(){
          $('#goodDesc').dialog("close");
        }
      }]
    });

  }
  //------------------------------
  //  刷新
  function refresh(){
    $('#goodTable').datagrid("load");
  }

</script>



</body>

</html>
