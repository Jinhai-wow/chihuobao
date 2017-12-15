<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
						<!--<li class="active"><a href="#">首页</a></li>-->
						<li><a href="#">首页</a></li>
						<li><a href="#">我的订单</a></li>
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

	<div id="main">
		<div class="container path">
			<span>当前位置：</span>
			<span><a href="#" class="normal">广东海洋大学</a></span>
			<span><a href="${pageContext.request.contextPath}/home.jsp">[切换地址]</a> </span>
			<span><i>&gt;</i>&nbsp;&nbsp;近三个月订单</span>
		</div>
		<div class="container main-content">

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
