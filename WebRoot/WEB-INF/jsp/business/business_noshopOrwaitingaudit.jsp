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
<title>商品列表</title>

<!-- Bootstrap core CSS -->
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
							aria-haspopup="true" aria-expanded="false"> <c:choose>
									<c:when test="${'' eq business.shop.shopName} ">
									尚未申请商店
								</c:when>
									<c:otherwise>
								${business.shop.shopName } 
								</c:otherwise>
								</c:choose> <span class="caret"></span></a>
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

				<c:choose>
					<c:when test="${0 eq business.shop.auditState}">
						<!-- 商店资格待审核 -->
						<h4 class="sub-header">订单中心</h4>
						<ul class="nav nav-sidebar">
							<li><a href="">全部订单 </a></li>
						</ul>
						<h4 class="sub-header">商品中心</h4>
						<ul class="nav nav-sidebar">
							<li><a
								href="${pageContext.request.contextPath }/getGoodsList.action">全部商品</a></li>
						</ul>
						<h4 class="sub-header">服务中心</h4>
						<ul class="nav nav-sidebar">
							<li><a
								href="${pageContext.request.contextPath }/getMyService.action">我的资金</a></li>
						</ul>
						<h4 class="sub-header">我的消息</h4>
						<ul class="nav nav-sidebar">
							<li><a
								href="${pageContext.request.contextPath }/getUserComment.action">用户评论<span
									class="badge"></span></a></li>
							<li><a
								href="${pageContext.request.contextPath }/getSysMsg.action">系统消息<span
									class="badge"></span></a></li>

						</ul>
					</c:when>
					<c:otherwise>
						<!-- 审核失败或没有商店 -->
						<h4 class="sub-header">订单中心</h4>
						<ul class="nav nav-sidebar">
							<li><a href="">全部订单 </a></li>
						</ul>
						<h4 class="sub-header">商品中心</h4>
						<ul class="nav nav-sidebar">
							<li><a href="">全部商品</a></li>
						</ul>
						<h4 class="sub-header">服务中心</h4>
						<ul class="nav nav-sidebar">
							<li><a href="">我的资金</a></li>
						</ul>
						<h4 class="sub-header">我的消息</h4>
						<ul class="nav nav-sidebar">
							<li><a href="">用户评论<span class="badge"></span></a></li>
							<li><a href="">系统消息<span class="badge"></span></a></li>

						</ul>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- 主要容器 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="container-fluid">
					<div class="path">
						
					</div>
					<hr>
					<div>
						<c:choose>
							<c:when test="${business.shop.id != shopData.shopId}">

								<div class="panel panel-default"
									style="text-align: center;vertical-align: middle;">
									<div class="panel-body">
										商店审核资料未完善，<a
											href="${pageContext.request.contextPath }/toShopDataIn.action"
											class="btn btn-default">点击前往完善资料</a>
									</div>
								</div>

							</c:when>
							<c:when test="${2 eq business.shop.auditState}">

								<div class="panel panel-default"
									style="text-align: center;vertical-align: middle;">
									<div class="panel-heading">
										<h3 class="panel-title">商店资格审核失败,已暂时封锁您的商店</h3>
									</div>
									<div class="panel-body">失败原因：${shopData.advice }</div>
									<div class="panel-footer">
										请<a href="${pageContext.request.contextPath }/toShopIn.action"
											class="btn btn-default">重新填写商店审核资料</a>
									</div>
								</div>

							</c:when>
							<c:otherwise>

								<div class="panel panel-default"
									style="text-align: center;vertical-align: middle;">
									<div class="panel-body">
										尚未申请你的商店，<a
											href="${pageContext.request.contextPath }/toShopIn.action"
											class="btn btn-default">点击前往申请开店</a>
									</div>
								</div>

							</c:otherwise>
						</c:choose>

					</div>

				</div>

			</div>

		</div>
	</div>
	</div>

</body>
</html>
