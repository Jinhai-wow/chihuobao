<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
    <script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/chat.js"></script>
   
    <script type="text/javascript">
    	
    	$(function(){
    		var userId="4";
    	     alert(userId);
    	     var tmp = "0";
    	    var i = setInterval(function() {
    
    			var a = new Date().getMinutes();
    			
    			
    					 $.post("${pageContext.request.contextPath}/selectMessageByUserId.action",{'userId':userId}, function(data) {
    						
    						var value = data.length;
    						
    						if(parseInt(value)  > parseInt(tmp) ){
    						
    							tmp = value;
    							
    							alert(tmp);
    							
    						}
    					}); 
    				
    		}, 2000);
    
    	});
    	
    </script>
  </head>
  <body>
		
  </body>
</html>
