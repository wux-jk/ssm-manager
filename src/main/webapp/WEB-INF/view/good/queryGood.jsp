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
 <%--<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">--%>
  <link rel="stylesheet" type="text/css" href="css/default.css" />
  <link rel="stylesheet" type="text/css" href="js/jquery-easyui/themes/icon.css" />
  <script type="text/javascript" src="js/jquery-easyui.jquery.min.js"></script>
  <script type="text/javascript" src="js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript" src="js/json/json-minified.js"></script>
    <!-- 加载ajax重定向设置文件 -->
    <script type="text/javascript" src="js/ajaxSetup.js"></script>

  <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
  <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
  <script type="text/javascript" src="js/common.js"></script>


</head>
<body>
<div id="ps" class="easyui-panel" title="搜索"  style="width:1100px;padding:10px;background:#fafafa;"
     data-options="iconCls:'icon-save',closable:true,collapsible:true,minimizable:true,maximizable:true">



  <table cellpadding="5px">
    <tr>
        <td>一类:</td>
        <td>
            <select id="oneName1" class="easyui-combobox"   data-options="width:130" name="product_Type_ID">
                <option>--请选择--</option>
            </select>
        </td>

        <td>二类:</td>
        <td>
            <select id="twoName2" class="easyui-combobox" data-options="width:130" name="product_Type_ID_T" >
                <option>--请选择--</option>
            </select>
        </td>

        <td>三类:</td>
        <td>
            <select id="threeName3" class="easyui-combobox" data-options="width:130" name="product_Type_ID_TH" >
                <option>--请选择--</option>
            </select>
        </td>

        <td>四类:</td>
        <td>
            <select id="fourName4" class="easyui-combobox" data-options="width:130"  name="product_Type_ID_F">
                <option >--请选择--</option>
            </select>
        </td>
        <td>资和信SKU:</td>
        <td><input class="easyui-textbox" name="product_Sku"  data-options="iconCls:'',prompt:'请输入SKU'" style="width:130px"> </td>

        <td width="100px">
            <div onclick="searchGoodInfo()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</div>
        </td>
    </tr>

  </table>
</div>

<div id="tb">

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
<div id="productGood"></div>


<script type="text/javascript">
//动态查询下拉列表框
$(function() {
    // 下拉框选择控件，下拉框的内容是动态查询数据库信息
    $('#oneName1').combobox({
        url:'/product/loadOneName.jhtml',
        editable:false, //不可编辑状态
        cache: false,
        panelHeight: '150',
        valueField:'type_ID',
        textField:'type_Name',
        onHidePanel: function(){
            $("#twoName2").combobox("setValue",'');//清空二类列表框
            $("#threeName3").combobox("setValue",'');//清空三类列表框
            $("#fourName4").combobox("setValue",'');//清空四类列表框
            var oneValue = $('#oneName1').combobox('getValue');
            //查出一类  加载二类
            $.ajax({
                type: "POST",
                url: '/product/loadHierarchyName.jhtml?id=' + oneValue,
                cache: false,
                dataType : "json",
                success: function(data){
                    /*  alert(JSON.stringify(data));*/
                    $("#twoName2").combobox("loadData",data);//加载二类
                }
            });
        }
    });

   $('#twoName2').combobox({
        editable:false, //不可编辑状态
        cache: false,
        panelHeight: '150',//自动高度适合
        valueField:'type_ID',
        textField:'type_Name',
      });
//------------------------------------------------------------------------------------------------

    //通过二级查三级
    $('#twoName2').combobox({
        onSelect: function(){
            $("#threeName3").combobox("setValue",'');//清空三类列表框
            var twoValue = $('#twoName2').combobox('getValue');
            $.ajax({
                type: "POST",
                url: '/product/loadThreeName.jhtml?id=' + twoValue,
                cache: false,
                dataType : "json",
                success: function(data){
                    /*  alert(JSON.stringify(data));*/
                    $("#threeName3").combobox("loadData",data);//加载三类
                }
            });
        }
    });

    $('#threeName3').combobox({
        //url:'itemManage!categorytbl',
        editable:false, //不可编辑状态
        cache: false,
        panelHeight: '150',//自动高度适合
        valueField:'type_ID',
        textField:'type_Name',
    });

//---------------------------------------------------------------------------------
    var productSku = null;
    //通过三级查四级
    $('#threeName3').combobox({
        onSelect: function(){
            $("#fourName4").combobox("setValue",'');//清空四类列表框
            var fourValue = $('#threeName3').combobox('getValue');
            $.ajax({
                type: "POST",
                url: '/product/loadfourName.jhtml?id=' + fourValue,
                cache: false,
                dataType : "json",
                success: function(data){
                 $("#fourName4").combobox("loadData",data);//加载四类
                }
            });
        }
    });

    $('#fourName4').combobox({
        //url:'itemManage!categorytbl',
        editable:false, //不可编辑状态
        cache: false,
        panelHeight: '150',//自动高度适合
        valueField:'type_ID',
        textField:'type_Name',
    });

});

//----------------------------------------------------------------------------------------------------

//查询触发
  function searchGoodInfo(){
    var oneName1=$("[name='product_Type_ID']").val()=="--请选择--"?"":$("[name='product_Type_ID']").val();

    var twoName2=$("[name='product_Type_ID_T']").val()=="--请选择--"?"":$("[name='product_Type_ID_T']").val();

     var threeName3=$("[name='product_Type_ID_TH']").val()=="--请选择--"?"":$("[name='product_Type_ID_TH']").val();

     var fourName4=$("[name='product_Type_ID_F']").val()=="--请选择--"?"":$("[name='product_Type_ID_F']").val();

     var product_Sku=$("[name='product_Sku']").val();


    $('#goodTable').datagrid({
      url: "/good/queryGoodList.jhtml",
      fitColumns: true,
      pagination: true,
      autoRowHeight:true,

      pagePosition:'both',
      loadMsg:'正在加载请稍后.....',
      nowrap:true,
      singleSelect : false,
      remoteSort: true ,
      pageNumber:1,
      pageSize: 5 ,   // 在设置分页属性的时候初始化页面大小。
      pageList :[5,10,20,30,40],
      queryParams: {
          product_Type_ID: oneName1,
          product_Type_ID_T: twoName2,
          product_Type_ID_TH: threeName3,
          product_Type_ID_F: fourName4,
          product_Sku: product_Sku,
      },
      columns:[[
        {field:'ckecked',checkbox:true,name:'check'},
        {field:'product_ID',title:'ID',width:30,align:'center'},
        {field:'product_Sku',title:'ZHXsku',width:30,align:'center'},
        {field:'channel_Sku',title:'供应商的sku',width:30,align:'center'},
        {field:'channel_ID',title:'供应商',width:35,align:'center'},
           /* formatter: function(value,row,index){
                if(row.channel_ID == 1001){
                    return 'JD';
                }else if(row.channel_ID == 1002){
                    return 'MDL';
                }else{
                    return "不知";
                }
            }*/

        {field:'product_Name',title:'商品名称',width:50,align:'center'},
        {field:'agreement_Price',title:'供应商的协议单价',width:30,align:'center'},
        {field:'channel_Price',title:'供应商的售卖价',width:30,align:'center'},
        {field:'sale_Price',title:'ZHX售卖价',width:30,align:'center'},
          {field:'inventory_count',title:'库存数量',width:30,align:'center'},
        /* {field:'status',title:'状态',width:30,align:'center'},*/
         /* {field:'sataus',title:'状态',width:30,align:'center'},*/
        {field:'status',title:'状态',width:20,align:'center',
          formatter: function(value,row,index){
            if(row.status == 00){
              return '上架';
            }else if(row.status == 01){
              return '编辑';
            }else if(row.status == 02){
                return '失效';
            }
          }
        }, {field:'crud',title:'操作',width:20,align:'center',
          formatter: function (value,row,index){
            var str = '<input type="button" value="预览商品" class="btn btn-info" onclick="findGoodDesc(\''+row.product_ID+'\')"/>';
            return str;


          }
        }


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
      var id = selectedRows[0].product_ID;
      $('#productGood').dialog({
          title: '修改',
          width: 1000,
          height:800,
          closed: false,
          cache: false,
          href:'/good/findGoodByid.jhtml?product_ID='+id,
          modal: true,
          buttons:[{
              text:'保存',
              iconCls:"icon-ok",
              handler:function(){
                /*  ($("#desc").val());*/ //获取修改页面的desc的id选择器
                  $.ajax({
                      type:"post",
                      url:'<%=request.getContextPath()%>/good/updateProductInfo.jhtml',
                      data:$("#upGoodForm").serialize(),
                      success:function (msg){
                          $.messager.alert('我的消息','修改成功！','info');
                          $("#productGood").dialog("close");
                          $('#goodTable').datagrid("load");
                          searchGoodInfo();
                      }
                  });
              }
          },{
              text:'关闭',
              iconCls:"icon-no",
              handler:function(){
                  $('#productGood').dialog('close');
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
         var product_ID = selectedRow[0].product_ID;
         var sataus = selectedRow[0].status;
         var proSku= selectedRow[0].product_Sku;
         if(sataus != 00) {
             $('#productGood').dialog({
             title: '上架',
             width: 300,
             height: 300,
             closed: false,
             cache: false,
             href: '/good/toPutawayGood.jhtml?product_ID='+product_ID,
             modal: true,
             buttons: [{
             text: '确定上架',
             iconCls: "icon-ok",
             handler: function () {
                 $.ajax({
                     type: "post",
                     url: '/good/upGoodOnStatusStock.jhtml',
                     data: {"product_ID":product_ID,"sataus":sataus,"product_Sku":proSku,"inventory_count":$("#inventory_count_so").val()},
                     success: function (result) {
                                $("#productGood").dialog("close");
                                $('#goodTable').datagrid("load");
                                $.messager.alert('我的消息', '上架成功！', 'info');
                                searchGoodInfo();

                     }
                 });
             }
             }, {
                 text: '关闭',
                         iconCls: "icon-no",
                         handler: function () {
                         $('#productGood').dialog('close');
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
      if (selectedRow.length != 1) {
          $.messager.alert("系统提示", "请选择一条要操作的数据！");
          return;
      }

      var sataus = selectedRow[0].status;
      var product_ID = selectedRow[0].product_ID;
      var proSku= selectedRow[0].product_Sku;
        if(sataus == 00){
            $.messager.confirm("系统提示","确认下架吗？",function(s){
                if(s){
                    $.ajax({
                        url:"/good/updateGoodStatus.jhtml",
                        data:{"product_ID":product_ID,"sataus":sataus,"product_Sku":proSku,"inventory_count":0},
                        type:"post",
                        success:function(msg){
                            $.messager.alert('我的消息','操作成功！','info');
                            $('#goodTable').datagrid("load");
                            searchGoodInfo();
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
  function findGoodDesc(product_ID){

    $('#goodDesc').dialog({
      title: '预览商品',
      width: 700,
      height: 900,
      href: '<%=request.getContextPath()%>/good/findKinderitor.jhtml?product_ID='+product_ID,
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
