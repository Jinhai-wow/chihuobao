<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'storerDetail.jsp' starting page</title>
    
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
	<link id="themeLink" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">

	<style type="text/css">
		
		td{
			width:50px;
			
		}
	</style>
  </head>
  
  <body>
    <table  style="width:100%;height:60px; text-align:center;font-size:10px;">
    	<thead>
    	<tr>
    		<th>商品名称</th>
    		<th>商品类型</th>
    		<th>所属商家</th>
    		<th>商品数量</th>
    		
    	</tr>
    	</thead>
    	<tbody>
    	<tr>
    		<td>${goodsDetail.goodName}</td>
    		<td>${goodsDetail.styleName}</td>
    		<td>${goodsDetail.shopName}</td>
    		<td>${goodsDetail.quantity}</td>
    	</tr>
    	</tbody>
    </table>
  </body>
</html>
