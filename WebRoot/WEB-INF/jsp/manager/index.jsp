 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
	<link id="themeLink" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
    
    <style type="text/css">
	   a {
			text-decoration: none;
			color: #000000;
		}
	</style>
    
    <script type="text/javascript">
    
    
    var adminbroadname="aaa";
    	alert(adminbroadname);
    	
    	var ws;  // 管理登陆，退出，用户列表的 socket
    	//var ws2;  // 管理聊天 的 socket
    	
    	window.onload= ws_init;
			
	    function  ws_init(){
				 var target="ws://localhost:8080/CHB/broadcast?username="+adminbroadname;
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
							
							 if(msg.content!=undefined){
								alert(msg.content);
							}	 
		   		  } 	 
	   	}
    
    	function subSend(){
	   		
	   		 var val = $("#msg").val();
	   		ws.send(val); 
	   		$("#msg").val("");
    	}
    
    
    	document.onkeydown = function(event) {
    		var e = window.event.keyCode ? window.event.keyCode : event.which ? event.which : event.charCode;
    		if (e == 13) {
    			subSend();
    		}
    	}
    
    
    
    
    	//----------------------------------------------------------------------
    	$(function(){
    	
    		var i = setInterval(function() {
    
    			var b = new Date();
    			var y = b.getFullYear();
    			var d = b.getMonth() + 1;
    			var n = b.getDate();
    			if (n < 10) {
    				n = "0" + n;
    			}
    			var date = y + "-" + d + "-" + n;
    
    			var a = new Date().getMinutes();
    			 if (a == 50) {
    			 alert("执行了");
    					 $.post("${pageContext.request.contextPath}/manager/orderDataAnalyse.action",{'date':date}, function(data) {
    						
    					}); 
    					} 
    		}, 60000)
    
    
    		//给a标签绑定时间
    		$("a[pageUrl]").click(function(){
    			//1.获取pageUrl属性值（需要跳转的页面地址）
    			var pageUrl = $(this).attr("pageUrl");
    			//alert(pageUrl);
    			//获取a标签的内容，标题
    			var title = $(this).text();
				//alert(title);
    			//2.判断是否存在指定标题的选项卡
    			if( $("#context").tabs("exists",title)  )  {
	    			//3.如果存在，则选项该选项卡
    				$("#context").tabs("select",title);				
    			}else{
	    			//4.如果不存在，则添加选项卡
    				$("#context").tabs("add",{
    					title:title,
    					content:"<iframe src='"+pageUrl+"' width='100%' height='100%' frameborder='0'><iframe>",
    					closable:true
    				});				
    			}
    		});
    		
    		//点击切换模块菜单的时候，进行切换模块
    		$("#Themesmeus").menu({
    			onClick:function(item){
    				//1.获取需要改变的模块名称
    				var themeName = item.text;
    				
    				//2.获取link标签的href属性
    				var href= $("#themeLink").attr("href");
    				
    				//3.更改href的属性值
    				// easyui/themes/default/easyui.css
    				href = href.substring(0,href.indexOf("themes"))+"themes/"+themeName+"/easyui.css";
    				
    				//4.更新link的href属性
    				$("#themeLink").attr("href",href);
    			}
    		});		
    	});
    
    </script>
    
	
  </head>
    <%-- <a href="${pageContext.request.contextPath }/text.action">搜索全部商家</a>
    
     <a href="${pageContext.request.contextPath }/text.action">搜索全部商家</a> --%>
     
     <body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">
		<strong style="font-size: 30px;">吃货宝系统管理平台</strong>
		
		<div id="themesDiv" style="position: absolute;right: 20px;top:40px;">
	    	<a href="javascript:void(0)" id="mb" class="easyui-menubutton"     
			        data-options="menu:'#Themesmeus',iconCls:'icon-edit'">切换风格</a>   
			<div id="Themesmeus" style="width:150px;">   
			    <div>default</div>   
			    <div>gray</div>   
			    <div>black</div>   
			    <div>bootstrap</div>   
			    <div>material</div>   
			    <div>metro</div>   
			</div>  
		</div>		
	</div>

	<div data-options="region:'west',split:false,title:'管理菜单'" style="width:200px;padding:5px;">

		<div class="easyui-accordion" style="width:190px;height:500px;" data-options="border:0">
		<!-- <div title="搜索区" data-options="iconCls:'icon-search',collapsed:false,collapsible:false" style="padding:10px;">
			<input class="easyui-searchbox" prompt="用户或商家" style="width:120px;height:25px;">
		</div> -->
		<div title="用户管理" data-options="selected:true" style="padding:10px;">
			<%-- <li><a href="javascript:void(0)" pageUrl="${pageContext.request.contextPath }/manager/user.action">用户信息管理</a></li> --%>
			
			<ul id="user" class="easyui-tree" data-options="animate:true,lines:true">
					<li ><span>用户管理</span>
						<ul>
							<li><a href="javascript:void(0)" 
							pageUrl="${pageContext.request.contextPath }/manager/user.action"><span>用户信息管理</span></a>
								</li>
							</ul>
						</li>
				</ul>
		
		
		</div>
		<div title="商家管理" style="padding:10px">
			<ul id="storer" class="easyui-tree" data-options="animate:true,lines:true">
					<li><span>商家管理</span>
						<ul>
							<li><a href="javascript:void(0)" 
							pageUrl="${pageContext.request.contextPath }/manager/storer.action"><span>商家信息管理</span></a>
								</li>
							<li><a href="javascript:void(0)" 
							pageUrl="${pageContext.request.contextPath }/manager/Goods.action"><span>商品管理</span></a>
								</li>
							<li><a href="javascript:void(0)" 
							pageUrl="${pageContext.request.contextPath }/manager/shop.action"><span>商店管理</span></a>
								</li>
							<li><a href="javascript:void(0)" 
							pageUrl="${pageContext.request.contextPath }/manager/order.action"><span>订单管理</span></a>
								</li>
							<li><a href="javascript:void(0)" 
							pageUrl="${pageContext.request.contextPath }/manager/goodsStyle.action"><span>商家类型管理</span></a>
								</li>
							<li>
								<span>商家审核</span>
								<ul>
								<li><a href="javascript:void(0)" 
							pageUrl="${pageContext.request.contextPath }/manager/shopData.action"><span>待审核</span></a>
								</li>
							<li><a href="javascript:void(0)" 
							pageUrl="${pageContext.request.contextPath }/manager/shopDataAuditSuccess.action"><span>审核通过</span></a>
								</li>
							<li><a href="javascript:void(0)" 
							pageUrl="${pageContext.request.contextPath }/manager/shopDataAuditFalse.action"><span>审核不通过</span></a>
								</li>	
								</ul>
							</li>
							
						</ul>
					</li>
			</ul>
			<%-- <li><a href="javascript:void(0)" pageUrl="${pageContext.request.contextPath }/manager/text.action">商家信息管理</a></li>
		    <li><a href="javascript:void(0)" pageUrl="${pageContext.request.contextPath }/manager/Goods.action">商品管理</a></li>
			<li><a href="javascript:void(0)" pageUrl="${pageContext.request.contextPath }/manager/shop.action">商家管理</a></li>
			<li><a href="javascript:void(0)" pageUrl="${pageContext.request.contextPath }/manager/order.action">订单管理</a></li>
			<li><a href="javascript:void(0)" pageUrl="${pageContext.request.contextPath }/manager/goodsStyle.action">商家类型管理</a></li> --%>
		</div>
		<div title="消息管理" style="padding:10px">
			<ul id="note" class="easyui-tree" data-options="animate:true,lines:true">
					<li><span>消息管理</span>
						<ul>
							<li><a href="javascript:void(0)" 
							pageUrl="${pageContext.request.contextPath }/go.action?"+new Date().getTime()><span>客服回复</span></a>
								</li>
							<li><a href="javascript:void(0)" 
							pageUrl="${pageContext.request.contextPath }/sendMessage.action?"+new Date().getTime()><span>发送通知</span></a>
								</li>
							</ul>
						</li>
				</ul>
			
			<%-- <li><a href="javascript:void(0)" pageUrl="${pageContext.request.contextPath }/manager/oper.action">查看操作记录</a></li>
			<li><a href="javascript:void(0)" pageUrl="${pageContext.request.contextPath }/go.action?"+new Date().getTime()>客服入口</a></li>
			<li><a href="javascript:void(0)" pageUrl="${pageContext.request.contextPath }/manager/bestGoods.action?"+new Date().getTime()>商品分析</a></li>
			<li><a href="javascript:void(0)" pageUrl="${pageContext.request.contextPath }/manager/goodsCharts.action?"+new Date().getTime()>畅销商品显示</a></li>
			<li><a href="javascript:void(0)" pageUrl="${pageContext.request.contextPath }/manager/bestShop.action?"+new Date().getTime()>商家分析</a></li> --%>
		</div>

		<!-- data-options="href:'_content.html'" -->
		<div title="系统管理"  style="padding:10px">
				<ul id="system" class="easyui-tree" data-options="animate:true,lines:true">
					<li><span>系统管理</span>
						<ul>
							<li><a href="javascript:void(0)" 
							pageUrl="${pageContext.request.contextPath }/manager/oper.action"><span>查看操作记录</span></a>
								</li>
							</ul>
						</li>
				</ul>
			</div>
		<div title="数据分析管理"  style="padding:10px">
				<ul id="data" class="easyui-tree" data-options="animate:true,lines:true">
					<li><span>分析数据</span>
						<ul>
							<li><a href="javascript:void(0)" 
							pageUrl="${pageContext.request.contextPath }/manager/bestGoods.action?"+new Date().getTime()><span>商品分析</span></a>
								</li>
							<li><a href="javascript:void(0)" 
							pageUrl="${pageContext.request.contextPath }/manager/bestGoods.action?"+new Date().getTime()><span>商家分析</span></a>
								</li>
							</ul>
						</li>
				</ul>
			</div>
			
			
	</div>

	</div>

	<div data-options="region:'east',split:true,collapsed:true,title:'公共区'" style="width:180px;padding:3px;">
		
		<h1>消息推送</h1>
		<div   style="margin-top: 10px; clear: both;"  >
			<input id="msg" onKeyDown="if(event.keyCode==13 && event.ctrlKey){subSend();}">
			<button onclick="subSend()">send</button>
		</div>
		<div id="cc" class="easyui-calendar" style="width:170px;height:150px;position: absolute;bottom: 5px;"></div> 
		
	</div>

	

	<div data-options="region:'south',border:false" style="height:30px;background:#A9FACD;padding:10px;text-align: center;">
		<span style="font-size: 10px;">软件1143吃货宝</span>
	</div>


	<div data-options="region:'center',title:'内容专区'">
		

	<div id="context" class="easyui-tabs" style="width:100%;height:100%">
	
		<div title="首页" style="padding:10px;">欢迎</div>
	</div>
</div>
		
	


	
</body>
  
</html>
