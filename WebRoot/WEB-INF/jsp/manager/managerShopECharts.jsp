<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>'goodsCharts.jsp' starting page</title>
    
	<script type="text/javascript" src="${pageContext.request.contextPath }/echarts/echarts.js"></script>
	 <script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
	<link id="themeLink" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
  </head>
  
  <body>
  
  	&nbsp;&nbsp;&nbsp;
   <input id="fromdate" class="easyui-datebox" sharedCalendar="#date">
   -
	<input id="todate" class="easyui-datebox" sharedCalendar="#date">
	<div id="date" class="easyui-calendar"></div>
   </br></br>
   
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 800px;height:230px;"></div>
    
    <script type="text/javascript">
       
        	$(function(){
        	
        
			
        // 选择时间 
		 	var fromdate = null;
			var todate = null;
			$('#fromdate').datebox({
				onSelect : function(date) {
				fromdate = $(this).datebox('getValue');
				
				}
			});
			$('#todate').datebox({
				onSelect : function(date) {
				todate = $(this).datebox('getValue');
				
			
				if(fromdate != null){
					
					if(fromdate < todate){
					
					alert("进来了");
					
					
				var url = "${pageContext.request.contextPath}/manager/shopChartsListBydate.action"+"?fromdate="+fromdate+"&todate="+todate;
    			$.post(url, function(data) {
	
						var xdata = []; //X轴name
						var ydata = []; //y轴数据
						var d = []; //时间
	
					for (var i = 0; i < data.length; i++) {
    
    					da = new Date(data[i].payTime) ;
    					var year = da.getFullYear();
    					var month = da.getMonth();
    					var date = da.getDate();

    					d.push(year+"/"+month+"/"+date);
    					xdata.push(data[i].goodsName);
    					ydata.push(data[i].total);
    				}
    				
    				
    			
    		var myChart = echarts.init(document.getElementById('main'));
				// 显示标题，图例和空的坐标轴
				myChart.setOption({
				
			  color: ['#3398DB'],
			  title: {
                text: '每天最畅销的商品',
                
                subtext: '数量('+d[0]+"-"+d[d.length - 1]+')',
                
            },
				
    				tooltip : {
    					
    					axisPointer : { // 坐标轴指示器，坐标轴触发有效
    						type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
    					}
    				},
    				legend : {
    					data : [ '销量' ]
    				},
    				grid : {
    					left : '3%',
    					right : '4%',
    					bottom : '3%',
    					containLabel : true
    				},
    				xAxis : [
    					{
    						type : 'category',
    						data : [],
    						axisTick : {
    							alignWithLabel : true
    						}
    					}
    					
    				],
    				yAxis : [
    				
    					{
    						type : 'value',
    						
    						 
    					} 
    					
    					
    				],
    				series : [
    					{
    						label : {
    							normal : {
    								show : true,
    								position : 'top'
    							}
    						},
    						
    						type : 'bar',
    						barWidth : '50%',
    						data : []
    					}
    				]
    			});
				
				// 异步加载数据
				
				    // 填入数据
				    myChart.setOption({
				        xAxis: {
				        	
				            data: xdata,
    					
    				},
    				
				        series: [{
				            // 根据名字对应到相应的系列
				            
				            
				            name: '销量',
				            data: ydata
				            
				        }]
				    });
						
    	});
    			
					
				}
			}else{
				alert("不能为空");
			}
				
				
				}
			});
			
        
        
        
        	
        	
        	
         $.post("${pageContext.request.contextPath}/manager/shopChartsList.action", function(data) {
    
    				var xdata = []; //X轴name
    				var ydata = []; //y轴数据
    				var d = [];    //时间
    				for (var i = 0; i < data.length; i++) {
    
    					da = new Date(data[i].payTime) ;
    					var year = da.getFullYear();
    					var month = da.getMonth();
    					var date = da.getDate();

    					d.push(year+"/"+month+"/"+date);
    					xdata.push(data[i].shopName);
    					ydata.push(data[i].total);
    				}
    			
    				var myChart = echarts.init(document.getElementById('main'));
				// 显示标题，图例和空的坐标轴
				myChart.setOption({
				
			  color: ['#3398DB'],
			  title: {
                text: '每天销售最多商品的商家',
                
                subtext: '数量('+d[0]+"-"+d[6]+')',
                
            },
				
    				tooltip : {
    					
    					axisPointer : { // 坐标轴指示器，坐标轴触发有效
    						type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
    					}
    				},
    				legend : {
    					data : [ '销量' ]
    				},
    				grid : {
    					left : '3%',
    					right : '4%',
    					bottom : '3%',
    					containLabel : true
    				},
    				xAxis : [
    					{
    						type : 'category',
    						data : [],
    						axisTick : {
    							alignWithLabel : true
    						}
    					}
    					
    				],
    				yAxis : [
    				
    					{
    						type : 'value',
    						
    						 
    					} 
    					
    					
    				],
    				series : [
    					{
    						label : {
    							normal : {
    								show : true,
    								position : 'top'
    							}
    						},
    						
    						type : 'bar',
    						barWidth : '50%',
    						data : []
    					}
    				]
    			});
				
				// 异步加载数据
				
				    // 填入数据
				    myChart.setOption({
				        xAxis: {
				        	
				            data: xdata,
    					
    				},
    				
				        series: [{
				            // 根据名字对应到相应的系列
				            
				            
				            name: '销量',
				            data: ydata
				            
				        }]
				    });
				
				        
    					
    						
    	}); 
        
        
    });    
        
       
        
    </script>
   
  </body>
</html>
