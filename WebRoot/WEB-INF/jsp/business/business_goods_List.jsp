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
					<li class="active"><a
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
							class="badge">1</span></a></li>
					<li><a
						href="${pageContext.request.contextPath }/getSysMsg.action">系统消息<span
							class="badge">2</span></a></li>

				</ul>
			</div>
			<!-- 主要容器 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="container-fluid">
					<div class="path">
						<span>当前位置：</span> <span><a
							href="${pageContext.request.contextPath }" class="normal">广东海洋大学</a></span>
						<span><a href="${pageContext.request.contextPath }">[切换地址]</a>
						</span>
					</div>
					<!-- 选择工具栏 -->
						<div class="row list-menu">
							<ul class="nav nav-tabs">
								<li class="active"><a
									href="${pageContext.request.contextPath }/getGoodsList.action">全部商品</a></li>
								<li><a
									href="${pageContext.request.contextPath }/getHotSellGoods.acton">热卖商品</a></li>
								<li><a
									href="${pageContext.request.contextPath }/toAddGood.action">新品上架</a></li>
							</ul>
						</div>

					<div class="row">
						<%-- <c:forEach items="${goodsList}" var="goods"> --%>
						<c:forEach items="${goodsList}" var="goods">
							<div class="col-sm-6 col-md-4 col-lg-3 goodsCon">
								<div class="thumbnail">
									<a
										href="${pageContext.request.contextPath }/getGoodDetail.action?id=${goods.id}"
										title="点击查看${goods.goodName}详细信息"> <img class="lazy"
										src="${pageContext.request.contextPath }/upload/business/${goods.goodPic }" style="height: 150px;"
										data-src="" alt="${goods.goodName}">
									</a>
									<div class="caption">
										<h4>
											<a
												href="${pageContext.request.contextPath }/getGoodDetail.action?id=${goods.id}"
												title="点击查看${goods.goodName}详细信息" onclick="">${goods.goodName}<br>
											</a> <small>￥${goods.price}/份</small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<small>剩余：<i style="font-size: 1.8em;color: #1e89e0;">${goods.quantity}</i>份</small>
										</h4>
										简介： <small>${goods.goodIntro}</small>
										<div class="btn-goods-edit">
											<a class="btn btn-primary btn-xs"
												href="${pageContext.request.contextPath }/toGoodEdit.action?id=${goods.id}">修改</a>
											<a class="btn btn-primary btn-xs"
												href="${pageContext.request.contextPath }/deleteGood.action?id=${goods.id}"
												onclick="if(!delConfirm())return false">删除</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>

				</div>

			</div>
		</div>
	</div>

</body>
</html>
