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
        <select class="easyui-combobox" data-options="panelHeight:'auto',editable:false,valueField:'bid',textField:'brandName',width:130"  id="item_channelID" name="channel_ID">
          <option value="0">--请选择--</option>
          <option value="1001">JD</option>
          <option value="1002">MDL</option>
        </select>
      </td>
      <td>商品编号SKU:</td>
      <td><input class="easyui-textbox" name="channel_SKU"  data-options="iconCls:'',prompt:'请输入编号SKU'" style="width:100px"> </td>
      <td width="100px"><button onclick="searchGoodType()" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</button></td>
    </tr>

  </table>
</div>




<div id="divGood" style="display: none" style="width:1500px;padding:10px;">
<table>
  <form id="inserInfo">

             <td>
                  <table>
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
                          <td><input class="easyui-numberbox" type="text" readonly="readonly" id="item_agreement" name="agreement_Price" />

                          </td>
                      </tr>
                      <tr>
                          <td>供应商售卖价:</td>
                          <td><input class="easyui-numberbox" type="text" readonly="readonly" id="itemchannel_Price" name="channelPrice"  />

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
      </form>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
      <form id="proFrom">
              <td>
                  <table>
                      <tr>
                          <td>ZHXSKU:</td>
                          <td><input class="easyui-textbox" type="text" id="product_SKU" name="product_Sku"  style="width: 150px;"/></td>
                      </tr>
                      <tr>
                          <td>商品名称:</td>
                          <td><input class="easyui-textbox" type="text" id="product_Name" name="product_Name"   style="width: 480px;"/></td>
                      </tr>
                      <tr>
                          <td>品牌:</td>
                          <td>
                              <input class="easyui-textbox" type="text" id="product_brand" name="brand_Name" style="width: 250px;" />
                          </td>
                      </tr>
                      <tr>
                          <td>重量():</td>
                          <td>
                              <input class="easyui-numberbox" readonly="readonly" type="text" id="pro_weight" name="weight"  />

                          </td>
                      </tr>
                      <tr>
                          <td>协议价):</td>
                          <td>
                              <input class="easyui-numberbox" type="text" readonly="readonly" id="pro_agreementprice" name="agreement_Price" />
                          </td>
                      </tr>
                      <tr>
                          <td>资和信售卖价:</td>
                          <td>
                              <input class="easyui-numberbox" id="product_sale" type="text" name="sale_Price"/>
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

       var id=$("[name='channel_SKU']").val();

      $.ajax({
          url:"/good/queryItemList.jhtml",
          type:"post",
         data:{"channel_ID":channelId,"channel_SKU":id},
         dataType:"json",
         success:function(result){
             if ("000000" == result.resultCode) {
                 var a= '<img src =" ';
                 var b = ' " />'
                 var c = "http://img13.360buyimg.com/n0/";
                 $("#item_sku").textbox('setText',result.data.SKU);//给input赋值
                 $("#item_Name").textbox('setText',result.data.NAME);//给input赋值
                 $("#item_brand").textbox('setText',result.data.BRAND_NAME);//给input赋值
                 $("#item_weight").textbox('setText',result.data.WEIGHT);//给input赋值
                 $("#item_agreement").textbox('setText',result.data.AGREEMENT_PRICE);//给input赋值
                 $("#itemchannel_Price").textbox('setText',result.data.CHANNEL_PRICE);//给input赋值
                itemEditEditor_item_img.html( a + c + result.data.IMAGE_PATH +b);//主图
                 itemEditEditor_item.html(result.data.DESCRIPTION);//富文本赋值
                //-------------------------------------------------------------------------
                var itemID = $("#item_channelID").textbox('getValue');//取下拉框的值
                var itemsk=   $("#item_sku").textbox('getText');//取供应商的sku
                var prosk= itemID + itemsk;//拼接
                $("#product_SKU").textbox('setText',prosk);//给zhxsku赋值
                 $("#product_Name").textbox('setText',result.data.NAME);//给input赋值
                 $("#product_brand").textbox('setText',result.data.BRAND_NAME);//给input赋值
                 $("#pro_weight").textbox('setText',result.data.WEIGHT);//给input赋值
                 $("#pro_agreementprice").textbox('setText',result.data.AGREEMENT_PRICE);//给input赋值
                 $("#product_sale").textbox('setText',result.data.CHANNEL_PRICE);//zhx的售卖价
                 itemEditEditor_proitem_img.html(a + c + result.data.IMAGE_PATH + b);//主图  需要拼接img标签
                 itemEditEditor_product.html(result.data.DESCRIPTION);



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
          //url:'itemManage!categorytbl',
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
              var twoValue = $('#twoName').combobox('getValue');
              $.ajax({
                  type: "POST",
                  url: '/product/loadThreeName.jhtml?id=' + twoValue,
                  cache: false,
                  dataType : "json",
                  success: function(data){
                      /*  alert(JSON.stringify(data));*/
                      $("#threeName").combobox("loadData",data);//加载三类
                  }
              });
          }
      });

      $('#threeName').combobox({
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
          //url:'itemManage!categorytbl',
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
    var item_sku= $("#item_sku").textbox('getText');//取供应商的sku
    var item_Name= $("#item_Name").textbox('getText');
    var item_brand= $("#item_brand").textbox('getText');
    var item_weight= $("#item_weight").textbox('getText');
    var item_agreement= $("#item_agreement").textbox('getText');
    var itemchannel_Price= $("#itemchannel_Price").textbox('getText');
    var item_img= itemEditEditor_item_img.html();
    var item_desc= itemEditEditor_item.html();
    //------------右
    var product_SKU = $("#product_SKU").textbox('getText');//取zhx的sku
    var product_Name = $("#product_Name").textbox('getText');
    var product_brand = $("#product_brand").textbox('getText');
    var pro_weight = $("#pro_weight").textbox('getText');
    var pro_agreementprice = $("#pro_agreementprice").textbox('getText');
    var product_sale = $("#product_sale").textbox('getText');
    var proitem_img = itemEditEditor_proitem_img.html();
    var productInfo_Desc = itemEditEditor_product.html();
    var oneName=$("[name='oneName']").val();
    if(oneName == null){
        alert("不能为空")
        return;
    }
    var twoName=$("[name='twoName']").val();

    var threeName=$("[name='threeName']").val();

    var fourName=$("[name='fourName']").val();

  $.ajax({
    type:"post",
    url:'/good/insertGoodInfo.jhtml',
    data:{"channel_SKU":item_sku,"name":item_Name,"brand_Name":item_brand,"weight":item_weight,
        "agreement_Price":item_agreement,"channelPrice":itemchannel_Price,"img_url":item_img,
        "descRiption":item_desc,"product_Sku":product_SKU,"product_Name":product_Name,
        "brand_Name":product_brand,"weight":pro_weight,"agreement_Price":pro_agreementprice,
        "sale_Price":product_sale,"img_Url":proitem_img,"product_Desc":productInfo_Desc,
          "product_Type_ID":oneName,"product_Type_ID_T":twoName,"product_Type_ID_TH":threeName,"product_Type_ID_F":fourName},
    dataType:'json',
    success:function (result){


       /* if(result.errormag==1) {
            $.messager.alert("系统信息", "该用户名已经存在");*/
       /* $.messager.alert('我的消息','添加成功！','info');*/
          alert(111)
        $("#divGood").hidden();
      /*$("#divUser").dialog("close");
      $("#show-user").datagrid('reload');*/

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
