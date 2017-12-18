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
<title>更新商品</title>

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
<script type="text/javascript">
	/**********************删除商品类型***********************/
	function deleteTaps(obj) {
		var styleId = $(obj).attr("id");
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath }/deleteGoodStyle.action?id=" + styleId,
			dataType : "json",
			success : function(data) {
				if (data == -1)
					alert("删除失败！");else {
					obj.parentNode.removeChild(obj);
					$("#goodStyleId option[value='" + styleId + "']").remove();
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				//弹出报错内容　　
				alert("系统错误！");
			}
		});
	}
	;
	/******************************添加商品类型****************************/
	function addGoodStyle() {
		var shopId = $("#shopId").val();
		var styleName = $("#styleName").val();
		var styleDesc = $("#styleDesc").val();
		/* alert(JSON.stringify(jsonData)); */
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath }/addGoodStyle.action",
			dataType : "json",
			data : {
				"shopId" : shopId,
				"styleName" : styleName,
				"styleDesc" : styleDesc,
			},
			success : function(data) {
				if (data == -1)
					alert("添加失败，请重新输入！");else {
					alert("添加成功！");
					var str = "<option value='" + data + "'>" + styleName + "</option>";
					$("#goodStyleId").append(str);
					$(".close").click();
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				//弹出报错内容　　
				alert("系统错误！");
			}
		});
	}
	;
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
								<li><a href="${pageContext.request.contextPath }">安全设置</a></li>
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
							class="badge"></span></a></li>
					<li><a
						href="${pageContext.request.contextPath }/getSysMsg.action">系统消息<span
							class="badge"></span></a></li>

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

					<form id="businessForm" class="form-horizontal" role="form"
						enctype="multipart/form-data"
						action="${pageContext.request.contextPath }/updateGood.action"
						method="post">
						<input type="hidden" name="goods.id"
							value="${goodVo.goodsCustom.id }">
						<div class="detail-con row">
							<div class="goods-img col-sm-12 col-md-4 col-lg-4">
								<div id="previewBig">
									<img name="goods.goodPic"
										src="${pageContext.request.contextPath }/upload/business/${goodVo.goodsCustom.goodPic }"
										class="img-thumbnail img-responsive" style="width: 300px">
								</div>
								<!-- <button type="button" name="upload" class="col-xs-12 btn btn-primary "
									style="margin-top: 15px">上传图片</button> -->
								<a href="javascript:;" class="a-upload col-xs-12"> <input
									type="file" name="goodPic" onchange="previewBig(this)">点击这里上传图片
								</a>
							</div>
							<div class="goods-msg col-sm-12 col-md-8 col-lg-8">
								<div class="form-group">
									<label for="goodNumber" class="col-xs-3 control-label">商品编号</label>
									<div class="col-xs-9">
										<input type="text" name="goods.goodNumber" disabled="true"
											class="form-control" id="goods-number"
											value="${goodVo.goodsCustom.goodNumber }">
									</div>
								</div>
								<div class="form-group">
									<label for="goodName" class="col-xs-3 control-label">名称</label>
									<div class="col-xs-9">
										<input type="text" name="goods.goodName" class="form-control"
											id="goodName" value="${goodVo.goodsCustom.goodName }">
									</div>
								</div>
								<div class="form-group">
									<label for="goodStyleId" class="col-xs-3 control-label">类型</label>
									<div class="col-xs-9">
										<div class="input-group">
											<select class="form-control" name="goods.goodStyleId"
												id="goodStyleId">
												<c:forEach items="${goodVo.goodStyles}" var="style">
													<option value="${style.id }"
														<c:if test="${style.id == goodVo.goodsCustom.goodStyleId }">
													selected="true"</c:if>>${style.styleName }</option>
												</c:forEach>
											</select> <a id="toAddStyle"
												class="btn btn-default btn-xs input-group-addon"
												title="添加新的商品类型" data-toggle="modal" data-target="#myModal">+</a>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="price" class="col-xs-3 control-label">单价</label>
									<div class="col-xs-9">
										<div class="input-group">
											<div class="input-group-addon">￥</div>
											<input type="text" name="goods.price" class="form-control"
												id="price" value="${goodVo.goodsCustom.price }">

										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="quantity" class="col-xs-3 control-label">剩余数量</label>
									<div class="col-xs-9">
										<div class="input-group">
											<input type="text" name="goods.quantity" class="form-control"
												id="quantity" value="${goodVo.goodsCustom.quantity }">
											<div class="input-group-addon">份</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="sellState" class="col-xs-3 control-label">状态</label>
									<div class="col-xs-9">

										<select class="form-control" id="sellState"
											name="goods.sellState">
											<c:choose>
												<c:when test="${goodVo.goodsCustom.sellState == '0'}">
													<option value="0" selected="true">热卖中</option>
													<option value="1">缺货</option>
												</c:when>
												<c:otherwise>
													<option value="0">热卖中</option>
													<option value="1" selected="true">缺货</option>
												</c:otherwise>
											</c:choose>

										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="goodIntro" class="col-xs-3 control-label">备注</label>
									<div class="col-xs-9">
										<textarea class="form-control col-sm-10" id="goodIntro"
											name="goods.goodIntro" rows="3">${goodVo.goodsCustom.goodIntro }</textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-offset-10 col-xs-2">
										<button id="edit" type="submit" class="btn btn-primary btn-sm">修改</button>
									</div>
								</div>
							</div>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">输入新商品类型信息</h4>
				</div>
				<div class="modal-body">
					<div id="styleTaps">
						已有类型：
						<c:forEach items="${goodVo.goodStyles}" var="style">
							<a id="${style.id }" href="javascript:;" title="点击删除类型"
								class="btn btn-default btn-xs" onclick="deleteTaps(this)">${style.styleName}</a>
						</c:forEach>
					</div>
					<input type="hidden" id="shopId" name="goodStyle.shopId"
						value="${business.shop.id }">
					<div class="form-group">
						<label for="styleName" class="control-label">名称</label>
						<div class="">
							<input id="styleName" type="text" name="goodStyle.styleName"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="styleDesc" class="control-label">备注</label>
						<div class="">
							<input id="styleDesc" type="text" class="form-control"
								name="goodStyle.styleDesc"></input>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="addGoodStyle()">提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<script>
		
	</script>

</body>
</html>
