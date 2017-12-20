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

	<table class="table col-xs-6">
		<thead>
			<tr>
				<th colspan="3"><strong>全部评论</strong></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align="center">谁评论？</td>
				<td align="center">内容</td>
				<td align="center">时间</td>
			</tr>
			<c:forEach items="${comments}" var="comments">
				<tr>
					<td align="center" >${comments.userName }</td>
					<td align="center" >
						<p style="margin-bottom: 5px;">${comments.usercomment }</p>
						<br> <c:forEach items="${comments.orderGoodsList }"
							var="goods">
							<span>${goods.goodsname}</span>
							<br>
							<a href="">查看商品</a>
						</c:forEach>
					</td>
					<td align="center" ><fmt:formatDate value="${comments.createTime }"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>



	</script>
</body>
</html>