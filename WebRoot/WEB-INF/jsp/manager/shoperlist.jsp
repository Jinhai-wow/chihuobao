<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询商品列表</title>
</head>
<body>
	<form
		action="${pageContext.request.contextPath }/item/queryitem.action"
		method="post">
		查询条件：
		<table width="100%" border=1>
			<tr>
				<td><input type="submit" value="查询" /></td>
			</tr>
		</table>
	</form>
	商品列表：
	 <form action="${pageContext.request.contextPath }/manager/deletestorer.action" method="post"> 
	<%-- <%-- <form action="${pageContext.request.contextPath }/updates.action" 
		method="post"> --%>
		<table width="100%" border=1>
			<tr>
				<td><input type="checkbox" name="ids" value=""></td>
				<td>商品名称</td>
				<td>商品价格</td>
				<td>生产日期</td>

				<td>操作</td>
			</tr>
			<c:forEach items="${storer }" var="storer" varStatus="s">
				<tr>
					<td><input type="checkbox" name="ids" value="${storer.id }"></td>
					<td><input type="text" name="itemsList[${s.index}].name"
						value="${storer.storerName }"></td>
					<td><input type="text" name="itemsList[${s.index }].price"
						value="${storer.password }"></td>
					<td><input:formatDate value="${storer.storerRegistTime}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>


					<td><a
						href="${pageContext.request.contextPath }/manager/itemEdit.action?id=${storer.id}">修改</a></td>

				</tr>
			</c:forEach>
		</table>
		<input type="submit" value="删除"> 
	</form>

</body>

</html>