<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<title>服务中心</title>

<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/business.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/business.js"></script>
<script
	src="${pageContext.request.contextPath }/js/ie-emulation-modes-warning.js"></script>

</head>

<body>
	<div id="head">
		<nav class="navbar navbar-default navbar-fixed-top bgcolor navset">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand"
						href="${pageContext.request.contextPath }/getBusiness.action"
						title="商家首页"><img class="chb-logo"
						src="${pageContext.request.contextPath }/img/chb-logo-business.jpg"
						alt="吃货宝"></a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="${pageContext.request.contextPath }">规则中心</a></li>
						<li class="dropdown"><a
							href="${pageContext.request.contextPath }"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">${business.shop.shopName }
								<span class="caret"></span>
						</a>
							<ul class="dropdown-menu fc-black">
								<li><a
									href="${pageContext.request.contextPath }/getShopMsg.action">个人中心</a></li>
								<li><a href="${pageContext.request.contextPath }">退出登录</a></li>
							</ul></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>
	</div>

	<div class="container">
		<div class="row goods-row">
			<div class="col-sm-3 col-md-2 sidebar text-center">
				<div class="account-img">
					<a href="${pageContext.request.contextPath }/getAccount.action"
						title="点击查看账号信息" class="headerLink col-xs-12"> <img
						class="img-responsive img-thumbnail"
						style="width: 80px;height: 80px;"
						src="${pageContext.request.contextPath }/upload/business/${business.storerAccount.storerPic }" alt="账号头像" />
					</a> <span class="accountName">${business.storerAccount.storerName }</span>
				</div>
				<h4 class="sub-header">订单中心</h4>
				<ul class="nav nav-sidebar">
					<li><a
						href="${pageContext.request.contextPath }/getOrdersList.action">全部订单
							<span class="sr-only">(current)</span>
					</a></li>
				</ul>
				<h4 class="sub-header">商品中心</h4>
				<ul class="nav nav-sidebar">
					<li><a
						href="${pageContext.request.contextPath }/getGoodsList.action">全部商品</a></li>
				</ul>
				<h4 class="sub-header">服务中心</h4>
				<ul class="nav nav-sidebar">
					<li class="active"><a
						href="${pageContext.request.contextPath }/getMyService.action">我的资金</a></li>
				</ul>
				<h4 class="sub-header">我的消息</h4>
				<ul class="nav nav-sidebar">
					<li><a
						href="${pageContext.request.contextPath }/userComment.action?shopId=${business.shop.id}">用户评论<span
							class="badge"></span></a></li>
					<li><a
						href="${pageContext.request.contextPath }/getSysMsg.action">系统消息</a></li>

				</ul>
			</div>
			<!-- 主要容器 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="container-fluid">
					<div class="path">
						
					</div>
					<blockquote>我的资金</blockquote>
					<table class="table">
						<tbody>
							<tr>
								<td style="vertical-align: bottom;padding-bottom: 20px"
									align="right" class="col-xs-8" colspan="3">账户余额：</td>
								<td class=""><big>￥&nbsp;</big> <span class="myMoney"
									style="font-size: 3em;color: #1e89e0;">${myService.storerAccount.storerMoney }</span></td>
							</tr>
							<tr>
								<td align="right" class="col-xs-4">支出：</td>
								<td><a
									href="${pageContext.request.contextPath }/getMyDisbursement.action">￥&nbsp;${myService.disbursement}</a></td>
								<td align="right" class="col-xs-2">收入：</td>
								<td><a
									href="${pageContext.request.contextPath }/getMyIcome.action">￥&nbsp;${myService.income}</a></td>
							</tr>
						</tbody>
					</table>
					<blockquote>我的账单</blockquote>
					<table class="table">
						<thead>
							<tr>
								<th class="col-xs-3">时间</th>
								<th class="col-xs-3">收入</th>
								<th class="col-xs-3">支出</th>
								<th class="col-xs-3">数据来源</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${myService.orders }" var="orders">
								<tr>
									<td><fmt:formatDate value="${orders.createtime}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td>￥&nbsp;${orders.totalmoney}</td>
									<td>￥&nbsp;${myService.disbursement }</td>
									<td><a
										href="${pageContext.request.contextPath }/getOrderDetail.action?id=${orders.id}">${orders.id}</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>

</body>
</html>
