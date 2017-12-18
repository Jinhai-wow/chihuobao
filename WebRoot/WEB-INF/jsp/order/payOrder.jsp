<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'payOrder.jsp' starting page</title>

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
<script src="js/jquery-ui.js"></script>

<script src="js/jquery.validate.js"></script>

<style type="text/css">
/* 	.table tb{
	margin:-40px;
	
	} */
.tangram-suggestion-main {
	z-index: 1060;
}

.pay {
	font-size: 40px;
	color: red;
	margin-left: 300px;
}

.gw_num {
	border: 1px solid #dbdbdb;
	width: 110px;
	line-height: 26px;
	overflow: hidden;
}

.gw_num em {
	display: block;
	height: 26px;
	width: 26px;
	float: left;
	color: #7A7979;
	border-right: 1px solid #dbdbdb;
	text-align: center;
	cursor: pointer;
}

.gw_num .num {
	display: block;
	float: left;
	text-align: center;
	width: 52px;
	font-style: normal;
	font-size: 14px;
	line-height: 24px;
	border: 0;
}

.gw_num em.add {
	float: right;
	border-right: 0;
	border-left: 1px solid #dbdbdb;
}

.containerDiv {
	border: 1px solid #eee;
	/* margin:30px; */
}
/* 右边大div */
.containerRightDiv {
	/* border:1px solid #eee; */
	margin-left: 140px;
	margin-top: 52px;
}

/*加粗的黑色大字体  */
.boldFont {
	margin-bottom: 15px;
	font-size: 16px;
	font-weight: 700;
	color: #000;
}

label {
	display: block;
	margin: 30px 0 0 0;
}

.overflow {
	height: 200px;
}

.form-horizontal .form-group {
	margin-right: 0px;
	margin-left: 0px;
}
</style>

<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=m4RmTMMoEEuF3qefYjDRkw5gxUDOK8Zs"></script>

<script type="text/javascript">



	/*  页面加载后调用*/

	$(document).ready(function() {



		$("#signupForm").validate({
			rules : {
				remark : {
					maxlength : 100
				},
				arrivetime : "required"
			},
			messages : {
				remark : "备注输入不能超过100字，请重新输入",
				arrivetime : "请选择送达时间"
			}
		});


		/* 表单提交 */
		$("#signupForm").validate({
			submitHandler : function(form) {
				//alert("提交事件!");   
				form.submit();
			}
		});

		$("#useraddressForm").validate({
			rules : {
				username : {
					required : true,
					minlength : 2,
					maxlength : 10
				},
				position : {
					required : true,
					maxlength : 100
				},
				detailaddress : {
					required : true,
					maxlength : 100
				},
				phone : {
					required : true,
					maxlength : 11
				}
			},
			messages : {
				username : {
					required : "请输入用户名",
					minlength : "用户名必需大于两个字",
					maxlength : "用户名必需小于十个字"
				},
				position : {
					required : "请输入地址",
					maxlength : "不能超过100字"
				},
				detailaddress : {
					required : "请输入地址",
					maxlength : "不能超过100字"
				},

				phone : {
					required : "请输入手机号",
					maxlength : "不能超过11位"
				},
			}
		});



		$("#useraddressForm").validate({
			submitHandler : function(form) {
				alert("提交事件!");
				form.submit();
			}
		});














		//加的效果
		$(".add").click(function() {
			var n = $(this).prev().val();
			var num = parseInt(n) + 1;
			if (num == 0) {
				return;
			}
			/* 	alert("add"); */
			/*  进行加法运算*/





			$(this).prev().val(num);

			totalPrice();
			setOrderGoodsInfo();
		});
		//减的效果
		$(".jian").click(function() {

			var n = $(this).next().val();
			var num = parseInt(n) - 1;
			if (num == 0) {
				return
			}


			$(this).next().val(num);
			totalPrice();
			setOrderGoodsInfo();
		});


		/*调用计算商品总价格方法  */
		totalPrice();
		/*调用商品信息转为json  */
		setOrderGoodsInfo()

		////////////////////////////////////////////////////


	})




	$("#number")
		.selectmenu()
		.selectmenu("menuWidget")
		.addClass("overflow");



	/* 计算商品总价格 */

	/* 加法 减法通用 等值改变后重新计算值*/
	function totalPrice() {
		var totalprice = 0;
		var i = 0;
		$("tbody").children().find(":input").each(function() {

			totalprice = totalprice / 1.0 +
				($("#goodsprice" + i + "").text() * 10000 * $(this).val()) / 10000;

			i++;
		});

		$("#totalprice").text("￥" + totalprice);
		$("#totalMoney").val(totalprice);


	}

	//////////////////////
	/* 该方法用来拼接shopcart商品信息 json*/
	function setOrderGoodsInfo() {

		/* 拼接shopcart商品信息 json*/

		var i = 0;
		var totalJson;
		var tempJson="";
		$("tbody").children().find(":input").each(function() {
			var json;
			/* goodsname shopcartid*/
			json = '{"shopcartid":' + $("#shopcartid").val() + ',"goodsname":' + '"' + $("#goodsname" + i + "").text() + '"' + ',"goodsquatity":' + $(this).val()
				+ ',"goodsprice":' + $("#goodsprice" + i + "").text() + "}";

			/* 	json='{"goodsname":'+'"'+$("#goodsname" + i + "").text()+'"'+',"goodsquatity":'+$(this).val()
				+',"goodsprice":'+$("#goodsprice" + i + "").text()+"}"	;	 */

			/* i>=1说明购买的商品有两件或以上 */
			if(i>=1){
			tempJson=tempJson+","+json;
			}else{
			
			tempJson=tempJson+json;
			}
				
		

			i++;
		});

  totalJson ="[" +tempJson+ "]";  

		/*把订单信息弄成json,放到隐藏inpt  */
		$("#ordergoodsinfo").val(totalJson);
alert(totalJson);
		console.log($("#ordergoodsinfo").val());


		/* 提交表单发送ajax 传输json */
		/* $.ajax({
					url : "${pageContext.request.contextPath}/submitOrder.action",
					data : totalJson,
					contentType : "application/json;charset=utf-8",
					type : "post",
					dataType : "json",
					success : function(data) {
					alert("success");
					}
			});	 */





	}
	//////////////////////////////	




	////////////////////////////////
</script>
</head>

<body>
	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid" style="background-color:#1e89e0;">
		<div class="navbar-header">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath }/home.jsp"><img
				class="chb-logo"
				src="${pageContext.request.contextPath }/img/chb-logo.jpg" alt="吃货宝"></a>
		</div>

	</div>
	</nav>
	<form id="signupForm"
		action="${pageContext.request.contextPath}/submitOrder.action"
		method="post">
		<!--     下左 -->
		<input type="hidden" name="ordergoodsinfo" id="ordergoodsinfo">
		<input type="hidden" name="userid" value="${userid}" id="userid">
		<input type="hidden" name="shopcartid" value="${shopcart.shopcartid}"
			id="shopcartid"> <input type="hidden" name="shopid"
			value="${shopcart.shopid}">
		<%-- <input type="hidden" name="shoppic" value="${shop.shopPic}"> --%>
		<input type="hidden" name="totalMoney" id="totalMoney">


		<div class="container containerDiv">
			<div class="col-md-4">
				<!--style="background:#eee"  table不能直接用containerDiv 权值不够高 -->
				<table class="table table-striped" style="border:1px solid #eee">
					<caption class="boldFont">订单详情</caption>
					<thead>
						<tr>
							<th>商品</th>
							<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;份数</th>
							<th>单价(元)</th>
						</tr>
					</thead>
					<tbody>

						<!-- 遍历shopcartlist -->
						<c:forEach items="${shopcartlist}" var="shopcartgoods"
							varStatus="i">
							<tr>
								<td id="goodsname<c:out value="${i.index}"></c:out>">${shopcartgoods.goodsname}</td>
								<td>
									<div class="gw_num">
										<em class="jian">-</em> <input
											id="num<c:out value="${i.index}"></c:out>" type="text"
											value="${shopcartgoods.goodsquatity}" class="num"
											readonly="readonly" /> <em class="add">+</em>

									</div>
								</td>
								<td id="goodsprice<c:out value="${i.index}"></c:out>">
									${shopcartgoods.goodsprice}</td>
							</tr>
						</c:forEach>


						<tr>
							<td>配送费</td>
							<td></td>
							<td>¥0.00</td>
						</tr>
						<tr>
							<td colspan="3"><span class="pay" id="totalprice"></span></td>

						</tr>
					</tbody>
				</table>

			</div>


			<!--     下右 -->
			<div class="col-md-6 containerRightDiv">

				<!--  收货地址 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<span class="panel-title boldFont"> 收货地址 </span>


						<!-- 添加新地址模态框 -->

						<!-- 按钮触发模态框 -->
						<!-- <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">开始演示模态框</button> -->
						<!-- 模态框（Modal） -->




						<a href="" data-toggle="modal" data-target="#myModal">添加新地址</a>







					</div>

					<div class="panel-body">
						<span class="glyphicon glyphicon-map-marker"></span>&nbsp;&nbsp;<span>${addressfromtable.address}</span>
					</div>
				</div>
				<!--  付款方式 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title boldFont">付款方式</h3>
					</div>
					<div class="panel-body">
						<span>在线支付 </span> <br> <span class="text-muted">支持微信、易宝、QQ钱包及大部分银行卡</span>

					</div>
				</div>
	</form>







	<!--  其他信息 -->
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title boldFont">其他信息</h3>
		</div>
		<div class="panel-body">
			配送方式: <span>第三方 </span> <br> <br> 送达时间：
			<!-- 记得更改 加value="11:20-11:30"-->
			<select name="arrivetime" id="number">
				<option selected="selected" value="">请选择送达时间</option>
				<option value="11:10-11:20">11:10-11:30</option>
				<option value="11:20-11:30">11:30-11:50</option>
				<option value="11:50-12:10">11:50-12:10</option>
				<option value="12:10-12:30">12:10-12:30</option>
				<option value="12:30-12:50">12:30-12:50</option>
				<option value="12:50-13:10">12:50-13:10</option>
				<option value="13:10-13:30">13:10-13:30</option>
				<option value="13:30-13:50">13:30-13:50</option>
				<option value="13:50-14:10">13:50-14:10</option>
				<option value="16:30-16:50">16:30-16:50</option>
				<option value="16:50-17:10">16:50-17:10</option>
				<option value="17:10-17:30">17:10-17:30</option>
				<option value="17:30-17:50">17:30-17:50</option>
				<option value="17:50-18:10">17:50-18:10</option>
				<option value="18:10-18:30">18:10-18:30</option>
				<option value="18:30-18:50">18:30-18:50</option>
				<option value="18:50-19:10">18:50-19:10</option>
				<option value="19:10-19:30">19:10-19:30</option>
				<option>其他时间</option>
			</select> <br> <br> 订单备注:
			<textarea class="form-control" rows="3" name="remark" id="remark"></textarea>
			<br> <br> <input type="submit" class="btn btn-primary"
				value="提交订单" />

		</div>
	</div>


	<!-- 下面是模态框内容 -->

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加新地址</h4>
				</div>

				<!-- 单选框 -->
				<!-- modal-body -->
				<div class="modal-body">

					<form class="form-horizontal" role="form"
						action="${pageContext.request.contextPath}/addNewAddress.action"
						id="useraddressForm">
						<input type="hidden" name="userid" value="${userid}" id="userid">
						<input type="hidden" name="shopcartid"
							value="${shopcart.shopcartid}">
						<!--   姓名-->
						<div class="form-group">
							<!-- <label for="username" class="col-sm-2 control-label"  style="padding-bottom:40px;">姓名</label> -->
							<div class="col-sm-6">
								姓名: <input type="text" class="form-control" id="username"
									name="username" placeholder="请输入名字">
							</div>
						</div>

						<div class="row" style=" margin-bottom:10px;">
							<!--性别  -->
							<span class="col-sm-2" style="margin-top:10px;margin-left:16px;">性别:</span>
							<div class="radio col-sm-2" style="margin-top:-26px;">

								<label> <input type="radio" name="sex" class="col-sm-2"
									id="optionsRadios1" value="1" checked>男
								</label>
							</div>
							<div class="radio col-sm-6" style="margin-top:-26px;">
								<label> <input type="radio" name="sex"
									id="optionsRadios2" value="0">女
								</label>
							</div>
						</div>



						<!--   位置-->
						<div class="form-group">
							<!-- <label for="username" class="col-sm-2 control-label" style="padding-bottom:40px;">位置</label> -->
							<div class="col-sm-6">

								<div id="l-map"></div>
								<!-- <div id="r-result">请输入:<input type="text" id="suggestId" size="20" value="百度" style="width:150px;" /></div> -->
								<!-- <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div> -->

								<div style="display: none"></div>
								位置: <input type="text" class="form-control map-search"
									placeholder="请输入小区、大厦、或学校" id="suggestId" name="position">

							</div>

							<div class="form-group">
								<div id="searchResultPanel"
									style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
							</div>


						</div>




						<!--   详细地址 -->
						<div class="form-group">
							<!-- <label for="username" class="col-sm-2 control-label" style="padding-bottom:40px;">位置</label> -->
							<div class="col-sm-6">
								详细地址: <input type="text" class="form-control" id="detailaddress"
									placeholder="单元、门牌号" name="detailaddress">
							</div>
						</div>



						<div cass="form-group">
							<!-- <label for="username" class="col-sm-2 control-label" style="padding-bottom:40px;">位置</label> -->
							<div class="col-sm-6">
								手机号码: <input type="text" class="form-control" id="phone"
									name="phone" placeholder="请输入您的手机号码">
							</div>
						</div>



						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<input type="submit" class="btn btn-primary" value="提交"></input>
							</div>
						</div>
					</form>
				</div>

				<!-- modal-footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<!--  <button type="button" class="btn btn-primary">提交</button> -->
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->




	</div>

	</div>
	</div>
</body>
<script type="text/javascript">


	// 百度地图API功能
	function G(id) {
		return document.getElementById(id);
	}

	var map = new BMap.Map("l-map");
	map.centerAndZoom("北京", 12); // 初始化地图,设置城市和地图级别。

	var ac = new BMap.Autocomplete( //建立一个自动完成的对象
		{
			"input" : "suggestId",
			"location" : map
		});

	ac.addEventListener("onhighlight", function(e) { //鼠标放在下拉列表上的事件
		var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province + _value.city + _value.district + _value.street + _value.business;
		}
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province + _value.city + _value.district + _value.street + _value.business;
		}
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
		G("searchResultPanel").innerHTML = str;
	});

	var myValue;
	ac.addEventListener("onconfirm", function(e) { //鼠标点击下拉列表后的事件
		var _value = e.item.value;
		myValue = _value.province + _value.city + _value.district + _value.street + _value.business;
		G("searchResultPanel").innerHTML = "onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

		setPlace();
	});

	function setPlace() {
		map.clearOverlays(); //清除地图上所有覆盖物
		function myFun() {
			var pp = local.getResults().getPoi(0).point; //获取第一个智能搜索的结果
			map.centerAndZoom(pp, 18);
			map.addOverlay(new BMap.Marker(pp)); //添加标注
		}
		var local = new BMap.LocalSearch(map, { //智能搜索
			onSearchComplete : myFun
		});
		local.search(myValue);
	}
</script>

</html>
