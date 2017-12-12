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
  <script type="text/javascript" src="js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>



</head>
<body>

<div id="p" class="easyui-panel" title="搜索"
     style="width:750px;padding:10px;background:#fafafa;"  data-options="iconCls:'icon-save',closable:true,collapsible:true,minimizable:true,maximizable:true">
  <table cellpadding="5px">
    <tr>
      <td>供应商:</td>
      <td>
        <select class="easyui-combobox" data-options="panelHeight:'auto',editable:false,valueField:'bid',textField:'brandName',width:130"  id="item_channelID" name="channel_ID">
          <option>--请选择--</option>
          <option value="1001">JD</option>
          <option value="1002">MDL</option>
        </select>
      </td>
      <td>商品编号SKU:</td>
      <td><input class="easyui-textbox" name="channel_Sku"  data-options="iconCls:'',prompt:'请输入编号SKU'" style="width:100px"> </td>
      <td width="100px"><div onclick="searchGoodType()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</div></td>
    </tr>

  </table>
</div>




<div id="divGood" style="display: none" style="width:1800px;padding:10px;">
<table valign="top">
  <form id="inserInfo" autocomplete="on">
               <td valign="top">
                  <table  valign="top">
                      <tr align="center" >
                          <th colspan="2" height="20" style="font-size:25px"> 供应商商品信息</th>
                      </tr>
                      <tr>
                         <td>供应商的sku:</td>
                          <td><input class="easyui-textbox"  readonly="readonly"  type="text" id="item_sku" name="channel_Sku"   style="width: 150px;"/></td>
                      </tr>
                      <tr>
                          <td>商品名称:</td>
                          <td><input class="easyui-textbox" readonly="readonly" type="text"  id="item_Name" name="name" style="width: 480px;"/></td>
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
                          <td><input class="easyui-numberbox"  readonly="readonly" id="item_agreement" name="agreement_Price" />

                          </td>
                      </tr>
                      <tr>
                          <td>供应商售卖价:</td>
                          <td><input class="easyui-numberbox"  readonly="readonly" id="itemchannel_Price" name="channel_Price"  />
                          </td>
                      </tr>
                      <tr>
                          <td>主图:</td>
                          <td>
                              <textarea style="width:70px;height:400px;visibility:hidden;" id="item_img" name="img_url"></textarea>
                          </td>
                      </tr>

                      <tr>
                          <td>商品描述:</td>
                          <td>
                              <textarea style="width:100px;height:600px;visibility:hidden;" id="productItem_Desc" name="descRiption"></textarea>
                          </td>
                      </tr>

                  </table>
            </td>

              <td valign="top">&nbsp;&nbsp;&nbsp;&nbsp;</td>

              <td>
                  <table valign="top">
                      <tr align="center">
                        <th colspan="2" style="font-size:25px"> 商城商品信息</th>
                      </tr>
                      <tr>
                          <td>ZHXSKU:</td>
                          <td><input class="easyui-textbox"  id="product_sku" name="product_Sku"  style="width: 150px;"/></td>
                      </tr>
                      <tr>
                          <td>商品名称:</td>
                          <td><input class="easyui-textbox"  id="product_name" name="product_Name"   style="width: 480px;"/></td>
                      </tr>
                      <tr>
                          <td>品牌:</td>
                          <td>
                              <input class="easyui-textbox"  id="product_brand" name="brand_Name" style="width: 250px;" />
                          </td>
                      </tr>
                      <tr>
                          <td>简介:</td>
                          <td><input class="easyui-textbox"  id="pro_detall" name="product_Detail" style="width: 480px;"/></td>
                      </tr>
                      <tr>
                          <td>重量:</td>
                          <td>
                              <input class="easyui-numberbox" readonly="readonly" type="text" id="pro_weight" name="weight"  />

                          </td>
                      </tr>
                      <tr>
                          <td>协议价:</td>
                          <td>
                              <input class="easyui-numberbox" type="text" readonly="readonly" id="pro_agreementprice" name="agreement_Price" />
                          </td>
                      </tr>
                      <tr>
                          <td>资和信售卖价:</td>
                          <td>
                              <input class="easyui-numberbox" precision="2" id="product_sale" type="text" name="sale_Price"/>
                          </td>
                      </tr>
                      <tr>
                          <td>一类:</td>
                          <td>
                              <select id="oneName" class="easyui-combobox"   data-options="width:130" name="oneName">
                                  <option>--请选择--</option>
                              </select>
                          </td>
                      </tr>
                      <tr>

                          <td>二类:</td>
                          <td>
                              <select id="twoName" class="easyui-combobox" data-options="width:130" name="twoName" >
                                  <option>--请选择--</option>
                              </select>
                          </td>
                      </tr>
                      <tr>

                          <td>三类:</td>
                          <td>
                              <select id="threeName" class="easyui-combobox" data-options="width:130" name="threeName" >
                                  <option>--请选择--</option>
                              </select>
                          </td>
                      </tr>
                      <tr>

                          <td>四类:</td>
                          <td>
                              <select id="fourName" class="easyui-combobox" data-options="width:130"  name="fourName">
                                  <option >--请选择--</option>
                              </select>
                          </td>
                      </tr>
                      <tr>
                          <td>主图:</td>
                          <td>
                              <textarea style="width:70px;height:400px;visibility:hidden;" id="proitem_img" name="img_Url"></textarea>
                          </td>
                      </tr>

                      <tr>
                          <td>商品描述:</td>
                          <td>
                            <textarea style="width:100px;height:600px;" id="productInfo_Desc" name="product_Desc"></textarea>
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
       var channelId=$("[name='channel_ID']").val();
       var sku=$("[name='channel_Sku']").val();
      $.ajax({
          url:"/good/queryItemList.jhtml",
          type:"post",
         data:{"channel_ID":channelId,"channel_Sku":sku},
         dataType:"json",
         success:function(result){
             if ("000000" == result.resultCode) {
                 var z= '<img src =" ';
                 var h = ' " />'
                 var x = "http://img13.360buyimg.com/n0/";
                 $("#item_sku").textbox('setText',result.result.sku);//给input赋值
                 $("#item_Name").textbox('setText',result.result.name);//给input赋值
                 $("#item_brand").textbox('setText',result.result.brandName);//给input赋值
                 $("#item_weight").textbox('setText',result.result.weight);//给input赋值
                 $("#item_agreement").textbox('setText',result.result.AGREEMENT_PRICE);//给价格赋值
                 $("#itemchannel_Price").textbox('setText',result.result.CHANNEL_PRICE);//给价格赋值
                  if( $("#item_agreement").textbox('getText') <=0){
                      $("#divGood").hide();
                      $.messager.alert('我的消息', '该商品不存在！', 'info')
                      return;
                  }
                 if($("#itemchannel_Price").textbox('getText') <=0){
                     $("#divGood").hide();
                     $.messager.alert('我的消息', '该商品不存在！', 'info')
                     return;
                 }
                 itemEditEditor_item_img.html( z + x + result.result.imagePath + h);//主图
                 itemEditEditor_item.html(result.result.appintroduce +result.result.param );//富文本赋值
                if(itemEditEditor_item.html() == ""){
                    $("#divGood").hide();
                    $.messager.alert('我的消息', '该商品不存在！', 'info')
                    return;
                }

                 /*$("#item_upc").val(result.data.UPC);//给隐藏域input赋值
                  $("#unit").val(result.data.UNIT);//给input赋值
                  $("#item_saleCount").val(result.data.SALE_COUNT);//给input赋值*/

 //-----------------------------------------------------------------------------------------------------------------------
                var itemID = $("#item_channelID").textbox('getValue');//取渠道的id
                var itemsk=   $("#item_sku").textbox('getText');//取供应商的sku
                var prosk= itemID + itemsk;//拼接
                $("#product_sku").textbox('setText',prosk);//给zhxsku赋值
                 $("#product_name").textbox('setText',result.result.name);//给input赋值
                 $("#product_brand").textbox('setText',result.result.brandName);//给input赋值
                 $("#pro_weight").textbox('setText',result.result.weight);//给input赋值
                 $("#pro_agreementprice").textbox('setText',result.result.AGREEMENT_PRICE);//给input赋值
                 $("#product_sale").textbox('setText',result.result.CHANNEL_PRICE);//zhx的售卖价
                 itemEditEditor_proitem_img.html(z + x + result.result.imagePath +h);//主图  需要拼接img标签
                itemEditEditor_product.html(result.result.appintroduce + result.result.param);//商品描述
                 if(itemEditEditor_product.html() ==""){
                     $("#divGood").hide();
                     $.messager.alert('我的消息', '该商品不存在！', 'info')
                     return;
                 }
             }

           }
       })

   }
  //------------------------------
  //动态查询下拉列表框
  $(function() {
      // 下拉框选择控件，下拉框的内容是动态查询数据库信息
      $('#oneName').combobox({
          url:'/product/loadOneName.jhtml',
          editable:false, //不可编辑状态
          cache: false,
          panelHeight: '150',
          valueField:'type_ID',
          textField:'type_Name',
          onHidePanel: function(){
              $("#twoName").combobox("setValue",'');//清空二类列表框
              $("#threeName").combobox("setValue",'');//清空三类列表框
              $("#fourName").combobox("setValue",'');//清空四类列表框
              var oneValue = $('#oneName').combobox('getValue');
              //查出一类  加载二类
              $.ajax({
                  type: "POST",
                  url: '/product/loadHierarchyName.jhtml?id=' + oneValue,
                  cache: false,
                  dataType : "json",
                  success: function(data){
                      /*  alert(JSON.stringify(data));*/
                      $("#twoName").combobox("loadData",data);//加载二类
                  }
              });
          }
      });

      $('#twoName').combobox({
          editable:false, //不可编辑状态
          cache: false,
          panelHeight: '150',//自动高度适合
          valueField:'type_ID',
          textField:'type_Name',
      });
//------------------------------------------------------------------------------------------------

      //通过二级查三级
      $('#twoName').combobox({
          onSelect: function(){
              $("#threeName").combobox("setValue",'');//清空三类列表框
              $("#fourName").combobox("setValue",'');//清空四类列表框
              var twoValue = $('#twoName').combobox('getValue');
              $.ajax({
                  type: "POST",
                  url: '/product/loadThreeName.jhtml?id=' + twoValue,
                  cache: false,
                  dataType : "json",
                  success: function(data){
                    $("#threeName").combobox("loadData",data);//加载三类
                  }
              });
          }
      });

      $('#threeName').combobox({
          editable:false, //不可编辑状态
          cache: false,
          panelHeight: '150',//自动高度适合
          valueField:'type_ID',
          textField:'type_Name',

      });

//---------------------------------------------------------------------------------
      var productSku = null;
      //通过三级查四级
      $('#threeName').combobox({
          onSelect: function(){
              $("#fourName").combobox("setValue",'');//清空四类列表框
              var fourValue = $('#threeName').combobox('getValue');
              $.ajax({
                  type: "POST",
                  url: '/product/loadfourName.jhtml?id=' + fourValue,
                  cache: false,
                  dataType : "json",
                  success: function(data){
                      $("#fourName").combobox("loadData",data);//加载四类
                  }
              });
          }
      });

      $('#fourName').combobox({
          editable:false, //不可编辑状态
          cache: false,
          panelHeight: '150',//自动高度适合
          valueField:'type_ID',
          textField:'type_Name',
      });

  });


  //---------------------------------------------

//导入商品库
function sumitGood(){
    //左
    var itemID = $("#item_channelID").textbox('getValue');//取渠道id
    var itemsk= $("#item_sku").textbox('getText');//取供应商的sku
    var item_Name= $("#item_Name").textbox('getText');
    var item_brand= $("#item_brand").textbox('getText');
    var item_weight= $("#item_weight").textbox('getText');
    var item_agreement= $("#item_agreement").textbox('getText');
    var itemchannel_Price= $("#itemchannel_Price").textbox('getText');
    var item_img= itemEditEditor_item_img.html();//主图
    var item_desc= itemEditEditor_item.html();//描述
    //------------右
    var product_SKU = $("#product_sku").textbox('getText');//取zhx的sku
    var product_Name = $("#product_name").textbox('getText');
    var product_brand = $("#product_brand").textbox('getText');
    var pro_weight = $("#pro_weight").textbox('getText');
   var pro_agreementprice = $("#pro_agreementprice").textbox('getText');
    var product_sale = $("#product_sale").textbox('getText');
    var proitem_img = itemEditEditor_proitem_img.html();//主图
    var productInfo_Desc = itemEditEditor_product.html();//描述
    var pro_detall = $("#pro_detall").textbox('getText');//简介
    if(pro_detall == ""){
        $.messager.alert('我的消息', '导入失败,请输入简介！', 'info')
        $("#divGood").hide();
        return;
    }

    var oneName=$("[name='oneName']").val();
    if(oneName == "" || oneName == "--请选择--"){
        $.messager.alert('我的消息', '导入失败,请选择商品类别！', 'info')
        $("#divGood").hide();
        return;

    }
     var twoName=$("[name='twoName']").val();
    if(twoName == "" || twoName == "--请选择--"){
        $.messager.alert('我的消息', '导入失败,请选择商品类别！', 'info')
        $("#divGood").hide();
        return;

    }
     var threeName=$("[name='threeName']").val();
    if(threeName == "" || threeName == "--请选择--"){
        $.messager.alert('我的消息', '导入失败,请选择商品类别！', 'info')
        $("#divGood").hide();
        return;

    }
     var fourName=$("[name='fourName']").val();
    if(fourName == "" || fourName == "--请选择--"){
        $.messager.alert('我的消息', '导入失败,请选择商品类别！', 'info')
        $("#divGood").hide();
        return;

    }

  $.ajax({
    type:"post",
    url:'/good/insertGoodInfo.jhtml',
    data:{"channel_Sku":itemsk,"name":item_Name,"brand_Name":item_brand,"weight":item_weight,
        "agreement_Price":item_agreement,"channel_Price":itemchannel_Price,"img_url":item_img,
        "descRiption":item_desc,"product_Sku":product_SKU,"product_Name":product_Name,
        "brand_Name":product_brand,"weight":pro_weight,"agreement_Price":pro_agreementprice,
        "sale_Price":product_sale,"img_Url":proitem_img,"product_Desc":productInfo_Desc,
          "product_Type_ID":oneName,"product_Type_ID_T":twoName,"product_Type_ID_TH":threeName,
        "product_Type_ID_F":fourName,"product_Detail":pro_detall,"channel_ID":itemID},
    dataType:'json',

    success:function (data) {
       if(data.stateCode=="900"){
            $.messager.alert('我的消息', data.msg, 'info');
            $("#divGood").hide();
            var pro_detall = $("#pro_detall").textbox('setText',""); //置空商品详情框
            $("#oneName").combobox("setValue",'--请选择--');//清空二类列表框
            $("#twoName").combobox("setValue",'--请选择--');//清空二类列表框
            $("#threeName").combobox("setValue",'--请选择--');//清空二类列表框
            $("#fourName").combobox("setValue",'--请选择--');//清空二类列表框

        }else if(data.stateCode=="200"){
            $.messager.alert('我的消息', '导入成功！', 'info')
            $("#divGood").hide();
            var pro_detall = $("#pro_detall").textbox('setText',"");//置空商品详情框
            $("#oneName").combobox("setValue",'--请选择--');//清空二类列表框
            $("#twoName").combobox("setValue",'--请选择--');//清空二类列表框
            $("#threeName").combobox("setValue",'--请选择--');//清空二类列表框
            $("#fourName").combobox("setValue",'--请选择--');//清空二类列表框


        }


    }
  });


}

</script>

<script>
    var itemEditEditor_item ; //左表的描述编辑器
    var itemEditEditor_product; //右表的描述编辑器
    var itemEditEditor_item_img ; //这是左表的主图编辑器
    var itemEditEditor_proitem_img ; //右表的主图编辑器

    $(function(){
        //实例化编辑器     //这是左表的描述编辑器
        itemEditEditor_item = E3.createEditor("#productItem_Desc");
        itemEditEditor_item.readonly(true);
        //这是左表的主图编辑器
        itemEditEditor_item_img = E3.createEditor("#item_img");
        itemEditEditor_item_img.readonly(true);

        //右表的主图编辑器
        itemEditEditor_proitem_img = E3.createEditor("#proitem_img");
        itemEditEditor_product = E3.createEditor("#productInfo_Desc");  //右表的描述编辑器


    });



</script>

</body>
</html>
