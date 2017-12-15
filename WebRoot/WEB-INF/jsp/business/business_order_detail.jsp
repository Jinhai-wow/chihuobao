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
<title>商品详情</title>

<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/star-rating.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/css/business.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/star-rating.js"></script>
<script src="${pageContext.request.contextPath }/js/business.js"></script>
<script
	src="${pageContext.request.contextPath }/js/ie-emulation-modes-warning.js"></script>
<script type="text/javascript">
	$(function() {
		var startTimeTextBox = $('#range_example_3_start');
		var endTimeTextBox = $('#range_example_3_end');

		$.timepicker.timeRange(
			startTimeTextBox,
			endTimeTextBox,
			{
				minInterval : (1000 * 60 * 60), // 1hr
				timeFormat : 'HH:mm',
				start : {}, // start picker options
				end : {} // end picker options
			}
		);
	})

/***************接單***************/
	function acceptOrder(obj) {
		var orderId = $(obj).attr("id");
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath }/acceptOrder.action?id=" + orderId,
			dataType : "json",
			success : function(data) {
				if (data == -1)
					alert("参数异常");else {
					alert("接单成功，请记得发货！");
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

	/*****不接订单*****/
	function refuseSetId(obj) {
		/* alert(JSON.stringify(jsonData)); */
		var orderId = $(obj).attr("id");
		$("#refuseId").val(orderId);

	}
	;
	function refuseOrder() {
		/* alert(JSON.stringify(jsonData)); */
		var orderId = $("#refuseId").val();
		var refuseReason = $("#refuseReason").val();
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath }/refuseOrder.action",
			dataType : "json",
			data : {
				"id" : orderId,
				"shopremark" : refuseReason,
			},
			success : function(data) {
				if (data == -1)
					alert("参数异常");else {
					alert("已拒绝接单");
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

	/***************发货**********************/
	function sendOrder(obj) {
		/* alert(JSON.stringify(jsonData)); */
		var orderId = $(obj).attr("id");
		var sendMethod = $("#delivermethod").val();
		var arriveTime = $("#arrivetimePick").val();
		alert(sendMethod);
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath }/sendOrder.action",
			dataType : "json",
			data : {
				"id" : orderId,
				"delivermethod" : sendMethod,
				"arrivetime" : arriveTime,
			},
			success : function(data) {
				if (data == -1)
					alert("参数异常");else {
					alert("已发货！");
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


	/***************拒绝退单**************/
	function backRefuseSetId(obj) {
		/* alert(JSON.stringify(jsonData)); */
		var orderId = $(obj).attr("id");
		$("#backRefuseId").val(orderId);

	}
	;
	function backRefuseOrder(obj) {
		/* alert(JSON.stringify(jsonData)); */
		var orderId = $(obj).attr("id");
		var refuseReason = $("#backRefuseReason").val();
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath }/backRefuseOrder.action",
			dataType : "json",
			data : {
				"id" : orderId,
				"shopremark" : refuseReason,
			},
			success : function(data) {
				if (data == -1)
					alert("参数异常");else {
					alert("已拒绝退单申请！请记得发货");
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

	/*****************接受退单************************/
	function backAcceptOrder(obj) {
		/* alert(JSON.stringify(jsonData)); */
		var orderId = $(obj).attr("id");
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath }/backAcceptOrder.action?id=" + orderId,
			dataType : "json",
			success : function(data) {
				if (data == -1)
					alert("参数异常");else {
					alert("已接受退单！");
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
						src="/pic/${business.storerAccount.storerPic }" alt="账号头像" />
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
					<li><a
						href="${pageContext.request.contextPath }/getSysMsg.action">系统消息<span
							class="badge">2</span></a></li>

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

					<%-- <form class="form-horizontal" role="form" method="post" action="${pageContext.request.contextPath }/"> --%>
					<div class="detail-con row">
						<div
							class="order-msg table-responsive col-sm-12 col-md-8 col-lg-8">
							<table class="table">
								<caption>

									<div class="col-xs-2">
										<a href="javascript:;" title="${order.user.username}"><img
											class="img-circle" height="80px" width="80px" alt="用户头像"
											src="${pageContext.request.contextPath }/img/null.png"></a>
									</div>
									<div class="col-xs-6" style="padding-top: 60px;">联系方式：${order.user.phone}</div>
									<div class="col-xs-4" style="padding-top: 60px;">编号：${order.ordertable.id}</div>
								</caption>
								<thead>
									<tr>
										<th>菜品</th>
										<th>数量</th>
										<th>单价</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${order.ordertable.ordergoodsList}"
										var="goods">
										<tr>
											<td>${goods.goodsname}</td>
											<td>${goods.goodsquatity}</td>
											<td>￥&nbsp;${goods.goodsmoney}</td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2" style="vertical-align: middle;">实际支付：</td>
										<td style="font-size: 1.5em;color:#1E89E0;">￥&nbsp;100.0</td>
									</tr>
									<tr>
										<td colspan="2" style="vertical-align: middle;">订单状态：</td>
										<td><c:choose>
												<c:when test="${0 eq order.ordertable.orderstate }">已拒绝接单</c:when>
												<c:when test="${1 eq order.ordertable.orderstate }">未接单</c:when>
												<c:when test="${2 eq order.ordertable.orderstate }">已接单，待发货</c:when>
												<c:when test="${3 eq order.ordertable.orderstate }">已发货</c:when>
												<c:when test="${4 eq order.ordertable.orderstate }">订单已取消</c:when>
												<c:when test="${5 eq order.ordertable.orderstate }">已确认收货</c:when>
												<c:when test="${6 eq order.ordertable.orderstate }">正在申请取消订单</c:when>
												<c:when test="${7 eq order.ordertable.orderstate }">客户已评价</c:when>
												<c:when test="${8 eq order.ordertable.orderstate }">取消失败，待发货</c:when>
											</c:choose></td>
									</tr>
									<c:if test="${7 eq order.ordertable.orderstate }">
										<tr>
											<td style="vertical-align: middle;">商品评价：</td>
											<td colspan="2"><input class="rating rating-loading"
												data-size="xs" data-min="0" data-max="5" data-step="0.1"
												data-readonly="true"
												value="${order.ordertable.evaluatefood }"></td>
										</tr>
										<tr>
											<td style="vertical-align: middle;">服务评价：</td>
											<td colspan="2"><input class="rating rating-loading"
												data-size="xs" data-min="0" data-max="5" data-step="0.1"
												data-readonly="true"
												value="${order.ordertable.shopservice }"></td>
										</tr>
									</c:if>
								</tfoot>
							</table>
						</div>
						<div class="table-responsive col-sm-12 col-md-4 col-lg-4">
							<table class="table">
								<caption>配送信息</caption>
								<tbody>
									<tr>
										<!-- <td>配送方式：</td> -->
										<td colspan="2"><label for="delivermethod">配送方式：</label>
											<c:choose>
												<c:when
													test="${(2 eq order.ordertable.orderstate)or(8 eq order.ordertable.orderstate)}">
													<input id="delivermethod" class="" name=""
														delivermethod"" value="第三方配送">
												</c:when>
												<c:otherwise>
													${order.ordertable.delivermethod}
												</c:otherwise>
											</c:choose></td>
									</tr>
									<tr>
										<td colspan="2"><label for="delivermethod">送达时间：</label>
											<c:choose>
												<c:when
													test="${(2 eq order.ordertable.orderstate)or(8 eq order.ordertable.orderstate) }">
													<input id="arrivetimePick" name="arrivetime" value="">
												</c:when>
												<c:when test="${6 eq order.ordertable.orderstate }">
													<input id="arrivetimePick" name="arrivetime"
														value="${order.ordertable.arrivetime}">
												</c:when>
												<c:otherwise>
													${order.ordertable.arrivetime}
												</c:otherwise>
											</c:choose></td>
									</tr>
									<tr>
										<td>联系人：</td>
										<td>${order.user.username}</td>
									</tr>
									<tr>
										<td>联系方式：</td>
										<td>${order.user.phone}</td>
									</tr>
									<tr>
										<td>收货地址：</td>
										<td>${order.ordertable.useraddress}</td>
									</tr>
									<tr>
										<td>备注：</td>
										<td>${order.ordertable.remark}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-xs-offset-10">
							<c:choose>
								<c:when test="${1 eq order.ordertable.orderstate }">
									<a id="${order.ordertable.id}" href="javascript:;"
										class="btn btn-primary" onclick="acceptOrder(this)">接单</a>
									<a id="${order.ordertable.id }" href="javascript:;"
										class="btn btn-primary" data-toggle="modal"
										data-target="#refuseModal" onclick="refuseSetId(this)">不接</a>
								</c:when>
								<c:when
									test="${(2 eq order.ordertable.orderstate)or(8 eq order.ordertable.orderstate) }">
									<a id="${order.ordertable.id}" href="javascript:;"
										class="btn btn-primary" data-toggle="modal"
										data-target="#sendOrderModal" onclick="sendOrder(this)">发货</a>
								</c:when>
								<c:when test="${6 eq order.ordertable.orderstate }">
									<a id="${order.ordertable.id}" href="javascript:;"
										class="btn btn-primary" onclick="backAcceptOrder(this)">接受</a>
									<a id="${order.ordertable.id }" href="javascript:;"
										class="btn btn-primary" data-toggle="modal"
										data-target="#backRefuseModal" onclick="backRefuseSetId(this)">拒绝</a>
								</c:when>
							</c:choose>
						</div>
					</div>
					<!-- </form> -->

				</div>

			</div>
		</div>
	</div>

	<!-- 不接单模态框（refuseModal） -->
	<div class="modal fade" id="refuseModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">输入不接该订单的原因</h4>
				</div>
				<div class="modal-body">
					<input id="refuseId" type="hidden" name="" value="">
					<textarea id="refuseReason" name="shopRemark"
						style="resize: none;width: 565px;height: 100px"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="refuseOrder()">提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<!-- 拒绝退单申请模态框（refuseModal） -->
	<div class="modal fade" id="backRefuseModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">输入拒绝退单的原因</h4>
				</div>
				<div class="modal-body">
					<input id="backRefuseId" type="hidden" name="" value="">
					<textarea id="backRefuseReason" name="shopRemark"
						style="resize: none;width: 565px;height: 100px"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="refuseOrder()">提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

</body>
</html>
