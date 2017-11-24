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
   <script type="text/javascript" src="js/common.js"></script>
  <link rel="stylesheet" type="text/css" href="css/default.css" />
  <link rel="stylesheet" type="text/css" href="js/jquery-easyui/themes/icon.css" />

  <link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
  <script type="text/javascript" src="js/jquery-easyui.jquery.min.js"></script>
  <script type="text/javascript" src="js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>

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
          <option value="1001">京东</option>
          <option value="1002">麦德龙</option>
        </select>
      </td>
      <td>商品编号SKU:</td>
      <td><input class="easyui-textbox" name="channel_SKU"  data-options="iconCls:'',prompt:'请输入编号SKU'" style="width:100px"> </td>
      <td width="100px"><button onclick="searchGoodType()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</button></td>
    </tr>

  </table>
</div>




<div id="divGood" style="display: none" style="width:1000px;padding:10px;">
<table>
  <form id="inserInfo">
          <input type="hidden"  name="id" value="${id}"/>
              <td>
                  <table>
                      <tr>
                          <td>供应商的sku:</td>
                          <td><input class="easyui-textbox" type="text" id="ssssssss_11" name="channel_SKU"   style="width: 150px;"/></td>
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
                      <tr>
                          <td>主图:</td>
                          <td>
                              <input class="easyui-numberbox" type="text" name="img_url"  />
                          </td>
                      </tr>
                  <tr>
                          <td>商品描述:</td>
                          <td>
                              <textarea style="width:100px;height:600px;visibility:hidden;" id="descs" name="good">${us.goodDesc}</textarea>
                          </td>
                   </tr>
                  </table>
              </td>

              <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
              <td>
                  <table>
                      <tr>
                          <td>ZHXSKU:</td>
                          <td><input class="easyui-textbox" type="text"  name="product_SKU" value="${product_SKU}"  style="width: 150px;"/></td>
                      </tr>
                      <tr>
                          <td>商品名称:</td>
                          <td><input class="easyui-textbox" type="text" name="product_Name" value="${product_Name}"  style="width: 150px;"/></td>
                      </tr>
                      <tr>
                          <td>品牌:</td>
                          <td>
                              <input class="easyui-textbox" type="text" name="brand_Name" value="${brand_Name}" />
                          </td>
                      </tr>
                      <tr>
                          <td>协议价(这也是隐藏的):</td>
                          <td>
                              <input class="easyui-numberbox" type="text" name="agreement_Price" value="${agreement_Price}" />
                              <input type="hidden" name="agreement_Price"/>
                          </td>
                      </tr>
                      <tr>
                          <td>资和信售卖价:</td>
                          <td>
                              <input class="easyui-numberbox" type="text" name="sale_Price"/>
                          </td>
                      </tr>
                      <tr>
                          <td>主图:</td>
                          <td>
                              <input class="easyui-numberbox" type="text" name="img_url"  />
                          </td>
                      </tr>
                      <tr>
                          <td>重量(是隐藏的):</td>
                          <td>
                              <input class="easyui-numberbox" type="text" name="weight"  />
                              <input type="hidden" name="goodPrice"/>
                          </td>
                      <tr>
                          <td>商品描述:</td>
                          <td>
                            <textarea style="width:100px;height:600px;visibility:hidden;" id="desc" name="goodDesc">${us.goodDesc}</textarea>
                          </td>
                      </tr>
                      <tr align="center">
                          <td colspan="2">
                              <input  type="button" onclick="sumitGood();" value="导入资和信商品库"/>
                          </td>
                      </tr>
                  </table>
              </td>
      </form>
</table>
</div>

<script type="text/javascript">
  function searchGoodType() {
    //d当触发查询按钮事件  显示表格
      $("#divGood").show();
       var channel_ID=$("[name='channel_ID']").val();
       alert(channel_ID)
       var channel_SKU=$("[name='channel_SKU']").val();

      $.ajax({
          url:"/good/queryGoodList.jhtml",
         data:{"channel_ID":channel_ID,"channel_SKU":channel_SKU},
         type:"post",
         success:function(msg){
           $("#ssssssss_11").textbox('setText', "11111");

           }
       })

   }



  //---------------------------------------------

//导入商品库
function sumitGood(){
  $.ajax({
    type:"post",
    url:'/good/insertGoodInfo.jhtml',
    data:$("#inserInfo").serialize(),
    success:function (msg){
        $.messager.alert('我的消息','添加成功！','info');
      alert(111)
      /*$("#divUser").dialog("close");
      $("#show-user").datagrid('reload');*/

    }
  });
}

</script>


</body>



</html>
<script>
    var itemEditEditor ;
    $(function(){
        //实例化编辑器
        itemEditEditor = E3.createEditor("#inserInfo [name=good]");
    });

</script>