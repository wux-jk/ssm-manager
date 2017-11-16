<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/8 0008
  Time: 下午 2:56
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
</head>
<body>

<!-- 工具栏 -->
<div id="bicycleTool">
  <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" plain="true"  onclick="updatetUser();">编辑</a>
  <%--  <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" plain="true"   onclick="deleteProducts();">批量删除</a>--%>
  <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="insertUser();" >新增</a>
</div>


<!-- 数据表格 -->
<table id="show-user"></table>

<!-- 角色弹操作框 -->
<div id="show_roles"></div>

<!--  修改页面对话框  -->
<div id="divUser"></div>

<script type="text/javascript">
  /* 查询用户 */
      $('#show-user').datagrid({
      url:'<%=request.getContextPath()%>/login/queryUserList.jhtml',
      fitColumns:true,
      width:650,
      heigth:30,
      columns:[[
        {field:'ckecked',checkbox:true},
        {field:'userID',title:'用户ID',width:30,align:'center'},
        {field:'userName',title:'用户名',width:50,align:'center'},
        {field:'crud',title:'操作',width:30,align:'center',
          formatter: function (value,row,index){
           var str = '<input type="button" value="角色操作" class="btn btn-info" onclick="end_user(\''+row.userID+'\')"/>';
            return str;
          }
        }
      ]]
    })
</script>
<!-- ---------------------------------------->
<script type="text/javascript">

  //给用户修改角色
  function end_user(uid) {
     $('#show_roles').dialog({
      title: '用户附角色',
      width: 300,
      height: 300,
      closed: false,
      cache: false,
      href: '/login/toUserRoles.jhtml?userID=' + uid,
      modal: true,
      buttons: [{
        text: '保存',
        iconCls: "icon-ok",
        handler: function () {
          var role_json_array = get_selection_tree_nodes();//获取被选中的树节点的方法
          $.ajax({
            type: "post",
            url: '/roles/updateUserRole.jhtml',
            dataType:"json",
            data:JSON.stringify(role_json_array),
             success: function (msg) {
              $.messager.alert('我的消息', '操作成功！', 'info');
              $("#show_roles").dialog("close");

            },
            contentType:"application/json"
          });
        }
      }, {
        text: '关闭',
        iconCls: "icon-no",
        handler: function () {
          $('#show_roles').dialog('close');
        }
      }]

    })
  }

  //--------------------------------------------


  //修改用户
  function updatetUser(){
    var selectedRows = $("#show-user").datagrid("getSelections");
    if (selectedRows.length != 1) {
      $.messager.alert("系统提示", "请选择一条要编辑的数据！");
      return;
    }
    var id = selectedRows[0].userID;
     //  调用  dialog
    $('#divUser').dialog({
      title: '修改用户',
      width: 400,
      height:300,
      closed: false,
      cache: false,
      href:'/login/findUserByid.jhtml?userID='+id,
      modal: true,
      buttons:[{
        text:'保存',
        iconCls:"icon-ok",
        handler:function(){
          $.ajax({
            type:"post",
            url:'/login/updateUser.jhtml',
            data:$("#upUserForm").serialize(),
            success:function (msg){
              $.messager.alert('我的消息','修改成功！','info');
              $("#divUser").dialog("close");
              $("#show-user").datagrid('reload');

            }
          });
        }
      },{
        text:'关闭',
        iconCls:"icon-no",
        handler:function(){
          $('#divUser').dialog('close');
        }
      }]

    });
  }

  //-------------------------------------------------
  //新增用户
  function insertUser(){
       //  调用  dialog
    $('#divUser').dialog({
      title: '新增用户',
      width: 400,
      height:250,
      closed: false,
      cache: false,
      href:'/login/toUserPage.jhtml',
      modal: true,
      buttons:[{
        text:'保存',
        iconCls:"icon-ok",
        handler:function(){
          $.ajax({
            type:"post",
            url:'/login/insertUserInfo.jhtml',
            data:$("#userForm").serialize(),
            success:function (msg){
              $.messager.alert('我的消息','添加成功！','info');
              $("#divUser").dialog("close");
              $("#show-user").datagrid('reload');

            }
          });
        }
      },{
        text:'关闭',
        iconCls:"icon-no",
        handler:function(){
          $('#divUser').dialog('close');
        }
      }]

    });
  }
</script>
</body>



</html>
