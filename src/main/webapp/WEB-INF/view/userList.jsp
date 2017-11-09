<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/8
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link rel="stylesheet" type="text/css" href="js/jquery-easyui/themes/gray/easyui.css" />
  <link rel="stylesheet" type="text/css" href="js/jquery-easyui/themes/icon.css" />
</head>
<body>
<!-- 工具栏 -->
 <div id="bicycleTool">
     <a href="javascript:addtob()" class="easyui-linkbutton" iconCls="icon-add">新增</a>
    <a href="javascript:updateto()" class="easyui-linkbutton" iconCls="icon-edit" >编辑</a>
 </div>

<!-- 数据表格 -->
 <table id="show-user"></table>
 <!-- 角色弹操作框 -->
 <div id="show_roles"></div>


<script type="text/javascript">
$(function(){
  $('#show-user').datagrid({
    url:'<%=request.getContextPath()%>/login/queryUserList.jhtml',
    fitColumns:true,
    width:600,
    heigth:30,
    columns:[[
      {field:'ckecked',checkbox:true},
      {field:'userID',title:'编号',width:20,align:'center'},
      {field:'userName',title:'用户名',width:30,align:'center'},
      {field:'crud',title:'操作',width:20,align:'center',
        formatter: function (value,row,index){
          var str = '<input type="button" value="角色操作" class="btn btn-info" onclick="edit_user_role(\''+row.userID+'\')"/>';
          return str;


               }
           }

      ]]
  });
})
</script>

<!-- -->
<script type="text/javascript">
  //给用户修改角色
  function edit_user_role(user_id) {
      alert(user_id)
      $('#show_roles').dialog({
          title: '用户附角色',
          width: 500,
          height: 500,
          closed: false,
          cache: false,
          href: '/login/toUserRoles.jhtml?userID=' + user_id,
          modal: true,
          buttons: [{
              text: '保存',
              iconCls: "icon-ok",
              handler: function () {
                  var role_json_array = get_selection_tree_nodes();//获取被选中的树节点的方法
                  $.ajax({
                      type: "post",
                      url: '<%=request.getContextPath()%>/login/updateUserRole.jhtml',
                      data: $("#upGoodForm").serialize(),
                      success: function (msg) {
                          $.messager.alert('我的消息', '操作成功！', 'info');
                          $("#show_roles").dialog("close");

                      }
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

</script>

</body>
</html>
