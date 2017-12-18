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
<title>账号信息</title>

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
									<c:when test="${business.shop.shopName != ''} ">
									${business.shop.shopName } 
								</c:when>
									<c:otherwise>
								尚未申请商店
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
				<h4 class="sub-header">个人中心</h4>
				<ul class="nav nav-sidebar">
					<li class="active"><a
						href="${pageContext.request.contextPath }/getAccount.action">账号信息
							<span class="sr-only">(current)</span>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath }/getPassword.action"">修改密码</a></li>

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
						enctype="multipart/form-data"
						action="${pageContext.request.contextPath }/updateAccount.action"
						method="post">
						<div class="detail-con row">
							<div class="account-msg col-sm-12 col-md-12 col-lg-12">
								<input type="hidden" name="storerAccount.id"
									value="${business.storerAccount.id }">
								<div class="form-group">
									<label for="storerPic" class="col-xs-2 col-sm-1 control-label">头像</label>
									<div class="col-xs-5">
										<table class="">
											<tbody>
												<tr>
													<td>
														<div id="preview">
															<img src="${pageContext.request.contextPath }/upload/business/${business.storerAccount.storerPic }"
																class="account-img img-thumbnail img-responsive">
														</div>
													</td>
												</tr>
												<tr>
													<td>
														<!-- <button type="button" name="upload" 
													class="col-xs-12 btn btn-primary btn-xs" data-toggle="modal" data-target="#picModal">上传头像</button> -->
														<a href="javascript:;" class="a-upload col-xs-12"> <input
															type="file" name="storerPic" id=""
															onchange="preview(this)">点击这里上传图片
													</a>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="form-group">
									<label for="storerName" class="col-xs-2 col-sm-1 control-label">用户名</label>
									<div class="col-xs-5">
										<input type="text" name="storerAccount.storerName"
											class="form-control" id="storerName"
											value="${business.storerAccount.storerName }">
									</div>
								</div>
								<div class="form-group">
									<label for="email" class="col-xs-2 col-sm-1 control-label">邮箱</label>
									<div class="col-xs-5">
										<div class="input-group">
											<input type="text" name="storerAccount.email"
												<c:if test="${business.storerAccount.email != null }"> disabled="true"</c:if>
												class="form-control" id="email"
												value="${business.storerAccount.email }"> <a
												id="toAddStyle"
												class="btn btn-default btn-xs input-group-addon"
												data-toggle="modal" data-target="#emialModal"><small>重新绑定邮箱</small></a>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="telephone" class="col-xs-2 col-sm-1 control-label">手机</label>
									<div class="col-xs-5">
										<div class="input-group">
											<input type="text" name="storerAccount.telephone"
												<c:if test="${business.storerAccount.telephone != null }"> disabled="true"</c:if>
												class="form-control" id="telephone"
												value="${business.storerAccount.telephone }"> <a
												id="toAddStyle"
												class="btn btn-default btn-xs input-group-addon"
												data-toggle="modal" data-target="#emialModal"><small>重新绑定手机</small></a>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-2 col-xs-offset-5">
										<button type="submit" class="btn btn-primary btn-sm">保存</button>
									</div>
								</div>
							</div>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript">
	</script>

</body>
</html>
