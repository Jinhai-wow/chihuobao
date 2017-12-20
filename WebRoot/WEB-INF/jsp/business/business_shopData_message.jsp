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
<title>商店审核信息</title>

<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/business.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
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
				<h4 class="sub-header">个人中心</h4>
				<ul class="nav nav-sidebar">
					<li><a
						href="${pageContext.request.contextPath }/getAccount.action">账号信息
							<span class="sr-only">(current)</span>
					</a></li>
					<li><a href="${pageContext.request.contextPath }/getPassword.action">修改密码</a></li>

				</ul>
				<ul class="nav nav-sidebar">
					<li><a
						href="${pageContext.request.contextPath }/getShopMsg.action">商店信息</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li class="active"><a
						href="${pageContext.request.contextPath }/getShopData.action">审核信息</a></li>
				</ul>
			</div>
			<!-- 主要容器 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="container-fluid">
					<div class="path">
						
					</div>

					<form id="businessForm" class="form-horizontal" role="form"
						action="${pageContext.request.contextPath }/updateShopData.action"
						enctype="multipart/form-data" method="post">
						<div class="detail-con row">
							<div class="col-sm-12">
								<input type="hidden" name="shopData.id" value="${shopData.id }">
								<input type="hidden" name="shopData.shopId"
									value="${shopData.shopId }">
								<table class="table">
									<tbody>
										<tr>
											<td colspan="3" style="color: red">*&nbsp;请上传清晰不遮挡的图片</td>
										</tr>
										<tr>
											<td style="text-align: right; vertical-align: bottom;"
												class="col-xs-2">店面照片：</td>
											<td class="col-xs-5" style="vertical-align: bottom;">
												<div>
													<table align="center">
														<tbody>
															<tr>
																<td>
																	<div id="preview">
																		<img height="150px" src="${pageContext.request.contextPath }/upload/business/${shopData.outPic }">
																	</div>
															<tr>
																<td><a href="javascript:;"
																	class="a-upload col-xs-12" style="margin-top: 15px">
																		<input type="file" name="outPic" id=""
																		onchange="preview(this)">上传正面照
																</a></td>
															</tr>
														</tbody>
													</table>
												</div>
											</td>
											<td class="col-xs-5" style="vertical-align: bottom;">
												<div>
													<table>
														<tbody>
															<tr>
																<td>
																	<div id="preview1">
																		<img height="150px" src="${pageContext.request.contextPath }/upload/business/${shopData.inPic }">
																	</div>
															<tr>
																<td><a href="javascript:;"
																	class="a-upload col-xs-12" style="margin-top: 15px">
																		<input type="file" name="inPic" id=""
																		onchange="preview1(this)">上传室内照
																</a></td>
															</tr>
														</tbody>
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<td style="text-align: right; vertical-align: bottom;"
												class="col-xs-2">服务证件：</td>
											<td class="col-xs-5" style="vertical-align: bottom;">
												<div>
													<table align="center">
														<tbody>
															<tr>
																<td>
																	<div id="preview2">
																		<img height="150px"
																			src="${pageContext.request.contextPath }/upload/business/${shopData.serviceLicense }">
																	</div>
															<tr>
																<td><a href="javascript:;"
																	class="a-upload col-xs-12" style="margin-top: 15px">
																		<input type="file" name="serviceLicense" id=""
																		onchange="preview2(this)">上传餐饮服务许可证正面照
																</a></td>
															</tr>
														</tbody>
													</table>
												</div>
											</td>
											<td class="col-xs-5" style="vertical-align: bottom;">
												<div>
													<table>
														<tbody>
															<tr>
																<td>
																	<div id="preview3">
																		<img height="150px" src="${pageContext.request.contextPath }/upload/business/${shopData.shopLicense}">
																	</div>
															<tr>
																<td><a href="javascript:;"
																	class="a-upload col-xs-12" style="margin-top: 15px">
																		<input type="file" name="shopLicense" id=""
																		onchange="preview3(this)">上传营业执照正面照
																</a></td>
															</tr>
														</tbody>
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<td style="text-align: right; vertical-align: bottom;"
												class="col-xs-2">商店法人身份证件：</td>
											<td class="col-xs-5" style="vertical-align: bottom;">
												<div>
													<table align="center">
														<tbody>
															<tr>
																<td>
																	<div id="preview4">
																		<img height="150px"
																			src="${pageContext.request.contextPath }/upload/business/${shopData.ownerIdUpPic}">
																	</div>
															<tr>
																<td><a href="javascript:;"
																	class="a-upload col-xs-12" style="margin-top: 15px">
																		<input type="file" name="ownerIdUpPic" id=""
																		onchange="preview4(this)">上传法人身份证正面照
																</a></td>
															</tr>
														</tbody>
													</table>
												</div>
											</td>
											<td class="col-xs-5" style="vertical-align: bottom;">
												<div>
													<table>
														<tbody>
															<tr>
																<td>
																	<div id="preview5">
																		<img height="150px"
																			src="${pageContext.request.contextPath }/upload/business/${shopData.ownerIdDownPic}">
																	</div>
															<tr>
																<td><a href="javascript:;"
																	class="a-upload col-xs-12" style="margin-top: 15px">
																		<input type="file" name="ownerIdDownPic" id=""
																		onchange="preview5(this)">上传法人身份反面照
																</a></td>
															</tr>
														</tbody>
													</table>
												</div>
											</td>
										</tr>
										<tr>
											<td style="text-align: right; vertical-align: middle;"
												class="col-xs-2">身份证号码：</td>
											<td class="col-xs-5" colspan="2">
												<div class="form-group" style="margin:10px 0 10px 50px">
													<!-- <label for="ownerId" class="col-xs-2 control-label">&nbsp;&nbsp;&nbsp;身份证号码：</label> -->
													<div class="col-xs-6">
														<input type="text" name="shopData.ownerId"
															class="form-control" id="ownerId"
															value="${shopData.ownerId }">
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="3" align="right"><c:choose>
													<c:when test="${0 eq business.shop.auditState }">
														<a class="btn btn-primary btn-sm" onclick="noAudit()">提交审核</a>
													</c:when>
													<c:otherwise>
														<button id="audit" type="submit"
															class="btn btn-primary btn-sm">提交审核</button>
													</c:otherwise>
												</c:choose></td>
										</tr>
									</tbody>
								</table>
							</div>

						</div>
					</form>

				</div>

			</div>
		</div>
	</div>


	<script type="text/javascript">
	$(document).ready(function() {  
      
    });
</script>
</body>
</html>
