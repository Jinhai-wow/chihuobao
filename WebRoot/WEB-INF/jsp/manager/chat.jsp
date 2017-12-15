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
    	var username='${sessionScope.user.username }';
    	var users=[];
    	
    	var ws;  // 管理登陆，退出，用户列表的 socket
    	//var ws2;  // 管理聊天 的 socket
    	
    	window.onload= ws_init;
			
	    function  ws_init(){
				 var target="ws://172.16.11.236:8080/CHB/chat?username="+username;
		   		  if ('WebSocket' in window) {
		                 ws = new WebSocket(target);
		             } else if ('MozWebSocket' in window) {
		                 ws = new MozWebSocket(target);
		             } else {
		                 alert('WebSocket is not supported by this browser.');
		                 return;
		             }
		             
		   		  ws.onopen=function(){
			    			
		   		  };
		   		   
		   		  window.onbeforeunload=function(){
		   		  		ws.close();
		   		 
		   		  }
		   		   
		   		   
		   		   ws.onmessage=function(event){
		   			  		
		   			  	eval("var msg="+event.data+";"); 
							
							 if(msg.welcome!=undefined)
							$("#content").append(msg.welcome);
							if(msg.usernames!=undefined){
							$("#userList").html("");
							var array = msg.usernames;	
								$(msg.usernames).each(function(i){
									if(username != "aaa"){
										return;
									}else{
									
									$("#userList").append("<input type=checkbox value='"+this+"'/>"+this+"</br>");
									}
								});
								if(username != "aaa"){
									$("#userList").append("<input type=checkbox value='"+username+"'/>"+username+"</br>");
									$("#userList").append("<input type=checkbox value='aaa'/>aaa</br>");
								}
									
							} 
							
							if(msg.content!=undefined){
								$("#content").append(msg.content+"</br>");
							} 
							 
		   		  }
		   		 
	   	}
	   	
	   	
	   	
	   	
	   function subSend(){
	   		var uc=$("#userList :checked");
	   		 var val = $("#msg").val();
	   		
	   		 var obj=null;
	   		if(uc.size()==0){
	   			/* obj={
	   				msg:val,
	   				type:1
	   			} */
	   			alert("选择需要为你服务的管理员");
	   			
	   		}else{
	   			var to = $("#userList :checked").val();
	   			var name='${sessionScope.username }'; 
	   			 
	   			 obj= {
	   			from:name,
	   			to:to,
	   			msg:val,
	   			type:2  //1wei guangbo 2danliao
	   			
	   			}
	   			
	   			var str = JSON.stringify(obj);
	   			//alert(str);
	   		   ws.send(str);
	   		}
	   		$("#msg").val(""); 	
	   }	
	   	
	   	
	   	document.onkeydown = function(event) {
    		var e = window.event.keyCode ? window.event.keyCode : event.which ? event.which : event.charCode;
    		if (e == 13) {
    			subSend();
    		}
    	}
	   	
	   	
	   function checkScrollScreen(){
		if(!$("#scrollScreen").attr("checked")){
	    	$("#content").css("overflow","scroll");
	    }else{
	    	$("#content").css("overflow","hidden");
	        //当聊天信息超过一屏时，设置最先发送的聊天信息不显示
	        //alert($("#content").height());
	        $("#content").scrollTop($("#content").height()*2);
	    }
	    setTimeout('checkScrollScreen()',500);
	} 
	
	
	
	  
    </script>
  </head>
  <body>
		<h3> 欢迎 ${sessionScope.username }进入</h3>
		
		<div   id="content"  style="background-color: aqua; width: 500px; height:600px;
			float:left;
		" >
			<!-- 
				这个div显示所有的  聊天信息的内容
			 -->
		</div>
		<div  id="userList"  style="background-color: olive; width: 200px; height:600px; 
			   float: left;
		" >
			<!-- 
				这个div 显示所有的在线用户
				这里要 显示两部分内容 是不是以为这要  两个 webSocket通道才能完成呢？？
				一个通道能否完成！！  
				回答：  两个webSocket通道 显然更加简单一些啊。。。
			 -->
		</div>
		
		<td width="19" align="left"><input name="scrollScreen"
					type="checkbox" class="noborder" id="scrollScreen"
					onClick="checkScrollScreen()" value="1" checked>
				</td>

		<div   style="margin-top: 10px; clear: both;"  >
			<input id="msg" onKeyDown="if(event.keyCode==13 && event.ctrlKey){subSend();}">
			<button onclick="subSend()">send</button>
		</div>
		
		<div width="19" align="left" style="positon:'relative';float:right;"><input name="scrollScreen"
					type="checkbox"  id="scrollScreen"
					onClick="checkScrollScreen()" value="1" >
				</div>

  </body>
</html>
