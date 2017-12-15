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
<title>订单列表</title>

<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/business.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/timePicker/jQuery-ui.css"
	rel="stylesheet">	
<link href="${pageContext.request.contextPath }/css/timePicker/jquery-ui-timepicker-addon.css"
	rel="stylesheet">	
<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath }/js/business.js"></script>
<script src="${pageContext.request.contextPath }/js/timePicker/jquery-ui-timepicker-addon.js"></script>
<script src="${pageContext.request.contextPath }/js/timePicker/jquery-ui-timepicker-addon-i18n.js"></script>
<script src="${pageContext.request.contextPath }/js/timePicker/jquery-ui-sliderAccess.js"></script>

<script
	src="${pageContext.request.contextPath }/js/ie-emulation-modes-warning.js"></script>

</head>
<style type="text/css">
</style>
<script type="text/javascript">
$(document).ready(function() {	
	jQuery('#arrivetimePick').datetimepicker({
                timeFormat: "HH:mm:ss",
                dateFormat: "yy-mm-dd"
            });

var startTimeTextBox = $('#range_example_3_start');
var endTimeTextBox = $('#range_example_3_end');
$.timepicker.timeRange(
	startTimeTextBox,
	endTimeTextBox,
	{
		minInterval: (1000*60), // 1hr
		timeFormat: 'HH:mm',
		start: {}, // start picker options
		end: {} // end picker options
	}
);
});	

	/*************接单*******************/
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

	/*******************发货********************/
	function sendOrderSetId(obj) {
		/* alert(JSON.stringify(jsonData)); */
		var orderId = $(obj).attr("id");
		$("#sendId").val(orderId);

	}
	;
	function sendOrder() {
		/* alert(JSON.stringify(jsonData)); */
		var orderId = $("#sendId").val();
		var sendMethod = $("#delivermethod").val();
		var arriveTime = $("#arrivetimePick").val();
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
						<%-- src="/pic/${business.storerAccount.storerPic }" alt="账号头像" /> --%>
						src="${pageContext.request.contextPath }/upload/business/${business.storerAccount.storerPic }" alt="账号头像" />
					</a> <span class="accountName">${business.storerAccount.storerName }</span>
				</div>
				<h4 class="sub-header">订单中心</h4>
				<ul class="nav nav-sidebar">
					<li class="active"><a
						href="${pageContext.request.contextPath }/getOrdersList.action">全部订单
							<span class="sr-only">(current)</span>
					</a></li>
				</ul>
				<h4 class="sub-header">商品中心</h4>
				<ul class="nav nav-sidebar">
					<li><a
						href="${pageContext.request.contextPath }/getGoodsList.action">全部商品</a></li>
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
						</span> <span><i>&gt;</i>&nbsp;&nbsp;近三个月订单</span>
					</div>
					<!-- 选择工具栏 -->
						<div class="row list-menu">
							<ul class="nav nav-tabs">
								<li class="active"><a
									href="${pageContext.request.contextPath }/getOrdersList.action">全部订单</a></li>
								<li><a
									href="${pageContext.request.contextPath }/getOrdersAccepting.action">待接订单<span
										class="badge"></span></a></li>
								<li><a
									href="${pageContext.request.contextPath }/getOrdersNoSend.action">未发货订单<span
										class="badge"></span></a></li>
								<li><a
									href="${pageContext.request.contextPath }/getOrdersSend.action">已发货订单<span
										class="badge"></span></a></li>
								<li><a
									href="${pageContext.request.contextPath }/getOrdersCanceling.action">退单处理<span
										class="badge"></span></a></li>
								<li><a
									href="${pageContext.request.contextPath }/getOrdersFinish.action">已完成订单</a></li>
							</ul>
						</div>

					<div class="row">
						<table class="table table-striped">
							<thead>
								<tr>
									<th style="text-align: center;">下单时间</th>
									<th style="text-align: center;">订单商品</th>
									<th style="text-align: center;">备注</th>
									<th style="text-align: center;">支付金额</th>
									<th style="text-align: center;">状态</th>
									<th style="text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ordersList}" var="list">
									<tr>
										<td style="text-align: center;vertical-align: middle;"><fmt:formatDate
												value="${list.creatime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td style="text-align: center;vertical-align: middle;"><c:forEach
												items="${list.ordergoodsList }" var="goods">
										${goods.goodsname }<br>
											</c:forEach></td>
										<td style="text-align: center;vertical-align: middle;">${list.remark }</td>
										<td style="text-align: center;vertical-align: middle;">￥&nbsp;${list.totalmoney }</td>
										<td style="text-align: center;vertical-align: middle;"><c:choose>
												<c:when test="${0 eq list.orderstate }">已拒绝接单</c:when>
												<c:when test="${1 eq list.orderstate }">未接单</c:when>
												<c:when test="${2 eq list.orderstate }">已接单，待发货</c:when>
												<c:when test="${3 eq list.orderstate }">已发货</c:when>
												<c:when test="${4 eq list.orderstate }">订单已取消</c:when>
												<c:when test="${5 eq list.orderstate }">已确认收货</c:when>
												<c:when test="${6 eq list.orderstate }">申请取消订单</c:when>
												<c:when test="${7 eq list.orderstate }">客户已评价</c:when>
												<c:when test="${8 eq list.orderstate }">取消失败，待发货</c:when>
											</c:choose></td>
										<td
											style="text-align: center;vertical-align: middle;line-height: 2em;">
											<c:choose>
												<c:when test="${0 eq list.orderstate }">
													<a
														href="${pageContext.request.contextPath }/getOrderDetail.action?id=${list.id }"
														class="btn btn-primary btn-xs">查看</a>
												</c:when>
												<c:when test="${1 eq list.orderstate }">
													<a id="${list.id }" href="javascript:;"
														class="btn btn-primary btn-xs" onclick="acceptOrder(this)">接单</a>
													<br>
													<a id="${list.id }" href="javascript:;"
														class="btn btn-primary btn-xs" data-toggle="modal"
														data-target="#refuseModal" onclick="refuseSetId(this)">不接</a>
													<br>
													<a
														href="${pageContext.request.contextPath }/getOrderDetail.action?id=${list.id }"
														class="btn btn-primary btn-xs">查看</a>
												</c:when>
												<c:when test="${2 eq list.orderstate }">
													<a id="${list.id }" href="javascript:;"
														class="btn btn-primary btn-xs" data-toggle="modal"
														data-target="#sendOrderModal"
														onclick="sendOrderSetId(this)">发货</a>
													<br>
													<a
														href="${pageContext.request.contextPath }/getOrderDetail.action?id=${list.id }"
														class="btn btn-primary btn-xs">查看</a>
												</c:when>
												<c:when test="${3 eq list.orderstate }">
													<a
														href="${pageContext.request.contextPath }/getOrderDetail.action?id=${list.id }"
														class="btn btn-primary btn-xs">查看</a>
												</c:when>
												<c:when test="${4 eq list.orderstate }">
													<a
														href="${pageContext.request.contextPath }/getOrderDetail.action?id=${list.id }"
														class="btn btn-primary btn-xs">查看</a>
												</c:when>
												<c:when test="${5 eq list.orderstate }">
													<a
														href="${pageContext.request.contextPath }/getOrderDetail.action?id=${list.id }"
														class="btn btn-primary btn-xs">查看</a>
												</c:when>
												<c:when test="${6 eq list.orderstate }">
													<a id="${list.id }"
														href="${pageContext.request.contextPath }"
														class="btn btn-primary btn-xs">接受</a>
													<br>
													<a id="${list.id }" href="javascript:;"
														class="btn btn-primary btn-xs" data-toggle="modal"
														data-target="#sendOrderModal"
														onclick="backRefuseSetId(this)">拒绝</a>
													<br>
													<a
														href="${pageContext.request.contextPath }/getOrderDetail.action?id=${list.id }"
														class="btn btn-primary btn-xs">查看</a>
												</c:when>
												<c:when test="${7 eq list.orderstate }">
													<a
														href="${pageContext.request.contextPath }/getOrderDetail.action?id=${list.id }"
														class="btn btn-primary btn-xs">查看</a>
												</c:when>
												<c:when test="${8 eq list.orderstate }">
													<a id="${list.id }" href="javascript:;"
														class="btn btn-primary btn-xs" data-toggle="modal"
														data-target="#backRefuseModal"
														onclick="sendOrderSetId(this)">发货</a>
													<a
														href="${pageContext.request.contextPath }/getOrderDetail.action?id=${list.id }"
														class="btn btn-primary btn-xs">查看</a>
												</c:when>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<%-- <c:forEach items="${business.goods}" var="goods">
							
						</c:forEach> --%>

					</div>

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
					<h4 class="modal-title" id="myModalLabel">输入不接该订单的原因</h4>
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

	<!-- 发货模态框（refuseModal） -->
	<div class="modal fade" id="sendOrderModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">输入发货信息</h4>
				</div>
				<div class="modal-body">
					<input id="sendId" type="hidden" name="" value="">
					<div class="form-group">
						<label for="styleName" class="control-label">配送方式</label>
						<div class="">
							<input id="delivermethod" class="form-control" name=""
								delivermethod"" value="第三方配送" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="styleDesc" class="control-label">送达时间</label>
						<div class="">
							<input id="arrivetimePick" name="arrivetime" value=""
								class="form-control" type="text"></input>
							<input name="range_example_3_start" id="range_example_3_start" value="" class="hasDatepicker" type="text"> 
	 						<input name="range_example_3_end" id="range_example_3_end" value="" class="hasDatepicker" type="text">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="sendOrder()">提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>
</html>
