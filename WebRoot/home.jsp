<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>home</title>
	<link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="css/iconfont.css">
	<style>

		/*-------------全局设置 开始-------------------*/

		/*-------------全局设置 结束-------------------*/
		/*百度地图去左下角水印*/
		.anchorBL{display:none;}

		/*背景图*/
		.map{
			position: absolute;
			right: 0;
			top: 0;
			left: 0;
			height: 500px;
			background: url("img/bg-index.png");
			background-size: cover;
		}

		/*---------------map-head部分 开始-------------------*/
		.map-head{
			padding-top: 25px;
			line-height: 45px;
		}
		.head-left,
		.head-right{
			display: inline-block;
		}
		.head-right,
		.head-right a{
			text-decoration: none;
			font-size: 14px;
			vertical-align: middle;
			color: #FFF;
		}
		.head-right span{
			display: inline-block;
			margin: 0 10px 0;
		}
		.head-right button{
			margin-left: 20px;
		}


		/*---------------map-head部分 结束-------------------*/

		/*---------------map-main部分 开始-------------------*/
		.map-main{
			text-align: center;
			margin-top: 140px;
			margin-bottom: 50px;
		}
		.map-main .main-top{
			margin-bottom: 70px;
		}
		.main-bottom{
			width: 80%;
			height: 56px;
			text-align: center;
			margin: 0 auto;
		}
		.map-search{
			margin: 0 auto;
			width: 100%;
			height: 100%;
		}
		#r-result{
			display: inline-block;
			width: 55%;
			height: 100%;
		}
		#r-result input{
			width: 100%;
			height: 56px;
			border: none;
			outline: 0;
			font-size: 16px;
			vertical-align:middle;
		}
		.search{
			width: 100px;
			height: 56px;
			border: none;
			color: #fff;
			background-color: #f74342;
			vertical-align:middle;
			margin-left: 10px;
		}
		.search:hover{
			background-color: rgba(247,67,66,0.7);
		}
		#searchResultPanel{
			width: 100%;
			height:auto;
			border:none;
			display:none;
		}
		/*---------------map-main部分 结束-------------------*/
		/*---------------show-map部分 开始-------------------*/
		.show-map {
			width: 100%;
			height: 360px;
			margin: 105px auto 0;
		}
		.show-map #map{
			width: 100%;
			height: 100%;

		}
		/*---------------show-map部分 结束-------------------*/
		/*---------------footer部分 开始-------------------*/

		#footer{
			/*margin-top: 50px;*/
		}
		#footer .row .nav li:first-of-type{
			font-size: 14px;
			line-height: 30px;
			font-weight: 400;
		}
		#footer .row .nav li a{
			padding: 0;
			margin: 0;
			font-size: 12px;
			color: #999;
			display: block;
			line-height: 24px;
			text-decoration: none;
			width: 50%;
		}
		.footer-copyright{
			padding-top: 60px;
		}
		.footer-copyright .link a{
			color:#666;
		}
		.footer-copyright p{
			margin: 0;
			padding: 0 ;
			color:#999;
			text-align: center;
		}
		.footer-copyright p a{
			text-decoration: none;
			color:#999;
		}
		/*---------------footer部分 结束-------------------*/
	</style>
</head>
<body>

<div id="big-box" class="map">
	<div class="container">
		<div class="map-head clearfix">
			<div class="head-left">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/user/index.action">
					<img src="img/chb-logo.png" class="">
				</a>
			</div>
			<div class="head-right pull-right">
					<c:choose>
   					<c:when test="${user!=null }">
   						<span>${user.user.username }</span>
   						<a href="${pageContext.request.contextPath}/user/logout.action">安全退出</a>
   					</c:when>
   
   					<c:otherwise>  
   						<a href="${pageContext.request.contextPath}/user/loginPage.action">注册</a>
						<span>|</span>
						<a href="${pageContext.request.contextPath}/user/loginPage.action">登录</a>
						<a  href="${pageContext.request.contextPath}/user/StorerLoginPage.action">
						<button type="button" class="btn btn-sm btn-success">我要开店</button>
						</a>
   					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="map-main clearfix">
			<div>
				<div class="main-top">
					<img src="img/chb-map-logo.png" alt="map-logo">
				</div>
				<div class="main-bottom clearfix">
					<div class="map-search">
						<div>
							<%-- <form action="${pageContent.request.contentPath }/showShopId.action" method="post"> --%>
								<div id="r-result"><input type="text" id="suggestId" size="20" placeholder="请输入你的收货地址（写字楼，小区，街道或者学校）" /></div>
								<input name="address" class="search" type="button" value="选这里" />
								<div id="searchResultPanel"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="show-map">
			<div id="map"></div>
		</div>
		<footer id="footer">
			<div class="clearfix">
				<div class="footer-copyright">
					<p class="link">
						<a href="#">我要开店</a>
						|
						<a href="#">联系我们</a>
						|
						<a href="#">加入我们</a>
					</p>
					<p>
						增值电信业务许可证 :
						<a href="#">沪B2-20150033</a>
						|
						<a href="#">沪ICP备 09007032</a>
						|
						<a href="#">上海工商行政管理</a>
						Copyright ©2008-2017 ele.me, All Rights Reserved.
					</p>
				</div>
			</div>
		</footer>
	</div>
</div>

<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/GeoUtils/1.2/src/GeoUtils_min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=cuO8YzFSo9UbHPVxQsSTEh85RcyAxzGt"></script>


<script type="text/javascript">
 $(function () {
        // 百度地图API功能
        function G(id) {
            return document.getElementById(id);
        }

        var myPoint = {};
        var location_ = "";
        var map = new BMap.Map("map");
        map.centerAndZoom(new BMap.Point(110.307239,21.157362),18);
        map.enableScrollWheelZoom(true);
        var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
            {"input" : "suggestId"
                ,"location" : map
            });

        ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
            var str = "";
            var _value = e.fromitem.value;
            var value = "";
            if (e.fromitem.index > -1) {
                value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
            }
            str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
            value = "";
            if (e.toitem.index > -1) {
                _value = e.toitem.value;
                value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
            }
            str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
            G("searchResultPanel").innerHTML = str;
        });

        var myValue;
        ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
            var _value = e.item.value;
            myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
            G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
			location_ = myValue;
            setPlace();
        });

        function setPlace(){
            map.clearOverlays();    //清除地图上所有覆盖物
            function myFun(){
                var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
                map.centerAndZoom(pp, 18);
                map.addOverlay(new BMap.Marker(pp));    //添加标注
                addMarker(pp);
                myPoint = pp;
            }
            var local = new BMap.LocalSearch(map, { //智能搜索
                onSearchComplete: myFun
            });
            local.search(myValue);
        }
        //初始化地图时，坐标为用户当前的ip地址位置
        function myFun(result){
            var cityName = result.name;
            map.setCenter(cityName);
        }
        var myCity = new BMap.LocalCity();
        myCity.get(myFun);
        //点击地图 获取当前点经纬度
        var geoc = new BMap.Geocoder();
        map.addEventListener("click",function(e){
            var point = new BMap.Point(e.point.lng, e.point.lat);
            addMarker(point);
            myPoint = point;
            var pt = e.point;
            geoc.getLocation(pt, function(rs){
                var addComp = rs.addressComponents;
                var str = addComp.province  + addComp.city  + addComp.district  + addComp.street  + addComp.streetNumber;
                var input = document.querySelectorAll("#suggestId")[0];
                input.value = str;
                location_ = str;
              /*   var userPoint = {
	                lng:myPoint.lng,
	                lat:myPoint.lat,
	                place:str
	            }
		        localStorage.setItem("userPoint",JSON.stringify(userPoint)); */
            });
        });
        var position = new BMap.Label("我在这里",{offset:new BMap.Size(-15,-40)});
        position.setStyle({
            fontWeight: 900,
            fontSize : "12px",
            height : "20px",
            lineHeight : "20px",
            border:"none",
            borderRadius: "20%",
            backgroundColor: "transparent"
        });
        // 编写自定义函数,创建标注
        function addMarker(point){
            map.clearOverlays();
            var marker = new BMap.Marker(point);
            marker.setLabel(position);
            map.addOverlay(marker);
            marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
        }
        //计算两点距离
        function getDistance(Point1,Point2) {
            return Math.floor(BMapLib.GeoUtils.getDistance(Point1,Point2)/1000);
        }
        showPoint()
        function showPoint() {
            $(".search").on("click",function () {
                if(myPoint.lng == null || myPoint.lng == "" ||myPoint.lat == null || myPoint.lat == ""){
                    alert("请在地图上选取派送位置");
                }else{
                    var data = {
                        lng:myPoint.lng,
                        lat:myPoint.lat,
                        range:10//搜索用户坐标的，10公里内的所有商家
                    }
                    $.ajax({
                        url: "${pageContext.request.contextPath}/showShopId.action",
                        type: "post",
                        contentType: "application/json",
                        dataType: "json",
                        data: JSON.stringify(data),
                        success: function (result) {
                        
                            setStorage(result,data);
                            window.location.href="user/index.action";
                        },error: function (XMLResponse) {
                            alert(XMLResponse.responseText)
                        }
                    });
                };
            });
	}

    function setStorage(result,data){
        if(result!=null && result != []){
            var shopIdList = [];
            var Point1 = new BMap.Point(myPoint.lng,myPoint.lat);
            for( var i in result){
                var Point2 = new BMap.Point(result[i].longitude , result[i].latitude);
                var distance = getDistance(Point1,Point2);
                //找到可以进行配送的商家
                if(distance < result[i].serviceScope){
                    //找到10距离用户10公里以内的商家
                    if(distance < parseInt(data.range)){
                        shopIdList.push(result[i].id+":"+result[i].shopName+":"+result[i].shopPic);
                    }
                }
            }
            var userPoint = {
                lng:myPoint.lng,
                lat:myPoint.lat,
                place:location_
	        }
		    localStorage.setItem("userPoint",userPoint.place);
            localStorage.setItem("nearbyShopIdList",shopIdList);//JSON.stringify(shopIdList)
        }
    };
	    
});
</script>
</body>
</html>