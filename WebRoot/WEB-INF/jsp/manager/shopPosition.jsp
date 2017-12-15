<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
		body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		#allmap{width:100%;height:350px;}
		p{margin-left:2px; font-size:14px;}
	</style>
	
</head>
  
  <body>
 
    <div id="allmap"></div>
    
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=3MW4LQdaPzh38ENXGkuE2BGm4V4N3fWo"></script>
	<script type="text/javascript">
			// 百度地图API功能
			var longitude = '${longitude }';
			var latitude = '${latitude }';
			var serviceScope = '${serviceScope }';
		
			var map = new BMap.Map("allmap"); // 创建Map实例
			var mPoint = new BMap.Point(longitude, latitude);
			map.enableScrollWheelZoom();
			map.centerAndZoom(mPoint, 15);
		
			var marker = new BMap.Marker(mPoint);  // 创建标注
			map.addOverlay(marker);              // 将标注添加到地图中
			map.panTo(mPoint); 
			
			
		
			var circle = new BMap.Circle(mPoint, serviceScope, {
				fillColor : "blue",
				strokeWeight : 1,
				fillOpacity : 0.3,
				strokeOpacity : 0.3
			});
			map.addOverlay(circle);
			var local = new BMap.LocalSearch(map, {
				renderOptions : {
					map : map,
					autoViewport : false
				}
			});
			local.searchNearby('餐馆', mPoint, serviceScope);
		
			
		</script>


		
    
  </body>
</html>


