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

<title>My JSP 'evaluateOrder.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link href="css/star-rating.min.css" media="all" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/jquery-ui.css">

<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 星级提示修改为中文，只修改 star-rating.js，star-rating.min.js没有修改-->
<script src="js/star-rating.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/jquery.validate.js"></script>


<style type="text/css">
.topDiv {
	margin-top: 20px;
	padding: 18px 30px 16px;
	background-color: #f8f8f6;
	border: 1px solid #eee;
}

.topDivLeft {
	margin-left: 30px;
}

.topDivCenter {
	margin-top: 68px;
}

.topDivRight {
	margin-top: 68px;
}

/* 商品图片 */
.goods {
	width: 70px;
	height: 70px;
}

.shopServiceDiv {
	margin-left: 40px;
}

.shopServiceStar {
	margin-top: 26px;
}
/* 滑动条位置 */
.sliderDiv {
	/* width:300px; */
	margin-top: 36px;
}

.sliderDivFont {
	/* width:300px; */
	margin-top: 36px;
}

.containerDiv {
	border: 1px solid #eee;
	/* margin:30px; */
}
</style>

<script type="text/javascript">

	/* function  changeStars(){
	  alert(document.getElementById("shopservice").value);
	  }
	   */

	$(function() {



		/*表单校验  */

		$("#evaluateForm").validate({
			rules : {
				usercomment : {
					required : true,
					maxlength : 100
				}
			},
			messages : {
				usercomment : {
					required : "请评价，评价不能为空",
					maxlength : "评价字数不能超过100字"
				}
			}
		});


		
		$("#evaluateForm").validate({
			submitHandler : function(form) {
			
				form.submit();
			}
		});
 





		$(function() {
			$("#slider").slider({
				range : "min",
				value : 20,
				min : 1,
				max : 120,
				slide : function(event, ui) {
					$("#deliverspeed").val(+ui.value + "分钟");
				}
			});
			$("#deliverspeed").val($("#slider").slider("value") + "分钟");
		});

	});
</script>

</head>

<body>
	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid" style="background-color:#1e89e0;">
		<div class="navbar-header">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath }/user/index.action"><img
				class="chb-logo"
				src="${pageContext.request.contextPath }/img/chb-logo.jpg" alt="吃货宝"></a>
		</div>

	</div>
	</nav>
	<div class="container containerDiv">
		<form id="evaluateForm"
			action="${pageContext.request.contextPath}/submitEvaluateOrder.action"
			method="post">
			<input type="hidden" name="id" value="${order.id}">
			<h2>评价订单</h2>
			<br>
			<!--上面  -->
			<div class="row topDiv">
				<!--上面左  -->
				<div class="col-md-4 topDivLeft">
					<img src="${pageContext.request.contextPath }/upload/business/${order.shoppic}" class="img-circle goods"> <span>
						${order.shopname}<br> <c:forEach items="${ordergoodslist}"
							var="ordergoods">
							<p class="text-muted">${ordergoods.goodsname}</p>
						</c:forEach>
					</span>
					<!--上面中  -->
				</div>
				<div class="col-md-4 topDivCenter">
					<span class="text-muted"> 商家电话:${order.shopphone}</span>
				</div>
				<!--上面右  -->
				<div class="col-md-3 topDivRight">
					<!-- glyphicon glyphicon-heart-empty -->
					<span class="text-muted">下单时间:${createtime}</span>
				</div>


			</div>
			<!-- 商家服务 -->
			<div class="row shopServiceDiv">
				<h2 class="col-md-2">商家服务</h2>
				<div class="shopServiceStar">
					<!-- 使用 data-show-caption="false"取消右边注释-->
					<input id="shopservice" data-show-clear="false"
						class="rating rating-loading" value="1" data-min="0" data-max="5"
						data-step="0.5" data-size="xs" name="shopservice">
				</div>
			</div>

			<hr>
			<!-- 送餐速度-->
			<div class="row">
				<h2 class="col-md-2" style="margin-left:50px">送餐速度</h2>
				<!-- sliderDiv  slider滑动条-->
				<div id="slider" class="col-md-3 sliderDiv"></div>
				<span class="col-md-2 sliderDivFont"> <input type="text"
					name="deliverspeed" id="deliverspeed" readonly
					style="border:0; color:#f6931f; font-weight:bold;">
				</span>
			</div>
			<hr>
			<!--评价菜品  -->
			<div class="row">
				<h2 class="col-md-2" style="margin-left:50px;">评价菜品</h2>
				<span class="col-md-2" style="margin-top:26px;">猎脚十潮汕手打牛内丸</span>
				<div class="col-md-3 shopServiceStar">
					<!-- 使用 data-show-caption="false"取消右边注释-->
					<input id="evaluatefood" data-show-clear="false"
						class="rating rating-loading" value="1" data-min="0" data-max="5"
						data-step="0.5" data-size="xs" name="evaluatefood">
				</div>
			</div>

			<hr>
			<!--文字评论  -->

			<h2 style="margin-top:25px;margin-left:50px;">评价:</h2>
			<textarea class="form-control" rows="3" name="usercomment"
				id="usercomment"></textarea>




			<div class="row pull-right">
				<input type="submit" class="btn btn-primary " value="提交评价" />
			</div>
		</form>

	</div>
</body>
</html>
