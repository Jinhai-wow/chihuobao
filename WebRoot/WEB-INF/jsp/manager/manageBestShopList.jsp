<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>畅销商品</title>
    
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
	<link id="themeLink" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
	
	
	
	 


  </head>
  
  <body>

	<table id="list" style="height:250px;"></table>
	
	<div id="detail" class="easyui-panel" title="图表显示"  
		 style="padding: 10px;  width: 100%; height: 400px; display: block;"  
            data-options="iconCls:'icon-more',closable:false,    
                collapsible:true,minimizable:false,maximizable:false,collapsed:true">   
		    
		 
		   </div>
	
    
	
	 
    <!-- 工具条 -->
    <div id="toolbar">
    	
		
		
		&nbsp;&nbsp;&nbsp;
   	
    	<a id="detailBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-more'" 
   		                  pageUrl="${pageContext.request.contextPath }/manager/shopCharts.action">查看图表</a>
    	
    	<input  id="dd"  type= "text" class= "easyui-datebox" required ="required"> </input>  
    	<a id="exportBtn" href="javascript:void(0)" class="easyui-linkbutton" style="float:right;" data-options="iconCls:'icon-save'">导出execl</a>
	</div>
    
   
   <script type="text/javascript">
    	$(function() {
    	
    	
    	
    	
    	
    	
    	var buttons = $.extend([], $.fn.datebox.defaults.buttons);
   		buttons.splice(1, 0, {
   			text : '重置',
   			handler : function(target) {
   				var url= "${pageContext.request.contextPath }/manager/selectBestShopList.action";
    			 $('#dd').datebox('setValue', '');
    			 $('#list').datagrid('options').url = url;
    				$("#list").datagrid('load');  
   			}
   		});
   		$('#dd').datebox({
   			buttons : buttons
   		});
    	
    	
   
   		$('#dd').datebox({
   			onSelect : function(date) {
   				var value = $(this).datebox('getValue');
   				alert(value);
   				var url= "${pageContext.request.contextPath }/manager/selectBestShopByTime.action";
   				if(value != null && value !="".trim()){
   					url = url+"?payTime="+value;
   				}
   				
   				 $('#list').datagrid('options').url = url;
    				
    				$("#list").datagrid('load');  
   				
   			}
   		});
   
   
   
   
   		$("a[pageUrl]").click(function(){
    		
    		var pageUrl = $(this).attr("pageUrl");
    		alert(pageUrl);
   			$('#detail').panel({
   			   collapsed:false,
   				content:"<iframe src='"+pageUrl+"' width='100%' height='100%' frameborder='0'><iframe>",
   				onLoad : function() {
   					alert('loaded successfully');
   				}
   			});
   		});
    		
    		
    		
    		$("#list").datagrid({
				
				title:'数据列表',
				resizable:true,
				fitColumns:true , 
				striped: true ,	
    			height:310 ,
    			rownumbers:true ,
				
				url:"${pageContext.request.contextPath }/manager/selectBestShopList.action",  		
    			columns:[[
    				{field:"id",title:"id",width:100,hidden:true},     
    				{field:"shopName",title:"商店名称",width:300},
    				{field:"styleName",title:"商店类型",width:300},
    				{field:"total",title:"商品数",width:250},
    				{field:"payTime",title:"时间",width:400,formatter:function(value,row,index){
    					if(value != null) {
    								da = new Date(value) ;
    								var year = da.getFullYear();
    								var month = da.getMonth() ;
    								var date = da.getDate();
	    							var hours = da.getHours();
	    							var minutes = da.getMinutes();
	    							var seconds = da.getSeconds();
    							return year+"-"+month+"-"+date+"-"+hours+":"+minutes+"-"+seconds;
    								}}},
    			]],
    			
    			pagination:true,
    			rownumbers:true ,
    			//工具条件
    			toolbar:"#toolbar",
    			sortName:"id",
    			sortOrder:'desc',
    		});
    		
    	
    	
    	//查看商家详细信息 
    	 
    	/* $("a[pageUrl]").click(function(){
    	
    			var rows = $("#list").datagrid("getSelections");
    			if(rows.length != 1){
    				$.messager.alert("提示","只能有一个","warning");
    				return;
    			}
    			
    			$("#detail").panel({
    			collapsed:false,
    		});
    			
    			var id = rows[0].id;
    			//1.获取pageUrl属性值（需要跳转的页面地址）
    			var pageUrl = $(this).attr("pageUrl");
    			//alert(pageUrl);
    			var url =  pageUrl+"?id="+id;
    			alert(url);
    			
    			//获取a标签的内容，标题
    			var title = $(this).text();	
    			//2.判断是否存在指定标题的选项卡
    			 if( $("#storerdetail").tabs("exists",title)  )  {
	    			//3.如果存在，则选项该选项卡
    				//$("#context").tabs("select",title);
    				$("#storerdetail").tabs("close",title);
    				
    				$("#storerdetail").tabs("add",{
    					title:title,
    					content:"<iframe src='"+url+"' width='100%' height='100%' frameborder='0'><iframe>",
    					closable:true
    				});	
    								
    			}else{
	    			//4.如果不存在，则添加选项卡
    				$("#storerdetail").tabs("add",{
    					title:title,
    					content:"<iframe src='"+url+"' width='100%' height='100%' frameborder='0'><iframe>",
    					closable:true
    				});				
    			} 
    			
    			//$('#storerdetail').panel('refresh');
    			
    		});
     */
    
    		/* $("#resertBtn").click(function(){
    		
    			var url= "${pageContext.request.contextPath }/manager/selectBestShopList.action";
    			 $('#list').datagrid('options').url = url;
    				$("#list").datagrid('load');  
    		}); */
    
    
    //导出execl
    		$("#exportBtn").click(function() {
    
    			//获取后台传递参数 className  methodName
    			//var data = $('#list').datagrid('getData').className;
    			/* var options=$('#list').pagination('options');
    			alert(options.pageSize);
    			alert(options.pageNumber); */
    			var className = $('#list').datagrid('getData').className;
    			var methodName = $('#list').datagrid('getData').methodName;
    
    			//获取表头信息
    			var header = $('#list').datagrid('options').columns[0];
    			
    			var fields = "";
    			var titles = "";
    			for (var i = 0; i < header.length; i++) {
    				var field = header[i].field;
    				var title = header[i].title;
    				var hiddenFlag = header[i].hidden;
    				if (!hiddenFlag) {
    					var dh = i == (header.length - 1) ? "" : ",";
    					fields = fields + field + dh;
    					titles = titles + title + dh;
    				}
    			}
    			
    			//向后台发送请求  
    			var form = $("<form>"); //定义一个form表单
    			form.attr('style', 'display:none');
    			form.attr('target', '');
    			form.attr('method', 'post');
    			form.attr('action', '${pageContext.request.contextPath }/manager/shopGoodsExport.action');
    			//添加input
    			var input1 = $("<input>");
    			input1.attr('type', 'hidden');
    			input1.attr('name', 'fields');
    			input1.attr('value', fields);
    
    			var input2 = $("<input>");
    			input2.attr('type', 'hidden');
    			input2.attr('name', 'titles');
    			input2.attr('value', titles);
    
    			var input3 = $("<input>");
    			input3.attr('type', 'hidden');
    			input3.attr('name', 'className');
    			input3.attr('value', className);
    
    			 var input4 = $("<input>");
    			input4.attr('type', 'hidden');
    			input4.attr('name', 'methodName');
    			input4.attr('value', methodName); 
    
    			//将表单放到body中
    			$('body').append(form);
    			form.append(input1);
    			form.append(input2);
    			form.append(input3);
    			form.append(input4);
    			form.submit(); //提交表单
     
    		});
    
    
    
    
    	});	
    
    	
    	
    </script>
    
    
    
  </body>
</html>
