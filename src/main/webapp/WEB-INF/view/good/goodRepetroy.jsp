<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/16 0016
  Time: 上午 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form id="stokForm">
  <table >

    <tr>
      <td>库存数量:</td>
      <td><input class="easyui-numberbox" type="text"  id="inventory_count_so" />
        <input type="hidden"  value="${inventory_count}" name="inventory_count">
          <input type="hidden"  value="${product_ID}" name="product_ID">
      </td>
    </tr>




  </table>
</form>
</body>
</html>
