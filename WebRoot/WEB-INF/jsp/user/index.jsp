<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>吃货宝主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
	<link rel="stylesheet" href="css/iconfont.css">
	<link rel="stylesheet" type="text/css" href="css/index.css"/>
	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/index.js"></script>

  </head>
  
  <body>
    <div id="big-box">
	<div id="head">
	<nav class="navbar navbar-default navbar-static-top bgcolor navset">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/user/index.action"><img class="chb-logo" src="img/chb-logo.jpg" alt="吃货宝"></a>
				</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="#">首页</a></li>
					<li><a href="${pageContext.request.contextPath }/orderList.action">我的订单</a></li>
					<li><a href="#">加盟合作</a></li>
					</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">规则中心</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user.user.username }<span class="caret"></span></a>
						<ul class="dropdown-menu fc-black">
							<li><a href="${pageContext.request.contextPath}/user/personalCenter.action">个人中心</a></li>
							<li><a href="#">我的收藏</a></li>
							<li><a href="#">我的地址</a></li>
							<li><a href="#">安全设置</a></li>
							<li><a href="${pageContext.request.contextPath}/user/logout.action">退出登录</a></li>
							</ul>
						</li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</nav>
	</div>
	<div class="msg-box"><!-- msg-box 只用来定位-->
		<div class="new-msg">
			<div class="alert alert-info" role="alert">
				<p class="center-msg">
					<strong>HiHi</strong>
					测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试
				</p>
			</div>
		</div>
	</div>
	<div id="main">
		<div class="container path">
			<span>当前位置：</span>
			<span id="user-location">广东海洋大学</span>
			<span id><a href="${pageContext.request.contextPath}/home.jsp">[切换地址]</a></span>
			<div class="place-search">
				<form>
					<input class="search" type="text" maxlength="30" placeholder="搜索商家,美食...">
					<a href="#" class="place-search-btn"><i class="icon Hui-iconfont">&#xe665;</i></a>
				</form>
			</div>
		</div>

		<div class="container show-shop">
			<div class="shop-type">
				<div class="shop-title">
					<span>商家分类 :</span>
					<ul class="clearfix shop-list">
						<li class="selected">全部商家</li>
						<li >美食</li>
						<li >快餐便当</li>
						<li >特色菜系</li>
						<li >异国料理</li>
						<li >小吃夜宵</li>
						<li >甜品饮品</li>
						<li >果蔬生鲜</li>
						<li >商店超市</li>
						<li >鲜花绿植</li>
						<li >早餐</li>
						<li >午餐</li>
						<li >下午茶</li>
						<li >晚餐</li>
						<li >夜宵</li>
					</ul>
					<ul class="clearfix shop-list-inner">
						<!--<li class="selected-inner">全部</li>-->
						<!--<li >简餐便当</li>-->
						<!--<li >面食粥点</li>-->
						<!--<li >小吃炸串</li>-->
						<!--<li >地方菜系</li>-->
						<!--<li >香锅冒菜</li>-->
						<!--<li >汉堡披萨</li>-->
						<!--<li >日韩料理</li>-->
						<!--<li >轻食西餐</li>-->
					</ul>
				</div>
			</div>
			<div class="shop-box clearfix">
				<ul id="shopItems" class="clearfix">
					<!-- <li class="shop-block">
						<a href="#">
							<div class="shop-logo">
								<img src="https://fuss10.elemecdn.com/3/4e/18ee531652517eee31eb92555ccc1jpeg.jpeg?imageMogr2/thumbnail/70x70" alt="什么鬼，烦死了">
								<span class="timeout">45+ 分钟</span>
							</div>
							<div class="shop-content">
								<div class="block-title">佳斯顿炸鸡汉堡</div>
								<span class="starrating">
									<i class="icon Hui-iconfont">&#xe6ff;</i>
									<i class="icon Hui-iconfont">&#xe6ff;</i>
									<i class="icon Hui-iconfont">&#xe6ff;</i>
									<i class="icon Hui-iconfont">&#xe6ff;</i>
									<i class="icon Hui-iconfont">&#xe6ff;</i>
									<span class="monthsales">月售5809单</span>
								</span>
								<div class="cost">免配送费</div>
								<div class="activity"></div>
							</div>
						</a>
					</li> -->
				</ul>
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
					增值电信业务许可证 :
					<a href="#">沪B2-20150033</a>
					|
					<a href="#">沪ICP备 09007032</a>
					|
					<a href="#">上海工商行政管理</a>
					Copyright ©2008-2017 ele.me, All Rights Reserved.
				</p>
			</div>
		</div>
	</footer>
</div>
  </body>
</html>
