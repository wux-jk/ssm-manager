<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/31 0031
  Time: 上午 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
  <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
  <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
</head>
<body>







<%--  <div id="dlg" class="easyui-dialog"
       style="width: 730px;height:280px;padding:10px 10px;" closed="true"
       buttons="#dlg-buttons">
    <form method="post" id="fm">
      <table cellspacing="8px;">
        <tr>
          <td>名称：</td>
          <td><input type="text" id="goodName" name="goodName"
                     class="easyui-validatebox" required="true" />&nbsp;<span
                  style="color: red">*</span>
          </td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td>编号：</td>
          <td><input type="text" id="goodNumber" name="goodNumber"
                     class="easyui-validatebox" required="true" />&nbsp;<span
                  style="color: red">*</span>
          </td>
        </tr>
        <tr>
          <td>价格：</td>
          <td><input type="text" id="goodPrice" name="goodPrice"
                     class="easyui-validatebox" required="true" />&nbsp;<span
                  style="color: red">*</span>
          </td>
          <td>价格：</td>
          <td><input type="text" id="goodStock" name="goodStock"
                     class="easyui-validatebox" required="true" />&nbsp;<span
                  style="color: red">*</span>
          </td>
        </tr>
        <tr>

          <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td>商家：</td>
          <td><select name="goodType" class="easyui-combobox"
                      id="goodType" style="width: 154px;" editable="false"
                      panelHeight="auto">
            <option value="0">--请选择--</option>
            <option value="1">京东</option>
            <option value="2">麦德龙</option>

          </select> &nbsp;<span style="color: red">*</span>
          </td>
        </tr>
      </table>
    </form>
  </div>


111



123--%>
<form id="upGoodForm">
  <table >
      <input type="hidden"  name="goodID"/><br/>
    <tr>

      <td align=right>&nbsp;&nbsp;<span style="color:red"></span>商品名称:</td>
      <td><input  class="easyui-textbox" name="goodName" value="${us.goodName}" style="width:100px"></td>
    </tr>
    <tr>

       <td align=right>&nbsp;&nbsp;<span style="color:red"></span>商品编号:</td>
       <td><input  class="easyui-textbox" name="goodNumber" value="${us.goodNumber}" style="width:100px"></td>
    </tr>
    <tr>
      <td align=right>&nbsp;&nbsp;<span style="color:red"></span>商品价格:</td>
      <td><input  class="easyui-textbox" name="goodPrice" value="${us.goodPrice}" style="width:100px"></td>
    </tr>
    <tr>
      <td align=right>&nbsp;&nbsp;<span style="color:red"></span>商品库存:</td>
      <td><input  class="easyui-textbox" name="goodStock" value="${us.goodStock}" style="width:100px"></td>
    </tr>
    <tr>
      <td align=right>&nbsp;&nbsp;<span style="color:red"></span>商家:</td>
      <td><input  class="easyui-textbox" name="goodType" value="${us.goodType}" style="width:100px"></td>
   </tr>

      <!-- 富文本编辑器 -->
      <td align=right>&nbsp;&nbsp;<span style="color:blue"></span>商品描述:</td>
      <td><textarea class="easyui-kindeditor" name="goodDesc" value="${us.goodDesc}"></textarea></td>
    </tr>
  </table>
</form>
</body>
</html>
