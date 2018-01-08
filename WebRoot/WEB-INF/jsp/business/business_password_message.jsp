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
<title>修改密码</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/business.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/bootstrapValidator.min.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/business.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrapValidator.js"></script>

<script
	src="${pageContext.request.contextPath }/js/ie-emulation-modes-warning.js"></script>
<script type="text/javascript">

	function changePsw() {
		var accountId = $("#accountId").val();
		var password = $("#password").val();
		var newPassword = $("#newPassword1").val();
		if (accountId == '' || password == '' || newPassword == '') {
			alert("密码不能为空！");
			return false;
		}
		;
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath }/updatePassword.action",
			dataType : "json",
			data : {
				"storerAccount.id" : accountId,
				"storerAccount.password" : password,
				"newPassword" : newPassword,
			},
			success : function(data) {
				if (data == -1)
					alert("参数异常");
				else if (data == -2) {
					alert("修改失败，新密码不能使用旧密码！");
				} else {
					alert("密码修改成功！");
					/* window.location.href="${pageContext.request.contextPath }/getOrderDetail.action?id="+orderId; */
					location.reload();
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				//弹出报错内容　　
				alert("系统错误！");
			}
		});
	}
	;
	
	$(function (){
    $("[data-toggle='popover']").popover();
});
</script>
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
				<h4 class="sub-header">个人中心</h4>
				<ul class="nav nav-sidebar">
					<li><a
						href="${pageContext.request.contextPath }/getAccount.action">账号信息
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath }/getPassword.action">修改密码</a></li>

				</ul>
				<ul class="nav nav-sidebar">
					<li><a
						href="${pageContext.request.contextPath }/getShopMsg.action">商店信息</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a
						href="${pageContext.request.contextPath }/getShopData.action">审核信息</a></li>
				</ul>
			</div>
			<!-- 主要容器 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="container-fluid">
					<div class="path">
						
					</div>
					<hr>

					<form id="businessForm" class="form-horizontal" role="form"
						method="post">
						<div class="detail-con row">
							<div class="password-msg col-sm-12 col-md-12 col-lg-12">
								<input type="hidden" id="accountId" name="storerAccount.id"
									value="${business.storerAccount.id }">
								<div class="form-group">
									<label for="password" class="col-xs-2 control-label">原密码</label>
									<div class="col-xs-5">
										<input type="password" name="password" class="form-control"
											id="password" value="" placeholder="请输入原密码" 
											data-container="body" data-toggle="popover" data-placement="right" 
											data-content="如果您未设置初始密码，账号默认初始密码为000000，请尽快修改密码；如已设置，请忽略">
									</div>
								</div>
								<div class="form-group">
									<label for="newPassword1" class="col-xs-2 control-label">新密码</label>
									<div class="col-xs-5">
										<input type="password" name="newPassword" class="form-control"
											id="newPassword1" value="" placeholder="请输入新密码">
									</div>
								</div>
								<div class="form-group">
									<label for="newPassword2" class="col-xs-2 control-label">确认密码</label>
									<div class="col-xs-5">
										<input type="password" name="newPassword2"
											class="form-control" id="newPassword2" value=""
											placeholder="请再次输入新密码">
									</div>
								</div>
								<!-- <div class="form-group">
    							<label for="password" class="col-xs-2 col-sm-1 control-label">密码</label>
    							<div class="col-xs-5">
      								<input type="password" name="password" class="form-control" id="password" value="番茄炒鸡蛋">
    							</div>
  							</div> -->
								<div class="form-group">
									<div class="col-xs-2 col-xs-offset-6">
										<button id="submitBtn" type="button"
											class="btn btn-primary btn-sm" onclick="changePsw()">修改</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

</body>
</html>
