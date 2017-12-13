<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/31 0031
  Time: 上午 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="js/common.js"></script>

<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>


<div style="padding:10px 10px 10px 10px">

<form id="upGoodForm" class="itemForm">

    <input type="hidden"  name="product_ID" value="${us.product_ID}"/>

  <table >
     <tr>
          <td>ZHXsku:</td>
          <td><input class="easyui-textbox" type="text" name="product_Sku" value="${us.product_Sku}"  style="width: 150px;"/></td>
     </tr>
      <tr>
         <td>供应商sku:</td>
          <td><input class="easyui-textbox" type="text" readonly="readonly" name="channel_Sku" value="${us.channel_Sku}"  style="width: 150px;"/></td>
   </tr>
      <tr>
          <td>供应商:</td>
          <td>
              <input class="easyui-textbox" type="text" readonly="readonly" name="channel_ID" value="${us.channel_ID}"  style="width: 150px;"/>
          </td>
     </tr>

      <tr>
          <td>商品名称:</td>
          <td><input class="easyui-textbox" type="text" name="product_Name" value="${us.product_Name}"  style="width:450px;"/></td>
      </tr>


     <tr>
         <td>供应商协议单价:</td>
        <td><input class="easyui-numberbox" type="text" precision="2" readonly="readonly" name="agreement_Price" value="${us.agreement_Price}" />

        </td>
      </tr>
   <tr>
        <td>供应商售卖单价:</td>
        <td><input class="easyui-numberbox" type="text" precision="2" readonly="readonly" name="channel_Price" value="${us.channel_Price}" />

          </td>
      </tr>
      <tr>
          <td>ZHX售卖单价:</td>
          <td><input class="easyui-numberbox" type="text"  precision="2" name="sale_Price" value="${us.sale_Price}" />

          </td>
     </tr>
      <tr>
          <td>商品详情:</td>
          <td><input class="easyui-textbox" type="text" name="product_Detail" value="${us.product_Detail}"  style="width:470px;"/></td>
      </tr>
      <tr>
          <td>主图:</td>
          <td>
              <textarea style="width:200px;height:600px;" id="productInfo_img_Url" name="img_Url"> <img src = "${us.img_Url}" /> </textarea>
          </td>
      </tr>
      <tr>
          <td>商品描述:</td>
          <td>
              <textarea style="width:200px;height:600px;" id="productInfo_Desc" name="product_Desc">${us.product_Desc}</textarea>
          </td>
      </tr>

</table>

</form>

</div>

<script>
    var itemEditEditor_prodesc ;
    var itemEditEditor_imgUrl;
    $(function(){
    //实例化编辑器
        itemEditEditor_prodesc = E3.createEditor("#productInfo_Desc");
        itemEditEditor_imgUrl = E3.createEditor("#productInfo_img_Url")
    });
</script>

