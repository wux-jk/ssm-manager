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

   string =  jian + "22"
    i$"


</head>
<body>

<div id="p" class="easyui-panel" title="搜索"
     style="width:750px;padding:10px;background:#fafafa;"  data-options="iconCls:'icon-save',closable:true,collapsible:true,minimizable:true,maximizable:true">
  <table cellpadding="5px">
    <tr>
      <td>供应商:</td>
      <td>
        <select class="easyui-combobox" data-options="panelHeight:'auto',editable:false,valueField:'bid',textField:'brandName',width:130"  id="item_channelID" name="channel_ID">
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
                          <td><input class="easyui-textbox"  readonly="readonly" type="text" id="item_sku" name="channel_SKU"   style="width: 150px;"/></td>
                      </tr>
                      <tr>
                          <td>商品名称:</td>
                          <td><input class="easyui-textbox" readonly="readonly" type="text"  id="item_Name" name="name" style="width: 150px;"/></td>
                      </tr>
                      <tr>
                          <td>商品品牌:</td>
                          <td>
                              <input class="easyui-textbox" readonly="readonly" type="text" id="item_brand" name="brand_Name"  />
                          </td>
                      </tr>
                      <tr>
                          <td>重量:</td>
                          <td>
                              <input class="easyui-numberbox" readonly="readonly" id="item_weight" type="text" name="weight"  />
                          </td>
                      </tr>
                      <tr>
                          <td>协议价:</td>
                          <td><input class="easyui-numberbox" type="text" readonly="readonly" id="item_agreement" name="agreement_Price" />
                              <input type="hidden" name="agreement_Price"/>
                          </td>
                      </tr>
                      <tr>
                          <td>供应商售卖价:</td>
                          <td><input class="easyui-numberbox" type="text" readonly="readonly" id="item_sale" name="sale_Price"  />
                              <input type="hidden" name="sale_Price"/>
                          </td>
                      </tr>
                      <tr>
                          <td>主图:</td>
                          <td>
                              <input class="easyui-numberbox" type="text" id="item_img" name="img_url"  />
                              <input type="hidden" name="image"/>
                          </td>
                      </tr>
                  <tr>
                          <td>商品描述:</td>
                          <td>
                              <input class="easyui-textbox" readonly="readonly" type="text" id="item_descs" name="descRiption"  />

                          </td>
                   </tr>
                  </table>
              </td>

              <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
              <td>
                  <table>
                      <tr>
                          <td>ZHXSKU:</td>
                          <td><input class="easyui-textbox" type="text" id="product_SKU" name="product_SKU" value="${product_SKU}"  style="width: 150px;"/></td>
                      </tr>
                      <tr>
                          <td>商品名称:</td>
                          <td><input class="easyui-textbox" type="text" id="product_Name" name="product_Name" value="${product_Name}"  style="width: 150px;"/></td>
                      </tr>
                      <tr>
                          <td>品牌:</td>
                          <td>
                              <input class="easyui-textbox" type="text" id="product_brand" name="brand_Name" value="${brand_Name}" />
                          </td>
                      </tr>
                      <tr>
                          <td>协议价(这也是隐藏的):</td>
                          <td>
                              <input class="easyui-numberbox" type="text" name="agreement_Price" value="${agreement_Price}" />
                              <input type="hidden" id="product_agreement" name="agreement_Price"/>
                          </td>
                      </tr>
                      <tr>
                          <td>资和信售卖价:</td>
                          <td>
                              <input class="easyui-numberbox" id="product_sale" type="text" name="sale_Price"/>
                          </td>
                      </tr>
                      <tr>
                          <td>主图:</td>
                          <td>
                              <input class="easyui-numberbox" type="text" id="product_img" name="img_url"  />
                              <input type="hidden" name="image"/>
                          </td>
                      </tr>
                      <tr>
                          <td>重量(是隐藏的):</td>
                          <td>
                              <input class="easyui-numberbox" type="text" name="weight"  />
                              <input type="hidden" id="product_weight" name="weight"/>
                          </td>
                      <tr>
                          <td>商品描述:</td>
                          <td>
                            <textarea style="width:100px;height:600px;visibility:hidden;" id="product_Desc" name="product_Desc">${us.goodDesc}</textarea>
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
      alert(channel_ID);
       var channel_SKU=$("[name='channel_SKU']").val();
      alert(channel_SKU);
      $.ajax({
          url:"/good/queryItemList.jhtml",
         data:{"channel_ID":channel_ID,"channel_SKU":channel_SKU},
         type:"post",
         success:function(msg){
         /*var  ss = goodInfo.ID; */   /**"对象"."字段名"; 查京东或京东接口  定义变量，给input框赋值*/

           $("#item_sku").textbox('setText', goodInfo.ID);



       /*   String ss =  $("#item_channelID").textbox("getValue"，xx);获取拼接京东或麦德龙字符串  给zihxsku赋值；
          String s  =    $("#item_sku").val();
           String  sss =   ss + s ;
             String aa =  $("#product_SKU").("setValue",sss);*/

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
        itemEditEditor = E3.createEditor("#inserInfo [name=product_Desc]");
    });

</script>