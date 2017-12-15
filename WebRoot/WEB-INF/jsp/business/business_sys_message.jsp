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
<title>系统消息</title>

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
					<!--	<li><a href="#">待接订单</a></li>
					<li><a href="#">已完成订单</a></li>
					<li><a href="#">退单处理</a></li>
					-->
				</ul>
				<h4 class="sub-header">商品中心</h4>
				<ul class="nav nav-sidebar">
					<li><a
						href="${pageContext.request.contextPath }/getGoodsList.action">全部商品</a></li>
					<!--	<li><a href="">新品上架</a></li>
					<li><a href="">热卖商品</a></li>
					-->
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
					<li class="active"><a
						href="${pageContext.request.contextPath }/getSysMsg.action">系统消息</a></li>

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

					<a href="" class="btn btn-default" data-toggle="modal"
						data-target="#feedbackModal">反馈</a>
					<hr>
					<!-- 反馈弹出模态框（Modal） -->
					<div class="modal fade" id="feedbackModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="feedbackModalLabel">请输入反馈信息</h4>
								</div>
								<form class="form-horizontal" role="form"
									action="${pageContext.request.contextPath }/feedbackToSys.action"
									method="post">
									<div class="modal-body">
										<textarea name="information"
											style="resize: none;width: 565px;height: 100px"></textarea>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">取消</button>
										<button type="submit" class="btn btn-primary">提交</button>
									</div>
								</form>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal -->
					</div>
					<c:forEach items="${sysMsgs}" var="sysMsg">
						<c:choose>
							<c:when test="${sysMsg.infomation == ''}">
								<div class="panel panel-default">暂无消息......</div>
							</c:when>
							<c:otherwise>
								<div class="row info-con">
									<div class="col-xs-12">
										<h5>系统消息</h5>
										<div class="message-con">${sysMsg.infomation }</div>
										<span class="col-xs-11"> <fmt:formatDate
												value="${sysMsg.infoDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
										<a href="" class="btn btn-primary btn-xs col-xs-1"
											data-toggle="modal" data-target="#replyModal">回复</a>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 回复弹出模态框（Modal） -->
					<div class="modal fade" id="replyModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="feedbackModalLabel">请输入反馈信息</h4>
								</div>
								<form class="form-horizontal" role="form"
									action="${pageContext.request.contextPath }/feedbackToSys.action"
									method="post">
									<div class="modal-body">
										<textarea name="information"
											style="resize: none;width: 565px;height: 100px"></textarea>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">取消</button>
										<button type="submit" class="btn btn-primary">提交</button>
									</div>
								</form>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal -->
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>
