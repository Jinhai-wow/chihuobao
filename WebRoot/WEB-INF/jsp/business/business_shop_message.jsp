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
<title>商店信息</title>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=4a56seRk7DePGIGBvmX2mLIM7iXrUiIL"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath }/css/business.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/star-rating.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/bootstrapValidator.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/normalize.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/jquery.gDialog.css">
<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/star-rating.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.gDialog.js"></script>
<script src="${pageContext.request.contextPath }/js/business.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrapValidator.js"></script>

</head>

<body>
	<div id="allmap"></div>
	<!-- 百度地图con -->
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
					<li><a
						href="${pageContext.request.contextPath }/getPassword.action">修改密码</a></li>

				</ul>
				<ul class="nav nav-sidebar">
					<li class="active"><a
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
						action="${pageContext.request.contextPath }/updateShop.action"
						method="post">
						<div class="detail-con row">
							<div class="account-msg col-sm-12 col-md-12 col-lg-12">
								<input type="hidden" name="shop.id" value="${business.shop.id }">
								<div class="form-group">
									<label for="shopPic" class="col-xs-2 control-label">商店头像</label>
									<div class="col-xs-5">
										<table class="">
											<tbody>
												<tr>
													<td>
														<div id="preview">
															<img src="${pageContext.request.contextPath }/upload/business/${business.shop.shopPic }"
																class="img-thumbnail img-responsive account-img">
														</div>
													</td>
												</tr>
												<tr>
													<td><a href="javascript:;" class="a-upload col-xs-12">
															<input type="file" name="shopPic" id=""
															onchange="preview(this)">点击这里上传图片
													</a></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="form-group">
									<label for="shopName" class="col-xs-2 control-label">商店名</label>
									<div class="col-xs-5">
										<input type="text" name="shop.shopName" class="form-control"
											id="shopName" value="${business.shop.shopName }">
									</div>
								</div>
								<div class="form-group">
									<label for="shopOwner" class="col-xs-2 control-label">店主</label>
									<div class="col-xs-5">
										<input type="text" name="shop.shopOwner" class="form-control"
											id="shopOwner" value="${business.shop.shopOwner }">
									</div>
								</div>
								<div class="form-group">
									<label for="telephone" class="col-xs-2 control-label">联系电话</label>
									<div class="col-xs-5">
										<input type="text" name="shop.telephone" class="form-control"
											id="telephone" value="${business.shop.telephone }">
									</div>
								</div>
								<div class="form-group">
									<label for="goodStyleId" class="col-xs-2 control-label">商店类型</label>
									<div class="col-xs-5">
										<select class="form-control" name="shop.shopStyleId"
											id="goodStyleId">
											<c:forEach items="${shopStyle}" var="style">
												<option value="${style.id }"
													<c:if test="${style.id == business.shop.shopStyleId }">
													selected="true"</c:if>>${style.styleName }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="address" class="col-xs-2 control-label">商店地址</label>
									<div class="col-xs-5">
										<input id="newAddress" type="text" name="shop.address" class="form-control"
											value="${business.shop.address }"> 
											<div class="input-group">
											<input type="text" class="form-control " id="address"
											placeholder="在这里输入新地址" value="">
										<a class="input-group-addon" id="addAddress" href="javascript:;" onclick="toAddAddress()">确定新地址</a>
										</div>
										<div id="searchResultPanel" class="col-xs-5"
											style="z-index:9999;border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
									</div>
								</div>
								<input name="shop.longitude" type="hidden" id="longitude">
								<input name="shop.latitude" type="hidden" id="latitude">
								<div class="form-group">
									<label for="shopScore" class="col-xs-2 control-label">商店评价</label>
									<div class="col-xs-5">
										<input name="shop.shopScore"
											class="form-control rating rating-loading" id="shopScore"
											value="${business.shop.shopScore }" data-size="xs"
											data-min="0" data-max="5" data-step="0.1"
											data-readonly="true">
									</div>
								</div>
								<div class="form-group">
									<label for="businessTime" class="col-xs-2 control-label">营业时间</label>
									<div class="col-xs-5">
										<input type="text" name="shop.businessTime"
											class="form-control" id="businessTime"
											value="${business.shop.businessTime }">
									</div>
									<div id="ttips" style="color:#1e89e0;padding-top: 5px">
										<small>*&nbsp;如有多个时间段请用“|”隔开"</small>
									</div>
								</div>
								<div class="form-group">
									<label for="startPrice" class="col-xs-2 control-label">配送起步价</label>
									<div class="col-xs-3">
										<div id="spnner" class="input-group spinner">
											<a id="startnumDown"
												class="input-group-addon btn btn-default startnumDown"
												onclick="startnumDown()">-</a> <input id="startinput"
												type="text" name="shop.startPrice" class="form-control"
												id="startPrice" value="${business.shop.startPrice }">
											<a id="startnumUp"
												class="input-group-addon btn btn-default btn-xs startnumUp"
												onclick="startnumUp()">+</a>
											<div class="input-group-addon">元</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="deliveryCost" class="col-xs-2 control-label">配送费</label>
									<div class="col-xs-3">
										<div id="spnner" class="input-group spinner">

											<a id="deliverynumDown"
												class="input-group-addon btn btn-default deliverynumDown"
												onclick="deliverynumDown()">-</a> <input id="deliveryinput"
												type="text" name="shop.deliveryCost" class="form-control"
												id="deliveryCost" value="${business.shop.deliveryCost }">
											<a id="deliverynumUp"
												class="input-group-addon btn btn-default btn-xs deliverynumUp"
												onclick="deliverynumUp()">+</a>
											<div class="input-group-addon">元</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="serviceScope" class="col-xs-2 control-label">服务范围</label>
									<div class="col-xs-3">
										<div id="spnner" class="input-group spinner">

											<a id="numDown"
												class="input-group-addon btn btn-default numDown"
												onclick="servicenumDown()">-</a> <input id="serviceinput"
												type="text" name="shop.serviceScope" class="form-control"
												id="serviceScope" value="${business.shop.serviceScope }">
											<a id="numUp"
												class="input-group-addon btn btn-default btn-xs numUp"
												onclick="servicenumUp()">+</a>
											<div class="input-group-addon">公里内</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="openState" class="col-xs-2 control-label">营业状态</label>
									<div class="col-xs-5">
										<select class="form-control" id="openState"
											name="shop.openState">
											<c:choose>
												<c:when test="${business.shop.openState == '0'}">
													<option value="0" selected="true">营业中</option>
													<option value="1">休息</option>
												</c:when>
												<c:otherwise>
													<option value="0">营业中</option>
													<option value="1" selected="true">休息</option>
												</c:otherwise>
											</c:choose>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="announce" class="col-xs-2 control-label">公告</label>
									<div class="col-xs-5">
										<textarea class="form-control col-sm-10" id="announce"
											name="shop.announce" rows="3">${business.shop.announce }</textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="auditState" class="col-xs-2 control-label">审核状态</label>
									<div class="col-xs-5">
										<c:choose>
											<c:when test="${business.shop.auditState == '0'}">
												<input id="auditState" class="form-control" disabled="true"
													value="审核中">
											</c:when>
											<c:when test="${business.shop.auditState == '1'}">
												<input id="auditState" class="form-control" disabled="true"
													value="已审核">
											</c:when>
											<c:otherwise>
												<input id="auditState" class="form-control" disabled="true"
													value="审核失败，请重新提交审核">
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-2 col-xs-offset-6">
										<c:choose>
											<c:when test="${0 eq business.shop.auditState }">
												<a class="btn btn-primary btn-sm" onclick="noAudit()">修改</a>
											</c:when>
											<c:otherwise>
												<button type="submit" class="btn btn-primary btn-sm">修改</button>
											</c:otherwise>
										</c:choose>
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
<script type="text/javascript">
function toAddAddress(){
	var toAddAggress = $("#address").val();
	/* alert(toAddAggress); */
	$("#newAddress").val(toAddAggress);
}
	// 百度地图API功能
	var map = new BMap.Map("allmap");

	function myFun(result) {
		var cityName = result.name;
		map.setCenter(cityName);
		map.centerAndZoom(cityName, 12); //初始化本地地址

	}
	var myCity = new BMap.LocalCity();
	myCity.get(myFun);


	function G(id) {
		return document.getElementById(id);
	}

	var ac = new BMap.Autocomplete( //建立一个自动完成的对象
		{
			"input" : "address",
			"location" : map
		});
	var localSearch = new BMap.LocalSearch(map);
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
	
		/*****************获取经纬度******************/
		map.clearOverlays(); //清空原来的标注
		var keyword = document.getElementById("address").value;
		localSearch.setSearchCompleteCallback(function(searchResult) {
			var poi = searchResult.getPoi(0);
			document.getElementById("longitude").value = poi.point.lng;
			document.getElementById("latitude").value = poi.point.lat;
			map.centerAndZoom(poi.point, 13);
			var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat)); // 创建标注，为要查询的地方对应的经纬度
			map.addOverlay(marker);
			var content = document.getElementById("text_").value + "<br/><br/>经度：" + poi.point.lng + "<br/>纬度：" + poi.point.lat;
			var infoWindow = new BMap.InfoWindow("<p style='font-size:14px;'>" + content + "</p>");
			marker.addEventListener("click", function() {
				this.openInfoWindow(infoWindow);
			});
		// marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
		});
		localSearch.search(keyword);
	});
</script>

</html>
