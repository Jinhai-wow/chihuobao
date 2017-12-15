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
    
    <title>吃货宝home界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="css/bootstrap.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/iconfont.css">
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
				<a href="${pageContext.request.contextPath}/user/index.action"><img src="img/head-left.png" class=""></a>
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
						<button type="button" class="btn btn-sm btn-success">我要开店</button>
   					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="map-main clearfix">
			<div>
				<div class="main-top">
					<img src="img/map-logo.png" alt="map-logo">
				</div>
				<div class="main-bottom clearfix">
					<div class="map-search">
						<form>
							<div id="r-result"><input type="text" id="suggestId" size="20" value="百度" placeholder="请输入你的收货地址（写字楼，小区，街道或者学校）" /></div>
							<input class="search" type="submit" value="搜 索" />
							<div id="searchResultPanel"></div>
						</form>
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
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=cuO8YzFSo9UbHPVxQsSTEh85RcyAxzGt"></script>
<script type="text/javascript">
    // 百度地图API功能
    function G(id) {
        return document.getElementById(id);
    }

    var map = new BMap.Map("map");
    var point = new BMap.Point(116.331398,39.897445);
    map.centerAndZoom(point,17);
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

        setPlace();

    });

    function setPlace(){
        map.clearOverlays();    //清除地图上所有覆盖物
        function myFun(){
            var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
            map.centerAndZoom(pp, 18);
            map.addOverlay(new BMap.Marker(pp));    //添加标注

            addMarker(pp);
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
        // 用城市名设置地图中心点，画圆
        var pt = new BMap.Point(result.center.lng,result.center.lat);
        console.log(result.center.lng,result.center.lat);
        findPoint(pt);
    }
    var myCity = new BMap.LocalCity();
    myCity.get(myFun);
    //点击地图 获取当前点经纬度
    var geoc = new BMap.Geocoder();
    map.addEventListener("click",function(e){
//        alert(e.point.lng + "," + e.point.lat);
        var point = new BMap.Point(e.point.lng, e.point.lat);
        console.log(e.point.lng, e.point.lat)
        addMarker(point);
        findPoint(point);
        var pt = e.point;
        geoc.getLocation(pt, function(rs){
            var addComp = rs.addressComponents;
            var str = addComp.province  + addComp.city  + addComp.district  + addComp.street  + addComp.streetNumber;
            var input = document.querySelectorAll("#suggestId")[0];
            input.value = str;
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
    //查找坐标点
    function findPoint(mPoint){
        var circle = new BMap.Circle(mPoint,200,{fillColor:"blue", strokeWeight: 1 ,fillOpacity: 0.2, strokeOpacity: 0.3});
        map.addOverlay(circle);
        var local =  new BMap.LocalSearch(map, {renderOptions: {map: map, autoViewport: false}});
        local.searchNearby('餐馆',mPoint,200);
        console.log("hi")
    }



    // 计算距离用法
    var point1 =new BMap.Point(110.365494,21.277163);//用户所在经纬度
    var point2 =new BMap.Point(110.363685,21.27727);//商家所在经纬度
	//parseInt(getDistance(point1,point2) 获取用户与商家之间的距离
    console.log("距离 ： ",parseInt(getDistance(point1,point2)) , " 米")
    //计算两点距离
	function getDistance(point1,point2) {
        var lon1 = point1.lng;
        var lat1 = point1.lat;

        var lon2 = point2.lng;
		var	lat2 = point2.lat;

		var distance =  Math.acos(Math.sin(lat1) * Math.sin(lat2) + Math.cos(lat1) * Math.cos(lat2) * Math.cos(lon2 - lon1)) * 6371;
		//返回的单位是米。（distance 是获得公里）
		return distance *1000;
    }

</script>
  </body>
</html>
