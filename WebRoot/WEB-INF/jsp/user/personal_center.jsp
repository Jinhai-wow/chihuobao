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
    
    <title>个人中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">   
        function getImgFullPath(obj) {   
            if (obj) {     
               //ie     
               if (window.navigator.userAgent.indexOf("MSIE") >= 1) {     
                   obj.select();     
                   return document.selection.createRange().text;     
               }     
               //firefox     
               else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {     
                   if (obj.files) {     
                       return obj.files.item(0).getAsDataURL();     
                   }     
                   return obj.value;     
               }            
               return obj.value;      
           }     
        }
    </script>
 <style type="text/css">

/* Apply these styles only when #preview-pane has
   been placed within the Jcrop widget 
   仅在#preview-pane被放置在Jcrop小部件中时才应用这些样式*/

.jcrop-holder #preview-pane {
  display: block;
  position: absolute;
  z-index: 2000;
  top: 10px;
  right: -280px;
  padding: 6px;
  border: 1px rgba(0,0,0,.4) solid;
  background-color: white;

  -webkit-border-radius: 6px;
  -moz-border-radius: 6px;
  border-radius: 6px;

  -webkit-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
  -moz-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
  box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
}

/* The Javascript code will set the aspect ratio of the crop
   area based on the size of the thumbnail preview,
   specified here 
   Javascript代码将根据这里指定的缩略图预览的大小来设置作物区域的宽比。*/
#preview-pane .preview-container {
  width: 150px;
  height: 150px;
  overflow: hidden;
}

</style>
	<link rel="stylesheet" type="text/css" href="css/demos.css">
	<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
	<link rel="stylesheet" type="text/css" href="css/jquery.Jcrop.css">
	<link href="css/bootstrap.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/iconfont.css">
	<link rel="stylesheet" type="text/css" href="css/personal_center.css">
  </head>
  
  <body>
  	<input id="input-hid" type="hidden" value="${user.user.id}">
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
	            <li><a href="${pageContext.request.contextPath}/user/index.action">首页</a></li>
	            <li><a href="javascript:;">我的订单</a></li>
	            <li><a href="javascript:;">加盟合作</a></li>
	          </ul>
	          <ul class="nav navbar-nav navbar-right">
	            <li><a href="javascript:;">规则中心</a></li>
	            <li class="dropdown">
					  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span id="center-username">${user.user.username}</span><span class="caret"></span></a>
					  <ul class="dropdown-menu fc-black">
						  <li><a href="${pageContext.request.contextPath}/user/personalCenter.action">个人中心</a></li>
						  <li><a href="javascript:;">我的收藏</a></li>
						  <li><a href="${pageContext.request.contextPath}/userChat.action" target="view_window">客服中心</a>
						  <li><a href="javascript:;">我的地址</a></li>
						  <li><a href="javascript:;">安全设置</a></li>
						  <li><a href="${pageContext.request.contextPath}/user/logout.action">退出登录</a></li>
					  </ul>
				</li>
				<li>
					<a id="my-message" href="javascript:;">我的消息<span id="my-message-size"></span></a>
				</li>
	          </ul>
	        </div><!--/.nav-collapse -->
	      </div>
	    </nav>
	</div>

	<div id="main">
		<div class="container path">
			<span>当前位置：</span>
			<span id="center-user-addr">未定位</span>
			<span><a href="${pageContext.request.contextPath}/user/home.action">[切换地址]</a> </span>
			<span id="center-item">个人中心</span>
		</div>
		<div class="container main-content">
			<div class="row">
				<div class="col-xs-2 row-left">
					<ul class="nav nav-sidebar">
						<li><i class="icon Hui-iconfont">&#xe625;</i><span class="pointer"><a  id="person-center-a" class="setfontcolor" href="${pageContext.request.contextPath }/user/personalCenter.action" class="setfontcolor">个人中心</a></span></li>
					</ul>
					<ul class="nav nav-sidebar">
						<li><i class="icon Hui-iconfont">&#xe627;</i><span><a href="${pageContext.request.contextPath }/orderList.action" class="setfontcolor">我的订单</a></span></li>
					</ul>
					<ul class="nav nav-sidebar">
						<li><i class="icon Hui-iconfont">&#xe63a;</i><span>我的资产</span></li>
						<li><a class="setfontcolor" href="javascript:;">我的红包</a></li>
						<li><a class="setfontcolor" href="javascript:;">账户余额</a></li>
						<li><a class="setfontcolor" href="javascript:;">我的金币</a></li>
					</ul>
					<ul class="nav nav-sidebar">
						<li><i class="icon Hui-iconfont">&#xe60d;</i><span>我的资料</span></li>
						<li><a class="setfontcolor" id="personal-data" href="javascript:;">个人资料</a></li>
						<li><a class="setfontcolor" id="address-management" href="javascript:;">地址管理</a></li>
						<li><a class="setfontcolor" href="javascript:;">安全中心</a></li>
						<li><a class="setfontcolor" id="modify-password" href="javascript:;">修改密码</a></li>
					</ul>
					<ul class="nav nav-sidebar">
						<li><i class="icon Hui-iconfont">&#xe61b;</i><span  class="pointer">我的收藏</span></li>
					</ul>
				</div>
				<div class="col-xs-10 row-right">
					<div class="messagn-panel">
						<div class="profile"><div class="profileinfo" id="myMessage">
							<h3 ng-if="pageTitleVisible" class="profile-paneltitle ng-scope">
								<span ng-bind="pageTitle" class="ng-binding">个人中心</span>
								<span class="subtitle ng-binding" ng-bind-html="pageSubtitle | toTrusted"></span>
						    </h3>
						    <div class="media">
								<a href="javascript:;" class="pull-left"><img id="profile-img" src="upload/${user.user.photo }"class="media-object" alt=''/></a>
								<div class="media-body" style="padding-left:30px;">
									<h3 class="media-heading" style="padding-bottom:30px;font-size: 18px;">
										您好，<span>${user.user.username }</span>
									</h3> 
									<span style="margin:6px 0 10px;color: #999;font-size: 15px;">吃货宝，吃货们的世界!<br/>
									想吃什么就吃什么！！！</span>
								</div>
							</div>
						</div>
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
						<li><a href="javascript:;">我要开店</a></li>
						<li><a href="javascript:;">加盟指南</a></li>
						<li><a href="javascript:;">市场合作</a></li>
						<li><a href="javascript:;">开放平台</a></li>
					</ul>
				</div>
				<div class="col-xs-2">
					<ul class="nav nav-sidebar">
						<li><span>商务合作</span></li>
						<li><a href="javascript:;">我要开店</a></li>
						<li><a href="javascript:;">加盟指南</a></li>
						<li><a href="javascript:;">市场合作</a></li>
						<li><a href="javascript:;">开放平台</a></li>
					</ul>
				</div>
				<div class="col-xs-2">
					<ul class="nav nav-sidebar">
						<li><span>商务合作</span></li>
						<li><a href="javascript:;">我要开店</a></li>
						<li><a href="javascript:;">加盟指南</a></li>
						<li><a href="javascript:;">市场合作</a></li>
						<li><a href="javascript:;">开放平台</a></li>
					</ul>
				</div>
				<div class="col-xs-3">
					<ul class="nav nav-sidebar">
						<li><span>商务合作</span></li>
						<li><a href="javascript:;">我要开店</a></li>
						<li><a href="javascript:;">加盟指南</a></li>
						<li><a href="javascript:;">市场合作</a></li>
						<li><a href="javascript:;">开放平台</a></li>
					</ul>
				</div>
				<div class="col-xs-3">
					<ul class="nav nav-sidebar">
						<li><span>商务合作</span></li>
						<li><a href="javascript:;">我要开店</a></li>
						<li><a href="javascript:;">加盟指南</a></li>
						<li><a href="javascript:;">市场合作</a></li>
						<li><a href="javascript:;">开放平台</a></li>
					</ul>
				</div>
			</div>
			<div class="footer-copyright">
				<span class="owner">所有方：广东九州有限公司</span>
				<p>
					增值电信业务许可证 :
					<a href="javascript:;">沪B2-20150033</a>
					|
					<a href="javascript:;">沪ICP备 09007032</a>
					|
					<a href="javascript:;">上海工商行政管理</a>
					Copyright ©2008-2017 ele.me, All Rights Reserved.
				</p>
			</div>
		</div>
	</footer>
</div>

<script type="text/javascript" language="javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" language="javascript" src="js/jquery-3.2.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" language="javascript" src="js/jquery.Jcrop.js"></script>
<script src="js/personal_center.js"></script>
<script>
</script>
  </body>
</html>
