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

<title>My JSP 'orderList.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/qunit-1.11.0.css">
<link rel="stylesheet" type="text/css" href="css/pagination.css">
<link href="${pageContext.request.contextPath }/css/business.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-paginator.js"></script>
<script src="js/jquery.pagination.js"></script>


<style type="text/css">
.containerDiv {
	border: 1px solid #eee;
	margin: 30px;
}

/*  调table tb高度*/
.table td {
	height: 100px;
	/* max-height:100px; */
	/* border-top: 1px solid #ddd; */
}

.table .fontPosition {
	padding-top: 50px;
}

.goods {
	width: 70px;
	height: 70px;
}

/* .btnPos{
   margin-top:30px;
} */
.btnPos {
	margin-top: 20px;
}
</style>

<script type="text/javascript">

	$(function() {

		/*获取数据数  */
		$.ajax({
			url : "${pageContext.request.contextPath}/ajaxorderlistsize.action",
			data : '{}',
			contentType : "application/json;charset=utf-8",
			type : "post",
			dataType : "json",
			success : function(data) {
				/*用浏览器console查看  */
				console.log(data);


				/* 总页数 */

				var initPagination = function() {
					var totalPage;
					/* 分页总页数做处理 如果总数小于5 */
					if (data % 5 != 0) {
						totalPage = Math.ceil(data / 5);
					/* alert(totalPage); */
					/* alert(data); */
					} else {
						totalPage = data / 5;
					/*  alert(totalPage); */
					}
					/*  alert("totalPage"+totalPage); */
					$("#Pagination").pagination(totalPage, {
						maxentries : data,
						num_edge_entries : 1, //边缘页数
						num_display_entries : 4, //主体页数
						callback : pageselectCallback,
						items_per_page : 1 //每页显示5项
					});
				}();



			}
		});




		// 创建分页
		/* 用ajax获取总数据数算出页数  num_entries就是总页数*/

		/*    var surplus; */
		/*         var createtime; */
		var last_page_index = 0;
		var last_temp_page_index = 0;
		function pageselectCallback(page_index, jq) {
			/* 记录上一页 */

			if (page_index != last_page_index) {
				last_temp_page_index = page_index;
			}

			/* alert(page_index); */
			var page = page_index * 5;
			/*mysql 如limit 2 5表示从第二行开始取五行  */
			$.ajax({
				url : "${pageContext.request.contextPath}/ajaxorderlist.action",
				data : '{"page":' + page + ',"rows":5}',
				contentType : "application/json;charset=utf-8",
				type : "post",
				dataType : "json",
				success : function(data) {
					/*用浏览器console查看  */
					console.log(data);
					/*  alert(data[0].shopname);*/
					/*    alert(data.length);  */
					//////////////////
					/* alert(data.length); */
					for (var i = 0; i < data.length; i++) {
						var createtime = new Date(data[i].createtime).toLocaleDateString()
						+ "&nbsp"
						+ new Date(data[i].createtime).getHours() + ":"
						+ new Date(data[i].createtime).getMinutes() + ":"
						+ new Date(data[i].createtime).getSeconds();
						/*自动添加到tbody里面去  */
						var content = "<tr>"
							+ "<td class='fontPosition'>"
							+ createtime

							+ "</td>"
							+ "	<td><img src='${pageContext.request.contextPath}/upload/business/"
							+ data[i].shoppic
							+ "' class='img-circle goods'> <span><br>"
							+ data[i].shopname

							+ "<p class='text-muted'>";
						for (var j = 0; j < data[i].ordergoodsList.length; j++) {
							content += data[i].ordergoodsList[j].goodsname + "<br>";

						}

						var contentAdd = "</p>"
							+ "<p class='text-muted'>订单号:"
							+ data[i].id
							+ "</p>"
							+ "</span></td>"

							+ "<td class='fontPosition'>"
							+ data[i].totalmoney
							+ "</td>";
						/*  +"<td class='fontPosition text-info'>"; */
						/*+(180000-(new Date().getTime()-new Date(data[i].createtime).getTime()))  */
						if (data[i].orderstate == 0) {
							/* 未付款状态才调用function */

							contentAdd += "<td class='fontPosition text-info' >" + "未付款<br/><span class='text-danger'>请30分钟内支付</span>";

							/*  id用的是系统时间*/


							/* var ordercreatetime=new Date(data[i].createtime).getTime(); */
							/*  $("#nopay"+0).html("请30分钟内付款");  */
							/*  $("#nopay"+1).html("请30分钟内付款"); 
							 $("#nopay"+2).html("请30分钟内付款"); */



							/* 	 setInterval(function () {
                        var time=new Date().getTime();
                       alert(time);  
                       
                        if(time-ordercreatetime<1800000){
                        var surplus=new Date(1800000-(time-ordercreatetime));
                         alert(ordercreatetime);
                       $("#nopay"+i).html("剩余支付时间:"+
								surplus.getMinutes()+"分"
								+surplus.getSeconds()+"秒");
								}
								 if(surplus.getMinutes()==0&&surplus.getSeconds()==0){
								 $("#nopay"+i).html("");
								
								} 
								
                      }, 1000);   */

						}

						if (data[i].orderstate == 1) {
							contentAdd += "<td class='fontPosition text-info'>" + "未接单</td>";
						}
						if (data[i].orderstate == 2) {
							contentAdd += "<td class='fontPosition text-info'>" + "已接单</td>";
						}
						if (data[i].orderstate == 3) {
							contentAdd += "<td class='fontPosition text-info'>" + "已发货</td>";
						}
						if (data[i].orderstate == 4) {
							contentAdd += "<td class='fontPosition text-info'>" + "订单取消</td>";
						}
						if (data[i].orderstate == 5) {
							contentAdd += "<td class='fontPosition text-info'>" + "已确认收货</td>";
						}
						if (data[i].orderstate == 7) {
							contentAdd += "<td class='fontPosition text-info'>" + "申请取消订单中</td>";
						}
						if (data[i].orderstate == 8) {
							contentAdd += "<td class='fontPosition text-info'>" + "已评价</td>";
						}
						if (data[i].orderstate == 9) {
							contentAdd += "<td class='fontPosition text-info'>" + "订单已失效</td>";
						}


						contentAdd = contentAdd + "<td><a class='btn btn-default btnPos' href='${pageContext.request.contextPath}/orderDetail.action?id="
							+ data[i].id
							+ "'>订单详情</a><br />";

						if (data[i].orderstate == 0) {
							contentAdd = contentAdd + "<a class='btn btn-primary btnPos' href='${pageContext.request.contextPath}/pay.action?orderId="
								+ data[i].id + "&money=" + data[i].totalmoney+ "&FrpId=CCB-NET-B2C"

								+ "'>去付款</a></td></tr>";
						} else {
							contentAdd = contentAdd + "<a class='btn btn-primary btnPos' href='${pageContext.request.contextPath}/payOrder.action?shopcartid="
								+ data[i].shopcartid 
								+ "'>再来一单</a></td></tr>";
						}


						content += contentAdd;
						if (page_index != last_page_index) {

							/*  只清空一次*/
							if (i == 0) {
								$("#addDiv").empty();
							}
							$("#addDiv").append(content);
						} else {
							$("#addDiv").append(content);

						}


					}
					////////////////// 
					/* for循环结束后 */
					last_page_index = last_temp_page_index;
				}
			});

			return false;
		}

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


	<div class="container-fluid containerDiv">
		<strong>我的订单</strong><br>
		<!-- table表单 -->
		<div>

			<table class="table table-hover">
				<thead>
					<tr>
						<th>下单时间</th>
						<th>订单内容</th>
						<th>支付金额(元)</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="addDiv">

				</tbody>
			</table>

		</div>




		<div id="Pagination" class="pagination pull-right fixed-bottom"></div>

	</div>
</body>
</html>
