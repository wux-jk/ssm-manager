<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/8
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<div id="treeDemo" class="ztree"></div>



 <script type="text/javascript">

     //定义一个ztree对象
     var zTreeObj;

     // zTree 的参数配置
     var setting = {
         check: {
           //chkStyle: "radio",
           enable: true
         },
       data: {
          simpleData: {
               enable: true,
                       idKey: "id",
                       pIdKey: "pid",
                       rootPId: 0
             }
         }
     };
     //-----------------------------
        // zTree 的数据属性
       var zNodes = [
             /*{id:1,name:"书籍管理",open:true},
             {id:2,name:"书籍维护",pid:1},
             {id:3,name:"书籍归还",pid:1,checked:true},
             {id:4,name:"系统管理",open:true},
            {id:5,name:"系统维护",pid:4},
            {id:6,name:"机器维护",pid:4},
*/
          ];
  //--------------------------------------------------------
     //页面加载完成进行ztree初始化
        $(function() {
            //ajax请求从后台获取树
            $.ajax({
              url:"/login/selectUserRoleListJson.jhtml",
              data:{userID:"${userID }"},
              dataType:"json",
              type:"post",
              success:function(data) {
                zNodes = data;
                zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
                }
            });
       })

 //-----------------------------------------------------------
     //获取被选中的树节点
        function get_selection_tree_nodes() {
            var role_json_array = [];
           var nodes = zTreeObj.getCheckedNodes(true);
            for (var i = 0; i < nodes.length; i++) {
                var role_obj = {userID:"${userID}", rolesID:nodes[i].id};
               role_json_array.push(role_obj);
               // alert(nodes[i].name + ">>" + nodes[i].id);
              }
            return role_json_array;
          }

 </script>
</body>
</html>
