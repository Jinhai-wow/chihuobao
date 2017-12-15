<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'TestShopWS.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

$(function(){

   var socket;
				if(typeof(WebSocket) == "undefined") {
					alert("您的浏览器不支持WebSocket");
					return;
				}

				
					//实现化WebSocket对象，指定要连接的服务器地址与端口
					socket = new WebSocket("ws://127.0.0.1:8080/CHB/ws?username=123");
					//打开事件
					socket.onopen = function() {
					
						alert("Socket 已打开");
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
					socket.send("这是来自订单的催单消息");
				});

				/* $("#btnClose").click(function() {
					socket.close();
				}); */
			
	
})

</script>
  </head>
  
  <body>
   <button id="cuidan">发送消息</button>
  </body>
</html>
