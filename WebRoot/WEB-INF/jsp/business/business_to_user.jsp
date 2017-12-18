<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>${shopMsg.shop.shopName }</title>
<link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="icon/iconfont.css">
<link href="icon/icon.css" rel="stylesheet" type="text/css">
<style>
/*-------------全局设置 开始-------------------*/
a, a:hover, a:visited, a:active, a:link {
	text-decoration: none;
	color: black;
}

ul, li {
	list-style: none;
	text-decoration: none;
}

em {
	font-style: normal;
	font-weight: 400;
	font-size: 14px;
}
/*-------------全局设置 结束-------------------*/

/*---------------head部分 开始-------------------*/
#head {
	position: absolute;
	width: 100%;
}

#head nav.navbar {
	border: 0;
}

#head nav.navset {
	margin-bottom: 0;
}

#head nav:first-of-type a {
	color: #FFF;
	font-size: 16px;
	user-select: none;
}
/*font-color-black*/
#head .fc-black li a {
	color: black;
}

.chb-logo {
	position: relative;
	top: -8px;
}

.bgcolor {
	/*     background-color: #1e89e0;*/
	background-color: transparent;
}

.navbar-default .navbar-nav>.open>a, .navbar-default .navbar-nav>.open>a:focus,
	.navbar-default .navbar-nav>.open>a:hover {
	background-color: rgba(221, 221, 221, 0.3);
}

.dropdown-menu {
	min-width: 143px;
}

.dropdown-menu:hover {
	background-color: rgba(221, 221, 221, 1);
}

#navbar ul li:hover {
	background-color: rgba(222, 222, 222, 0.1);
}

/*---------------head部分 结束-------------------*/

/*---------------main部分 开始-------------------*/
#main {
	width: 100%;
	height: 100%;
	position: relative;
	top: 0;
	left: 0;
	right: 0;
	background: transparent;
}

.bg-img {
	width: 100%;
	background: 100% url(img/shop-bg.jpg) no-repeat;
	background-size: cover;
}

.shop {
	position: relative;
	display: table;
	height: 192px;
	padding: 0;
	top: 0px;
	font-size: 0;
}

.shop .shop-info {
	position: relative;
	display: table-cell;
	vertical-align: middle;
	color: #fff;
	z-index: 1;
}

.shop .shop-info>img {
	margin-right: 15px;
	width: 95px;
	height: 95px;
	border-radius: 50%;
	border: 4px solid rgba(255, 255, 255, 0.3);
	vertical-align: middle;
}

.shop .shop-info-wrapper {
	display: inline-block;
	vertical-align: middle;
}

.shop .shop-info-wrapper h1 {
	font-size: 20px;
	max-width: 270px;
	display: inline-block;
	vertical-align: middle;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	margin: 0;
	padding: 0;
}

.shop .shop-info-wrapper .shop-info-rate {
	margin: 10px 0;
	display: block;
}

.shop .shop-info-wrapper .starrating {
	display: inline-block;
	width: 150px;
	font-size: 14px;
	color: #FFF;
	white-space: nowrap;
	user-select: none;
}

.shop .shop-info-wrapper .starrating i {
	color: #ffc30c;
}

.shop .shop-info-wrapper .starrating a {
	color: #FFF;
}

.shop .shop-info-wrapper .monthsales {
	margin-left: 5px;
	display: inline-block;
}

.shop .shop-server {
	width: 700px;
	display: table-cell;
	padding-right: 100px;
	vertical-align: middle;
	color: #FFF;
	text-align: center;
}

.shop .shop-server span {
	display: inline-block;
	margin-left: 80px;
	vertical-align: top;
	text-align: center;
}

.shop .shop-server span:first-of-type {
	margin-left: 0;
}

.shop .shop-server span em:last-of-type {
	display: block;
	margin-top: 12px;
	margin-bottom: 3px;
	font-size: 18px;
}

.shop .shop-favor {
	position: absolute;
	top: 50px;
	right: 0;
	padding: 10px 5px;
	width: 80px;
	text-align: center;
	background-color: rgba(255, 255, 255, 0.1);
	border-radius: 0 0 5px 5px;
	color: #eee;
	font-size: 14px;
}

.shop .shop-favor i {
	font-size: 20px;
}

.shop .shop-favor span {
	display: block;
}

.shop-nav .shop-nav-inner {
	line-height: 57px;
	background-color: rgba(0, 0, 0, 0.1);
}

.shop-nav .shop-nav-left {
	float: left;
	width: 75%;
	user-select: none;
}

.shop-nav .shop-nav-table {
	width: 112px;
	position: relative;
	display: inline-block;
	vertical-align: middle;
	color: #333;
	font-size: 16px;
	text-align: center;
}

.shop-nav .active {
	color: #0089dc;
}

.shop-nav .active:after {
	content: "";
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	border-top: 3px solid;
}

.shop-nav .shop-nav-left a:nth-of-type(n+2):before {
	content: "";
	position: absolute;
	left: 0;
	top: 50%;
	margin-top: -7px;
	height: 14px;
	width: 1px;
	background-color: #CCC;
}

.shop-nav .shop-nav-filter {
	float: right;
}

.shop-nav .shop-search {
	display: inline-block;
	margin: 10px 0;
	height: 32px;
	width: 260px;
	line-height: 32px;
	border: 1px solid #ccc;
	background: #fff;
	float: right;
}

.shop-search .search {
	height: 30px;
	width: 190px;
	line-height: 24px;
	font-size: 16px;
	border: 0;
	outline: 0;
	padding: 4px 0;
	margin: 0 8px;
	cursor: auto;
	background-color: #FFF;
	vertical-align: text-bottom;
}

.shop-search .search-btn {
	display: inline-block;
	width: 30px;
	height: 30px;
	text-align: center;
	border: none;
	color: #999;
	cursor: pointer;
	outline: 0;
	background: transparent;
	line-height: 24px;
	padding: 4px 0;
	margin: 0 8px;
	vertical-align: text-bottom;
}

.shop-search .search-btn i {
	font-size: 20px;
}

.shop-search .search-btn i:hover {
	color: #5eaeeb;
}

.shop-main {
	margin-top: 20px;
}

.shop-main .shop-menu {
	float: left;
	width: 75%;
}

.shop-main .shop-menu-nav {
	max-height: 249px;
	padding: 10px 15px 5px;
	background-color: rgba(0, 0, 0, 0.1);
	border: #eee;
	z-index: 101;
}

.shop-main .shop-menu-nav>a {
	display: inline-block;
	margin: 5px;
	padding: 3px 10px;
	width: 18%;
	border-radius: 2px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	vertical-align: top;
}

.shop-main .shop-menu-nav>a:hover {
	background-color: rgba(255, 255, 255, 0.3);
}

.shop-main .shop-menu-main {
	margin-top: 0;
}

.shop-right {
	float: right;
	width: 23.6%;
}

.shop-right .bulletin {
	margin-bottom: 20px;
	border-radius: 2px 2px 0 0;
	background-color: #fff;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.12);
}

.bulletin .bulletin-title {
	padding: 0 1em;
	margin: 0;
	line-height: 2.8em;
	background-color: #0089dc;
	color: #fff;
	display: block;
	font-size: 1.17em;
}

.bulletin .bulletin-content {
	padding: 10px 13px;
	line-height: 2;
	margin: 0;
	background-color: #f5f5f5;
}

.bulletin .delivery {
	padding: 10px 13px;
}

.bulletin .delivery>h4 {
	font-weight: 700;
	margin: 0 0 5px 0;
	font-size: 14px;
}

.bulletin .delivery>p {
	margin: 0;
}

.bulletin>a:last-of-type {
	display: block;
	line-height: 3;
	text-align: center;
	font-size: 18px;
	color: #666;
	border-top: 1px solid #eee;
	background-color: #eee;
}

.menu-main-content h3 {
	padding: 20px 0 10px 15px;
	font-size: 20px;
	color: #333;
}

.menu-main-content h3>span {
	font-size: 12px;
	color: #999;
}

.menu-main-content .goods {
	position: relative;
	float: left;
	margin-right: 2%;
	padding-right: 10px;
	width: 48%;
	margin-bottom: 12px;
	font-size: 12px;
	background-color: #fff;
	border: 1px solid #eee;
	height: 102px;
}

.menu-main-content .goods-img img {
	float: left;
	margin-right: 14px;
	width: 100px;
	height: 100px;
	border: 0;
}

.menu-main-content .goods-name {
	display: block;
	margin: 10px 0 0 0;
	font-size: 16px;
	font-weight: 700;
	overflow: hidden;
	white-space: normal;
	text-overflow: ellipsis;
}

.menu-main-content .goods-msg p:first-of-type {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	padding: 0;
	margin: 0;
	font-size: 12px;
	color: #999;
}

.menu-main-content .goods-msg .starrating {
	display: inline-block;
	width: 150px;
	font-size: 12px;
	color: #ffc30c;
	white-space: nowrap;
}

.menu-main-content .goods-msg .monthsales {
	color: #999;
	margin-left: 5px;
	display: inline-block;
}

.menu-main-content .goods-price {
	color: #f74342;
	font-size: 14px;
	font-weight: 700;
	position: absolute;
	bottom: 10px;
}

.goods .btn-wrapper {
	float: right;
	display: inline-block;
	vertical-align: middle;
}

.btn-wrapper .btn-control {
	font-size: 0;
}

.btn-control .cart-add, .cart-decrease {
	display: inline-block;
	padding: 6px;
	line-height: 24px;
	font-size: 24px;
	color: rgb(0, 160, 220);
}

.btn-control .cart-count {
	display: inline-block;
	padding-top: 6px;
	vertical-align: top;
	text-align: center;
	font-size: 10px;
	line-height: 24px;
	color: rgb(147, 153, 159);
}

.shop-main .shop-cart {
	z-index: 102;
	position: fixed;
	right: 0;
	bottom: 0;
	width: 320px;
	height: 46px;
	font-size: 14px;
}

.shop-cart .shop-cartbasket {
	top: 0px;
	height: auto;
	z-index: 1;
	position: absolute;
	width: 100%;
	background-color: #fff;
	box-shadow: 0 1px 15px #ccc;
}

.shop-cart .shop-grouphead {
	padding: 12px 10px;
	height: 45px;
	position: relative;
	border-bottom: 1px solid #eee;
	font-size: 14px;
}

.shop-cart .single {
	background-color: #FAFAFA;
	border-top: 2px solid #0089dc;
}

.shop-cart .shop-grouphead-row {
	height: 30px;
}

.shop-cart .shop-grouphead-row>a {
	color: #0089dc;
}

.shop-cart .shop-cartbasket-empty {
	color: #999;
	text-align: center;
}

.shop-cart .shop-cartbasket-empty>p {
	font-size: 14px;
	padding: 0;
	margin: 0 0 40px 0;
}

.shop-cart .shop-cartbasket-tablerow {
	display: table;
	table-layout: fixed;
	height: 45px;
	width: 100%;
	padding: 0 10px;
	/*margin-top: -1px;*/
	font-size: 14px;
}

.shop-cartbasket-tablerow .cell.itemname {
	width: 50%;
	margin-right: 10px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	color: #666;
}

.shop-cartbasket-tablerow .cell {
	display: table-cell;
	vertical-align: middle;
	border-bottom: 1px solid #eee;
}

.shop-cartbasket-tablerow .cell.itemquantity {
	width: 35%;
	text-align: center;
	font-size: 0;
}

.shop-cartbasket-tablerow .cell.itemquantity button {
	background-color: #fff;
	height: 20px;
	width: 20px;
	line-height: 18px;
	vertical-align: top;
	border: 1px solid #ddd;
	outline: 0;
	cursor: pointer;
	color: #666;
	margin: 0;
	padding: 0;
	font-size: 12px;
}

.shop-cartbasket-tablerow .cell.itemquantity input {
	border: 0;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	height: 20px;
	width: 30px;
	line-height: 20px;
	font-size: 12px;
	vertical-align: top;
	text-align: center;
	outline: 0;
	color: #666;
}

.shop-cartbasket-tablerow .cell.itemquantity input:focus {
	outline-offset: -2px;
}

.shop-cartbasket-tablerow  .cell.itemtotal {
	text-align: center;
	color: #f17530;
}

.shop-cart .shop-cartfooter {
	z-index: 2;
	position: relative;
	cursor: pointer;
	height: 46px;
	background-color: #2c2c2c;
	box-shadow: 0 1px 3px #2c2c2c;
}

.shop-cart .icon-cart {
	position: relative;
	width: 40px;
	text-align: center;
	color: #FFF;
	font-size: 20px;
	display: inline-block;
	vertical-align: middle;
}

.shop-cart .shop-cartpieces {
	position: absolute;
	top: -6px;
	left: 22px;
	height: 16px;
	line-height: 14px;
	min-width: 16px;
	border-radius: 50%;
	font-size: 12px;
	text-align: center;
	background-color: #ff2828;
	color: #FFF;
	font-weight: 700;
}

.price {
	font-size: 24px;
	color: #FFF;
	display: inline-block;
	vertical-align: middle;
}

.shop-cart .shop-cartfooter-text {
	position: relative;
	font-size: 12px;
	margin-left: 2px;
	padding: 0 6px;
	color: #999;
	border-left: 1px solid #555;
	line-height: 1;
	display: inline-block;
	vertical-align: middle;
	box-sizing: border-box;
}

.shop-cart .shop-cartfooter-checkout.disabled {
	background-color: #e4e4e4;
	color: #333;
	cursor: default;
}

.shop-cart .shop-cartfooter-checkout {
	position: absolute;
	top: 0;
	bottom: 0;
	right: 0;
	border: 0;
	outline: 0;
	width: 120px;
	text-align: center;
	font-weight: 700;
	background-color: #51d862;
	color: #FFF;
	cursor: pointer;
}
/*---------------main部分 结束-------------------*/

/*---------------footer部分 开始-------------------*/
#footer {
	margin-top: 50px;
}

#footer .row .nav li:first-of-type {
	font-size: 14px;
	line-height: 30px;
	font-weight: 400;
}

#footer .row .nav li a {
	padding: 0;
	margin: 0;
	font-size: 12px;
	color: #999;
	display: block;
	line-height: 24px;
	text-decoration: none;
	width: 50%;
}

.footer-copyright {
	padding-top: 60px;
}

.footer-copyright .owner {
	display: block;
	text-align: center;
	color: #0e0e0e;
	font-weight: 400;
	font-size: 12px;
	margin: 0;
	padding: 0;
}

.footer-copyright p {
	margin: 0;
	padding: 0;
	color: #999;
	text-align: center;
}

.footer-copyright p a {
	text-decoration: none;
	color: #999;
}
/*---------------footer部分 结束-------------------*/
</style>
</head>
<body>

	<div id="big-box">
		<div id="head">
			<nav class="navbar navbar-default navbar-static-top bgcolor navset">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="#"> <img class="chb-logo"
						src="img/chb-logo.png" alt="吃货宝">
					</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="#">首页</a></li>
						<li><a href="#">我的订单</a></li>
						<li><a href="#">加盟合作</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">规则中心</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> 13729000000 <span class="caret"></span>
						</a>
							<ul class="dropdown-menu fc-black">
								<li><a href="#">个人中心</a></li>
								<li><a href="#">我的收藏</a></li>
								<li><a href="#">我的地址</a></li>
								<li><a href="#">安全设置</a></li>
								<li><a href="#">退出登录</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			</nav>
		</div>

		<div id="main">
			<div class="bg-img">
				<div class="container shop">
					<div class="shop-info">
						<img
							src="${pageContext.request.contextPath}/upload/business/${shopMsg.shop.shopPic}"
							alt="">
						<div class="shop-info-wrapper">
							<div>
								<h1 title="农家咸骨粥第一店">${shopMsg.shop.shopName }</h1>
							</div>
							<p class="shop-info-rate">
							<div class="starrating-content">
								<span class="starrating"> </span> 
								<a href="">( 645 )</a> 
								<input id="shopScore" type="hidden" value="${shopMsg.shop.shopScore }">
								<span class="monthsales">月售${shopMsg.orderCounts }单</span>
							</div>
							</p>
						</div>
					</div>
					<div class="shop-server">
						<span> <em>起送价</em> <em><span id="startPrice">${shopMsg.shop.startPrice }</span>元</em>
						</span><span> <em>配送费</em> <c:choose>
								<c:when test="${0.0 eq shopMsg.shop.deliveryCost}">
									<em>免费配送</em>
									<input type="hidden" id="deliveryCost" value="0.0">
								</c:when>
								<c:otherwise>
									<em><span id="deliveryCost">${shopMsg.shop.deliveryCost }</span>元</em>
								</c:otherwise>
							</c:choose>
							<input type="hidden" id="businessId"
										value="${shopMsg.shop.id }">
						</span><span> <em>平均送达速度</em> <em>49分钟</em>
						</span>
					</div>
					<a href="#" class="shop-favor"> <i class="icon Hui-iconfont">&#xe648;</i>
					<!--&#xe649;取消--> <span>收藏</span>
					</a>
				</div>
			</div>
			<div class="shop-nav">
				<div class="shop-nav-inner">
					<div class="container clearfix">
						<div class="shop-nav-left">
							<a class="shop-nav-table active" href="#">所有商品</a> <a
								class="shop-nav-table" href="#">评价</a> <a class="shop-nav-table"
								href="#">商家资质</a> <span class="shop-nav-filter"> </span>
						</div>
						<div class="shop-search">
							<form>
								<input class="search" type="text" maxlength="30"
									placeholder="搜索商家,美食..."> <a href="#"
									class="search-btn"><i class="icon Hui-iconfont">&#xe665;</i></a>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="container shop-main">
				<div class="shop-menu">
					<div class="shop-menu-nav">
						<a href="#">热销</a> <a href="#">优惠</a> <a href="#">配品</a> <a
							href="#">店长热荐</a> <a href="#">必点</a>
					</div>
					<div class="shop-menu-main">
						<div class="menu-main-content">
							<div>
								<h3>
									新推商品 <span>NEW</span>
								</h3>
								<c:forEach items="${goodslist }" var="list">
									<div class="goods">
										<span class="goods-img"> <a id="${list.id}"
											href="javascript:;" data-toggle="modal"
											data-target="#myModal"> <img
												src="${pageContext.request.contextPath}/upload/business/${list.goodPic}"
												alt="">
										</a>
										</span> <span class="goods-name" data-id="1">${list.goodName}</span>
										<div class="goods-msg">
											<p>${list.goodIntro}</p>
											<div class="">
												<span class="starrating"> <i
													class="icon Hui-iconfont">&#xe6ff;</i> <i
													class="icon Hui-iconfont">&#xe6ff;</i> <i
													class="icon Hui-iconfont">&#xe6ff;</i> <i
													class="icon Hui-iconfont">&#xe701;</i> <i
													class="icon Hui-iconfont">&#xe702;</i> <span
													class="monthsales">(90)月售111份</span>
												</span>
											</div>
										</div>
										<span></span> <span class="goods-price">&yen;${list.price}</span>
									</div>
									<!-- goodslist -->
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="shop-right">
					<div>
						<div class="bulletin">
							<h3 class="bulletin-title">商家公告</h3>
							<p class="bulletin-content">${shopMsg.shop.announce }</p>
							<div class="delivery">
								<h4>配送说明：</h4>
								<p>免费配送</p>
							</div>
							<a href="">举报商家</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer id="footer">
		<div class="container clearfix">
			<div class="row">
				<div class="col-xs-2">
					<ul class="nav nav-sidebar">
						<li><span>商务合作</span></li>
						<li><a href="#">我要开店</a></li>
						<li><a href="#">加盟指南</a></li>
						<li><a href="#">市场合作</a></li>
						<li><a href="#">开放平台</a></li>
					</ul>
				</div>
				<div class="col-xs-2">
					<ul class="nav nav-sidebar">
						<li><span>商务合作</span></li>
						<li><a href="#">我要开店</a></li>
						<li><a href="#">加盟指南</a></li>
						<li><a href="#">市场合作</a></li>
						<li><a href="#">开放平台</a></li>
					</ul>
				</div>
				<div class="col-xs-2">
					<ul class="nav nav-sidebar">
						<li><span>商务合作</span></li>
						<li><a href="#">我要开店</a></li>
						<li><a href="#">加盟指南</a></li>
						<li><a href="#">市场合作</a></li>
						<li><a href="#">开放平台</a></li>
					</ul>
				</div>
				<div class="col-xs-3">
					<ul class="nav nav-sidebar">
						<li><span>商务合作</span></li>
						<li><a href="#">我要开店</a></li>
						<li><a href="#">加盟指南</a></li>
						<li><a href="#">市场合作</a></li>
						<li><a href="#">开放平台</a></li>
					</ul>
				</div>
				<div class="col-xs-3">
					<ul class="nav nav-sidebar">
						<li><span>商务合作</span></li>
						<li><a href="#">我要开店</a></li>
						<li><a href="#">加盟指南</a></li>
						<li><a href="#">市场合作</a></li>
						<li><a href="#">开放平台</a></li>
					</ul>
				</div>
			</div>
			<div class="footer-copyright">
				<span class="owner">所有方：广东九州有限公司</span>
				<p>
					增值电信业务许可证 : <a href="#">沪B2-20150033</a> | <a href="#">沪ICP备
						09007032</a> | <a href="#">上海工商行政管理</a> Copyright ©2008-2017 ele.me,
					All Rights Reserved.
				</p>
			</div>
		</div>
		</footer>
	</div>

	<!-- 模态框（Modal） -->
	<div class="modal fade" style="margin-right:21%" id="myModal"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog"">
			<div class="modal-content" style="width: 150%;">
				<%-- <form class="form-horizontal" role="form"
						action="${pageContext.request.contextPath }/addGoodStyle.action"
						method="post"> --%>
				<div class="modal-header" style="margin-right:7%;border: none;">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body" style="margin-right:7%;height:300px;">
					<div class="goodimg col-xs-8">
						<img class="col-xs-12" height="300px" width="600px" alt="商品图片"
							src="${pageContext.request.contextPath}/img/null.png"
							id="good_img">
					</div>
					<div class="goodmsg col-xs-4">
						<table>
							<tbody>
								<tr>
									<td colspan="2"><p id="good_name"
											style="font-size: 1.3em;margin-bottom: 25px;">商品名商品名商品名</p></td>
								</tr>
								<tr>
									<td><p id="good_price"
										style="color:red;font-size: 2em;margin-bottom: 10px;">￥20</p></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2" style="color:#ccc">用户评价：</td>
								</tr>
								<tr>
									<td colspan="2" style="color:#FFC30C"> 
										<span class="starrating">
										<i class="icon Hui-iconfont">&#xe6ff;</i> 
										<i class="icon Hui-iconfont">&#xe6ff;</i> 
										<i class="icon Hui-iconfont">&#xe6ff;</i> 
										<i class="icon Hui-iconfont">&#xe701;</i> 
										<i class="icon Hui-iconfont">&#xe702;</i> 
										</span>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="color:#FFC30C"> 
										<span class="starrating">
										<i class="icon Hui-iconfont">&#xe6ff;</i> 
										<i class="icon Hui-iconfont">&#xe6ff;</i> 
										<i class="icon Hui-iconfont">&#xe6ff;</i> 
										<i class="icon Hui-iconfont">&#xe701;</i> 
										<i class="icon Hui-iconfont">&#xe702;</i> 
										</span>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="color:#FFC30C"> 
										<span class="starrating">
										<i class="icon Hui-iconfont">&#xe6ff;</i> 
										<i class="icon Hui-iconfont">&#xe6ff;</i> 
										<i class="icon Hui-iconfont">&#xe6ff;</i> 
										<i class="icon Hui-iconfont">&#xe701;</i> 
										<i class="icon Hui-iconfont">&#xe702;</i> 
										</span>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="color:#FFC30C"> 
										<span class="starrating">
										<i class="icon Hui-iconfont">&#xe6ff;</i> 
										<i class="icon Hui-iconfont">&#xe6ff;</i> 
										<i class="icon Hui-iconfont">&#xe6ff;</i> 
										<i class="icon Hui-iconfont">&#xe701;</i> 
										<i class="icon Hui-iconfont">&#xe702;</i> 
										</span>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="color:#FFC30C"> 
										<span class="starrating">
										<i class="icon Hui-iconfont">&#xe6ff;</i> 
										<i class="icon Hui-iconfont">&#xe6ff;</i> 
										<i class="icon Hui-iconfont">&#xe6ff;</i> 
										<i class="icon Hui-iconfont">&#xe701;</i> 
										<i class="icon Hui-iconfont">&#xe702;</i> 
										</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer" style="margin-right:7%;border: none;">
					<button id="addGoodStyle" type="submit" class="btn btn-primary"
						onclick="">立即购买</button>
				</div>
				<!-- </form> -->
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>


	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script>
$(document).ready(function(){
    var getUserId = 1;
    var getShopId = $("#businessId").val();
    
    //起送价
    var minPrice = $("#startPrice").html();
    //记录商品总价
    var totalPrice = 0;
    //配送费
    var freight = $("#deliveryCost").val();
    var shopScore = $("#shopScore").val();
    /* alert(shopScore); */
    createShopcart(getUserId,getShopId,minPrice);
    showList(getUserId,getShopId);

   	function createShopcart(getUserId,getShopId,minPrice) {
         //创建元素方法
         function createEle(eleName,className,parent) {
             var create  = document.createElement(eleName);
             className ? create.className = className:'';
             parent? parent.appendChild(create):'';
             return create;
         }
            //从session中获取getUserId、getShopId

            //是否可以支付
            var isPay = false;
            //购物车商品数组
            var shopCartFoods = [];
            //初始化购物车
            var shopCartEl = initShopCart();
            //按钮添加到页面
            initBtn()
            //绑定支付按钮
            pay();
            function initShopCart() {
                var parent = $(".shop-menu")[0];
                var div = createEle("div","",parent);
                var shopCart = createEle("div","shop-cart",div);


                var shopCartbasket = createEle("div","shop-cartbasket",shopCart);
                var shopCartbasketInner = createEle("div","",shopCartbasket);
                var shopGrouphead = createEle("div","shop-grouphead single",shopCartbasketInner);
                var shopGroupheadRow = createEle("div","shop-grouphead-row",shopGrouphead);
                shopGroupheadRow.innerHTML = '购物车'+'<a href="#">[清空]</a>';
                var empty = shopGroupheadRow.querySelectorAll("a")[0];

                var shopCartfooter = createEle("div","shop-cartfooter",shopCart)
                var iconCart = createEle("span","icon-cart",shopCartfooter);
                iconCart.innerHTML = '<i class="icon Hui-iconfont">&#xe6b9;</i>';

                var shopCartpieces = createEle("span","shop-cartpieces",iconCart);
                var price = createEle("p","price",shopCartfooter);
                var shopCartfooterText = createEle("div","shop-cartfooter-text",shopCartfooter);
                var shopCartfooterCheckout = createEle("button","shop-cartfooter-checkout",shopCartfooter);

                //方便调用 声明购物车元素对象
                var cartObj = {
                    num:shopCartpieces,//购买数量
                    price:price,//商品总价格
                    desc:shopCartfooterText,//配送费
                    pay:shopCartfooterCheckout,//购买按钮
                    empty:empty,//清空
                    cartList:shopCartbasket,//购物车列表
                    emptyBox:shopGrouphead//清空按键父元素

                }
                //隐藏商品数量
                cartObj.num.style.display ="none";
                cartObj.num.innerText = 0;
                //设置配送费
                cartObj.desc.innerHTML = '配送费¥'+freight;
                //设置商品总价格
                cartObj.price.innerText = 0;
                //设置支付按钮
                cartObj.pay.innerText = '购物车是空的';

                //点击购物车显示、隐藏
                $(shopCartfooter).on("click",function () {
                    shopCartClick();
                });
                //清空购物车
                $(empty).on("click",function () {
                    $(".menu-main-content .goods").each(function () {
                        var dec = $(this).find(".cart-decrease.icon-remove_circle_outline")[0];
                        dec.style.display ='none';
                        var count = $(this).find(".cart-count")[0];
                        count.innerHTML = 0;
                        count.style.display ='none';
                    })
                    shopCartFoods = [];
                    refreshShopCart();
                    removeLocalStorage();
                    //阻止冒泡
                    return false;
                });
                return cartObj;
            }
            //点击购物车，弹出、隐藏购物列表
            function shopCartClick(type) {
                var top = parseInt($(shopCartEl.cartList).css("top"));
                if(type=="up"){
                    var setTop = 0;
                    $(shopCartEl.cartList).children("div").each(function () {
                        setTop += $(this).outerHeight();
                    })
                    var setTop = -setTop;
                    $(shopCartEl.cartList).animate({top:setTop},0)
                }else if(type=="down"){
                    var setTop = 0;
                    $(shopCartEl.cartList).children("div").each(function () {
                        setTop += $(this).outerHeight();
                    })
                    var setTop = -setTop;
                    $(shopCartEl.cartList).animate({top:setTop},0)
                }else{
                    if(top == 0 || top == null){
                        var setTop = 0;
                        $(shopCartEl.cartList).children("div").each(function () {
                            setTop += $(this).outerHeight();
                        })
                        var setTop = -setTop;
                        $(shopCartEl.cartList).animate({top:setTop},0)
                    }else{
                        $(shopCartEl.cartList).animate({top:0},0)
                    }
                }
            }
            //绑定按键事件
            function initBtn() {
                var goodsDiv = $("div.goods");
                for(var i=0;i<goodsDiv.length;i++){
                    var btnWarpper = createEle("div","btn-wrapper",goodsDiv[i]);
                    var btnControl = creatBtnControl(decCartControl, addCartControl, 0);
                    btnWarpper.appendChild(btnControl);
                }
            }
            // 创建 按钮组建
            function creatBtnControl(decFn, addFn, count) {
                var btnControl = createEle("div","btn-control","");
                //减号按钮
                var cartDec = createEle("div","cart-decrease icon-remove_circle_outline",btnControl);
                cartDec.style.display = count ? 'inline-block' : 'none';
                $(cartDec).on("click",decFn);
                //按钮数量
                var cartCount = createEle("div","cart-count",btnControl)
                cartCount.style.display = count ? 'inline-block' : 'none';
                cartCount.innerHTML = count ? count : 0;
                //加号
                var cartAdd = createEle("div","cart-add icon-add_circle",btnControl)
                $(cartAdd).on("click",addFn);
                return btnControl;
            }
            //添加商品
            function addCartControl() {
                //数量span
                var count = this.previousElementSibling;
                //减号span
                var cartDec = count.previousElementSibling;
                //获取 当前按钮的商品信息
                var info = getThisGoodsInfo(this);
                //判断是否是同一个商店的 ， 不是就清空
                if(shopCartFoods.length>0){
                    for(var i=0;i<shopCartFoods.length;i++){
                        if(shopCartFoods[i].shopId != getShopId){
                            shopCartEl.empty.click();
                        }
                    }
                }
                //获取 数量
                var value = info.num;
                //数量 自身先加1 再赋值给页面元素
                count.innerHTML = ++value;
                // 因为数量增加  展示减号元素 和 count元素
                count.style.display = 'inline-block';
                cartDec.style.display = 'inline-block';
                // TODO: 准备好一个数组 把 商品信息添加到数组内
                var newInfo = getThisGoodsInfo(this);
                var index = hasItem(shopCartFoods, newInfo);

                if (index != -1) {
                    shopCartFoods[index] = newInfo; //存在替换
                } else {
                    shopCartFoods.push(newInfo)
                }
                //刷新购物车
                refreshShopCart()
                //添加商品购物车窗口变化
                shopCartClick("up")
                //存储购物车信息
                saveLocalStorage(shopCartFoods);
            }
            //删除商品
            function decCartControl() {
                //数量span
                var count = this.nextElementSibling;
                //获取 当前按钮的商品信息
                var info = getThisGoodsInfo(this);
                //获取 数量
                var value = info.num;
                //数量 自身先加1 再赋值给页面元素
                --value;
                // 因为数量为零 展示减号元素 和 count元素
                if (value <= 0) {

                    value = 0;

                    count.style.display = 'none';

                    this.style.display = 'none';
                }

                count.innerHTML = value+"";

                // TODO: 准备好一个数组 更新商品信息
                var newInfo =getThisGoodsInfo(this);
                var index = hasItem(shopCartFoods, newInfo)
                if (value == 0 && index != -1) {
                    shopCartFoods.splice(index, 1);
                } else if (value != 0 && index != -1) {
                    shopCartFoods[index] = newInfo
                }

                //刷新购物车
                refreshShopCart()
                //当商品减少到0的时候，购物车缩下去
                shopCartClick("down")
                //把购物车信息存储在localStorage
                saveLocalStorage(shopCartFoods);
            }
            //TODO:更新购物车组建
            function refreshShopCart() {
                //用来记录用户购买了多少件商品
                var count = 0;
				totalPrice = 0;
                if (shopCartFoods.length == 0) {
                    shopCartEl.cartList.style.top = 0;
                }
                for (var i = 0; i < shopCartFoods.length; i++) {
                    count += shopCartFoods[i].num;
                    totalPrice += shopCartFoods[i].num * shopCartFoods[i].price;
                }
                shopCartEl.price.innerHTML = '&yen;' + totalPrice;
                //根据数量处理 购物车数量
                shopCartEl.num.innerHTML = count;
                if (count > 0) {
                    shopCartEl.num.style.display = 'block';
                } else {
                    shopCartEl.num.style.display = 'none';
                }
                //根据总价处理 支付按钮
                if (totalPrice >= minPrice) {
                    isPay = true;
                    shopCartEl.pay.className = 'shop-cartfooter-checkout enable';
                    shopCartEl.pay.innerHTML = '去结算'
                } else if (totalPrice > 0) {
                    isPay = false;
                    shopCartEl.pay.className = 'shop-cartfooter-checkout enable';
                    shopCartEl.pay.innerHTML = '&yen;' + minPrice + '起送'
                }else{
                    isPay = false;
                    shopCartEl.pay.className = 'shop-cartfooter-checkout disable';
                    shopCartEl.pay.innerHTML = '购物车是空的';
                }
                //创建(更新)购物车列表
                createShopCartList()
            }
            //TODO:创建购物车详情列表
            function createShopCartList() {
                //当你有了数据变更时 把所有元素删除掉重新添加一遍
                shopCartEl.cartList.innerHTML = "";
                shopCartEl.cartList.appendChild(shopCartEl.emptyBox);
                for (var i = 0; i < shopCartFoods.length; i++) {
                    var shopCartbasketTablerow = createEle("div","shop-cartbasket-tablerow",shopCartEl.cartList);
                    var itemname = createEle("div", "cell itemname", shopCartbasketTablerow);
                    itemname.innerHTML = shopCartFoods[i].name;
                    $(itemname).attr({"data-id":shopCartFoods[i].id})
                    var itemquantity = createEle("div", "cell itemquantity", shopCartbasketTablerow);
                    // 创建btncontrol
                    var btnControl = creatBtnControl(shopCartControlDec, shopCartControlAdd, shopCartFoods[i].num)
                    itemquantity.appendChild(btnControl);
                    //这种商品的总价格
                    var itemtotal = createEle("div", "cell itemtotal", shopCartbasketTablerow);
                    itemtotal.innerText = "¥"+(shopCartFoods[i].price*shopCartFoods[i].num);
                }
            }
            //TODO:购物车列表中的 加号按钮点击事件
            function shopCartControlAdd() {
                var findSpan = $(".menu-main-content").find('span[data-id="'+ getThisGoodsId(this) +'"]')
                var findBtn = $(findSpan).siblings(".btn-wrapper").find(".cart-add.icon-add_circle")[0]
                findBtn.click();
            }
            //TODO:购物车列表中的 减号按钮点击事件
            function shopCartControlDec() {
                var findSpan = $(".menu-main-content").find('span[data-id="'+ getThisGoodsId(this) +'"]')
                var findBtn = $(findSpan).siblings(".btn-wrapper").find(".cart-decrease.icon-remove_circle_outline")[0]
                findBtn.click();
            }
            //在菜单列表中，获取该按钮的商品信息
            function getThisGoodsInfo(that) {

                var $box = $(that).closest(".goods");
                var goodsId = parseInt($box.find(".goods-name")[0].getAttribute("data-id"));
                var goodsName = $box.find(".goods-name")[0].innerText;
                var reg = /[0-9]{1,10}[\.]?[0-9]{0,2}$/g;
                var goodsPrice = parseInt(reg.exec($box.find(".goods-price")[0].innerText)[0]);
                var num = parseInt($box.find(".cart-count")[0].innerText);//该商品在购物车的数量
                var info = {
                    id:goodsId,
                    name:goodsName,
                    price:goodsPrice,
                    num:num,
                    userId:getUserId,
                    shopId:getShopId
                }
                return info;
            }
            //在购物车列表中，获取该按键的商品id
            function getThisGoodsId(that) {
                var $itemname = $(that).closest(".shop-cartbasket-tablerow");
                var goodsId = $itemname.find(".cell.itemname")[0].getAttribute("data-id");
                return goodsId;
            }
            // 购物车商品数组中是否已经存放了该元素
            function hasItem(arr, item) {
                for (var i = 0; i < arr.length; i++) {
                    if(arr[i].name == item.name){
                        return i;
                    }
                }
                return -1;
            }
            //支付
            function pay() {
                $(shopCartEl.pay).on("click",function () {
                    //ajax请求
                    if(isPay){
                    console.log(shopCartFoods)
                    	var shopCartGoodsList = [];
                    	for(var i=0;i<shopCartFoods.length;i++){
                    		var obj = {}; 
                    		obj.goodsId = shopCartFoods[i].id;
                    		obj.goodsNum = shopCartFoods[i].num;
                    		shopCartGoodsList.push(obj);
                    	}
                    	console.log(shopCartFoods);
                    	console.log(totalPrice);
                    	console.log("shopCartGoodsList",shopCartGoodsList);
                    	var sendContent = {
                    		totalPrice:totalPrice,
                    		shopId:getShopId,
                    		userId:getUserId,
                    		shopCartGoodsList:shopCartGoodsList
                    	}
                    	console.log(sendContent);
                        sendMsg(sendContent);
                    }
                    //阻止冒泡
                    return false;
                })
            }
       function sendMsg(data){
	       $.ajax({
	            url:"${pageContext.request.contextPath}/shopCartAddGoods.action",
	            type:"post",
	            contentType:"application/json",
	            dataType:"json",
	            data:JSON.stringify(data),
	            /* traditional:true, */
	            success:function(result){
					/* alert(result); */
					var shopId = parseInt(result);
					if(shopId > 0){
					window.location.href="${pageContext.request.contextPath}/payOrder.action?shopcartid="+shopId+"&userid=1";
					}
	            },
	            error:function(XMLResponse){alert(XMLResponse.responseText)}
	        });
        }


        //购物车信息存localStorage
        function saveLocalStorage(obj) {
            localStorage.setItem("shopcart"+getUserId, JSON.stringify(obj));
        }
        //从localStorage获取购物车信息
        function getLocalStorage() {
            return JSON.parse( localStorage.getItem("shopcart"+getUserId) );
        }
        //清空该用户的localStorage
     function removeLocalStorage() {
         localStorage.removeItem("shopcart"+getUserId)
     }
    }

    
    	<!--模拟用户操作-->
	function showList(_UserId,_ShopId) {
        var getLocalStorage = JSON.parse( localStorage.getItem("shopcart"+_UserId) );
        if(getLocalStorage && getLocalStorage!=[]){
	        if(_ShopId == getLocalStorage[0].shopId){
		        for(var i=0;i<getLocalStorage.length;i++){
	                var id = getLocalStorage[i].id ;
	                var num =  getLocalStorage[i].num;
	                for(var j=0;j<num;j++){
	                    var findSpan = $(".menu-main-content").find('span[data-id="'+ id +'"]');
	                    if(findSpan){
	                    	var findBtn = $(findSpan).siblings(".btn-wrapper").find(".cart-add.icon-add_circle")[0]
	                    		if(findBtn){
	                    			findBtn.click();
	                    		}
	                    }
	                }
	            }
	        }
        }
    }
    
    //星星评分工具方法
        function createEle(eleName,className,parent) {
            var create  = document.createElement(eleName);
            className ? create.className = className:'';
            parent? parent.appendChild(create):'';
            return create;
        }
        //writeStar 第一个是分数 支持 大于等于0，小于等于5，第二个是一个 <span class="starrating">
        //0-0.49分 5个空星星
        //0.5-0.9 一个半星星，其余为空
        //以此类推
        writeStar(shopScore,document.getElementsByClassName("starrating")[0]);

        function writeStar(getShopScore,spanStar) {
            //对分数进行取整（0，0.5，1，1.5之类的）
            var shopScore = Math.floor(getShopScore * 2)/2;
            //分数向上取整
            var shopScoreCeil = Math.ceil(shopScore);
            //分数向下取整
            var shopScoreFloor = Math.floor(shopScore);
            //向上取整的分数大于向下取整的分数，则有一个0.5分
            if(shopScoreCeil>shopScoreFloor){
                //写填满的星星
                for(var i=0;i<shopScoreFloor;i++){
                    var iFull = createEle("i","icon Hui-iconfont",spanStar);
                    iFull.innerHTML = "&#xe6ff;";
                }
                //写一半的星星
                var iHalf = createEle("i","icon Hui-iconfont",spanStar);
                iHalf.innerHTML = "&#xe701;";
                //写空的星星
                for(var j=0;j<(5-shopScoreCeil);j++){
                    var iNone = createEle("i","icon Hui-iconfont",spanStar);
                    iNone.innerHTML = "&#xe702;";
                }
            }else{
                //写填满的星星
                for(var i=0;i<shopScore;i++){
                    var iFull = createEle("i","icon Hui-iconfont",spanStar);
                    iFull.innerHTML = "&#xe6ff;";
                }
                //写空的星星
                for(var j=0;j<(5-shopScoreCeil);j++){
                    var iNone = createEle("i","icon Hui-iconfont",spanStar);
                    iNone.innerHTML = "&#xe702;";
                }
            }
        }
})
	

</script>
</body>
</html>