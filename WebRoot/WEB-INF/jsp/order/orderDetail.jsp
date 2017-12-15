<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'orderDetail.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/orderDetail.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<!-- <style type="text/css">

</style> -->
<script src="js/bdmap.js"></script>

<script type="text/javascript">
	$(function() {
	
	connectServer();
	
		/*  $("#cb1").attr("checked","checked"); */
		$("#optionsRadios3").click(function() {
			/* radio jquery1.6要用  prop*/
			if ($(this).prop("checked")) {

				$("#otherSuggestion").attr("disabled", false);
			}
		});



		$("#optionsRadios1").click(function() {
			/* radio jquery1.6要用  prop*/
			if ($(this).prop("checked")) {

				$("#otherSuggestion").attr("disabled", true);
			}
		});



		$("#optionsRadios2").click(function() {
			/* radio jquery1.6要用  prop*/
			if ($(this).prop("checked")) {

				$("#otherSuggestion").attr("disabled", true);
			}
		});

})
	
	function connectServer(){
	           var socket;
				if(typeof(WebSocket) == "undefined") {
					alert("您的浏览器不支持WebSocket");
					return;
				}

				
					//实现化WebSocket对象，指定要连接的服务器地址与端口
					socket = new WebSocket("ws://127.0.0.1:8080/CHB/ws?username="+$("#orderid").val());
					//打开事件
					socket.onopen = function() {
				
						/*  alert("Socket 已打开");  */
						//socket.send("这是来自客户端的消息" + location.href + new Date());
					};
					//获得消息事件
					socket.onmessage = function(msg) {
					
						alert(msg.data); 
					};
					//关闭事件
					socket.onclose = function() {
					/* socket.close(); */
						alert("Socket已关闭");
					};
					//发生了错误事件
					socket.onerror = function() {
						alert("发生了错误");
					}
				
				
				/*加用户名，订单号 */
				$("#cuidan").click(function() {
				/* $("#shopname").val() */
					socket.send("123");
				});

				/* $("#btnClose").click(function() {
					socket.close();
				}); */
			
	
	}
	
	
	
</script>

</head>

<body>
	<div class="container-fluid containerDiv">
	<input type="hidden" id="orderid" value="${order.id}">
	<input type="hidden" id="shopname" value="${order.shopname}">
		<strong style="font-size:20px;">订单详情</strong><br>

		<div class="row orderStateDiv">
			<!--  <h2>商家已接单</h2>  -->
			<c:if test="${order.orderstate==0}">
				<span class="text-primary text-center">
					<h3>订单未付款,请30分钟内支付</h3>
				</span>
			</c:if>
			<c:if test="${order.orderstate==1}">
				<span class="text-primary text-center">
					<h3>商家未接单</h3>
				</span>
			</c:if>
			<c:if test="${order.orderstate==2}">
				<span class="text-primary text-center">
					<h3>商家已接单</h3>
				</span>
			</c:if>
			<c:if test="${order.orderstate==3}">
				<span class="text-primary text-center">
					<h3>商家已发货</h3>
				</span>
			</c:if>
			<c:if test="${order.orderstate==4}">
				<span class="text-primary text-center">
					<h3>订单已取消</h3>
				</span>
			</c:if>
			<c:if test="${order.orderstate==5}">
				<span class="text-primary text-center">
					<h3>已确认收货</h3>
				</span>
			</c:if>
			<c:if test="${order.orderstate==7}">
				<span class="text-primary text-center">
					<h3>申请取消订单中</h3>
				</span>
			</c:if>
			<c:if test="${order.orderstate==8}">
				<span class="text-primary text-center">
					<h3>已评价</h3>
				</span>
			</c:if>
			<c:if test="${order.orderstate==9}">
				<span class="text-primary text-center">
					<h3>订单已失效</h3>
				</span>
			</c:if>
		</div>


		<div class="row orderStateFinishDiv">


			<div class="col-md-3 pull-right">
				<c:if test="${order.orderstate!=0}">
					<a class="btn btn-info"
						href="${pageContext.request.contextPath}/payOrder.action?shopcartid=
							${order.shopcartid}&userid=${order.userid}">再来一单</a>&nbsp; 
				  </c:if>

				<!--点击后到付款页面，可能要订单id  -->
				<c:if test="${order.orderstate==0}">
					<a class="btn btn-info"
						href="${pageContext.request.contextPath}/payOrder.action?shopcartid=
							${order.shopcartid}&userid=${order.userid}">去付款</a>&nbsp; 
				   </c:if>
				<c:if test="${order.orderstate==3}">
					<a class="btn btn-info"
						href="${pageContext.request.contextPath}/confirmReceive.action?id=${order.id}"
						onclick="if(confirm('确定收货?')==false)return false;" />确认收货</a>
						<a class="btn btn-info" id="cuidan">催单</a>
				</c:if>
				&nbsp;
				<c:if test="${order.orderstate==1||order.orderstate==2}">
					<a class="btn btn-info"
						href="${pageContext.request.contextPath}/applyCancelOrder.action?id=${order.id}"
						onclick="if(confirm('确定申请取消订单?')==false)return false;">取消订单</a>
				</c:if>
				<c:if test="${order.orderstate==5&&order.orderstate!=8}">

					<a class="btn btn-info"
						href="${pageContext.request.contextPath}/evaluateOrder.action?id=${order.id}">评价</a>

				</c:if>
			</div>

		</div>


		<!--上面  -->
		<div class="row topDiv">
			<!--上面左  -->
			<div class="col-md-4 topDivLeft">
				<img src="img/luna.jpg" class="img-circle goods"> <span>
					<span>${order.shopname}</span><br>

					<p class="text-muted">订单号:${order.id}</p>
				</span>
				<!--上面中  -->
			</div>
			<div class="col-md-4 topDivCenter">
				<span class="text-muted"> 商家电话:${order.shopphone}</span>
			</div>
			<!--上面右  -->
			<div class="col-md-3 topDivRight">
				<!-- glyphicon glyphicon-heart-empty -->
				<!-- 点击后改为已收藏 -->
				<!-- 	<a href=""> <span class="glyphicon glyphicon-heart-empty">
				</span>收藏
				</a> -->

				<!-- 投诉模态框 -->

				<!-- 按钮触发模态框 -->
				<!-- <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">开始演示模态框</button> -->
				<!-- 模态框（Modal） -->

				<c:if test="${order.orderstate!=0}">
					<a href="" data-toggle="modal" data-target="#myModal"><span
						class="glyphicon glyphicon-envelope"></span>投诉</a>
				</c:if>
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<form action="${pageContext.request.contextPath}/complain.action" method="post"> 
				<input type="hidden" name="userid" value="${order.userid}">
	             <input type="hidden" name="shopid" value="${order.shopid}">
	<input type="hidden" name="orderid" value="${order.id}">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">投诉举报</h4>
								</div>

								<!-- 单选框 -->

								<div class="modal-body">
									<!--选项1  -->
									<div class="radio">
										<label> <input type="radio" name="reason"
											id="optionsRadios1" value="商家已确认，但没有送外卖" checked>
											商家已确认，但没有送外卖
										</label>
									</div>
									<!-- 选项2 -->
									<div class="radio">
										<label> <input type="radio" name="reason"
											id="optionsRadios2" value="商家参加了活动，但没有优惠">
											商家参加了活动，但没有优惠
										</label>
									</div>

									<!-- 选项3 -->
									<div class="radio">
										<label for> <input type="radio" name="reason"
											id="optionsRadios3" value=""> 其他
										</label>
									</div>
									<!-- 要其他 单选框选中才能填写textarea-->
									<div class="form-group">
										<!--           <label for="name">其他</label> -->
										<textarea id="otherSuggestion" class="form-control" rows="3"
											disabled="disabled" name="otherreason"></textarea>
									</div>


								</div>


								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<input type="submit" class="btn btn-primary" value="提交"></input>
								</div>

							</div>
							<!-- /.modal-content -->

						</div>
						</form>
						<!-- /.modal -->
				</div>






			</div>
		</div>

		<!--     下左 -->
		<div class="leftDiv col-md-8">
			<table class="table">

				<tbody>
				<thead>
					<tr>
						<th>菜品</th>
						<th>数量</th>
						<th>单价(元)</th>

					</tr>


				</thead>

				<!--  <c:forEach items="${ordergoodslist}" var="ordergoods">
					<p class="text-muted">${ordergoods.goodsname}</p>
					</c:forEach>-->
				<c:forEach items="${ordergoodslist}" var="ordergoods">
					<tr>
						<td>${ordergoods.goodsname}</td>
						<td>${ordergoods.goodsquatity}</td>
						<td>${ordergoods.goodsmoney}</td>

					</tr>
				</c:forEach>

				<!-- <tr>
					<td>餐盒</td>
					<td></td>
					<td colspan="2"><span class="otherfontColor">0.50</span></td>
				</tr> -->

				<tr>
					<td colspan="3">实际支付：<span class="payfontColor">￥${order.totalmoney}</span></td>
				</tr>
				<!-- 为了table颜色往下延长 -->
				<tr>
					<td></td>
					<td></td>
					<td></td>

				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				</tbody>
			</table>
		</div>

		<%-- ${sessionScope.user.username} --%>
		<div class="rightDiv col-md-4">

			<strong>配送信息</strong><br> <br> 配送方式:<span>${order.delivermethod}</span><br>
			<br> 送达时间:<span>17:00-17:15</span><br> <br> 联 系 人 :<span>${username}</span><br>
			<br> 联系电话:<span>12345678901</span><br> <br> 收货地址:<span>${order.useraddress}</span><br>
			<br> 备注 : ${order.remark}



		</div>


	</div>




</body>
</html>
