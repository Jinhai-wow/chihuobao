<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
	<link id="themeLink" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
    
    <script type="text/javascript">
    	$(function(){
    	
    		$("#list").datagrid({
				
				title:'数据列表',
				resizable:true,
				fitColumns:true , 
				striped: true ,	
    			height:400 ,
    			rownumbers:true ,
				
				url:"${pageContext.request.contextPath }/manager/selectopera.action",   			
    			columns:[[
    				{field:"id",title:"操作编号",width:100},     
    				{field:"operation",title:"操作事项",width:400},
    				{field:"tyle",title:"操作人",width:200},
    				{field:"operaDate",title:"操作时间",width:300,formatter:function(value,row,index){
    					if(value != null) {
    								da = new Date(value) ;
    								var year = da.getFullYear() ;
    								var month = da.getMonth() ;
    								var date = da.getDate();
	    							var hours = da.getHours();
	    							var minutes = da.getMinutes();
	    							var seconds = da.getSeconds();
    							return year+"-"+month+"-"+date+"-"+hours+"-"+minutes+"-"+seconds;
    								}}},
    				{field:"operaRole",title:"操作对象",width:200,formatter:function(value,row,index){
    					if(value != null){
    						if(value == 1){
    							return "<font color='red'>商家</font>";
    						}else if(value == 2){
    							return "<font color='green'>普通用户</font>";
    						}else if(value == 3){
    							return "<font color='blue'>商品</font>";
    						}else if(value == 4){
    							return "<font color='#ffffff'>订单</font>";
    						}else{
    							return "<font color='#ffffff'>..</font>";
    						}
    					}
    				}},
    			]],
    			pagination:true,
    			//工具条件
    			toolbar:"#toolbar",
    			sortName:"id",
    			sortOrder:'desc',
    		});
    		
    		
    		//删除操作记录
    		$("#deleteBtn").click(function(){
    			//1.获取选择的记录条数
    			var rows = $("#list").datagrid("getSelections");
    			
    			if(rows.length==0){
    				$.messager.alert("提示","至少选择一个记录条数","warning");
    				return;
    			}
    			
    			//2.获取记录的id 格式： 字符串  1,2,3 
    			var ids = new Array();
    			$(rows).each(function(i){
    				ids.push(rows[i].id);
    			});
    			
    			ids = ids.join(",");
    			
    			//3.发送记录id到后台进行删除
    			$.post("${pageContext.request.contextPath }/manager/deleteoper.action",{"ids":ids},function(data){
    				if(data.success){
    					//刷新datagrid
    					$("#list").datagrid("reload");
    					//提示
    					$.messager.show({
							title:"提示",
							msg:"删除成功",
							timeout:1500
						});
    				}else{
    					$.messager.alert("提示","删除失败:"+data.msg,"error");
    				}
    			},"json");
    			
    		});
    	
    		$('#searchContext').searchbox({
    			searcher : function(value, name) {
    				alert(value + "," + name);
    				/* $("#list").datagrid("reload",{
    					url:"${pageContext.request.contextPath }/itemEdit.action?id=4"
    				}); */
    
    
    				var url= "${pageContext.request.contextPath }/manager/searchByOpera.action";
    				if(value != null && value !="".trim()){
    					url = url+"?operation="+value;
    					
    					if(name != "null" && name !=""){
    					url = url+"&operaRole="+name;
    					alert(url);
    				    }
    				}else{
    					
    					if(name != "null" && name !=""){
    					url = url+"?operaRole="+name;
    					alert(url);
    				    }
    				}
    				
    				
    				
    				$('#list').datagrid('options').url = url;
    				
    				$("#list").datagrid('load');  
    			},
    			menu : '#searchRadio',
    			prompt : '请输入值'
    		});
    
    		
    		
    		
    	});
    </script>
    
  </head>
  
  <body>
    <table id="list" style="height:400px;"></table>
    
        <!-- 工具条 -->
    <div id="toolbar">
    
        <input id="searchContext" style="width:200px;"/>
		<div id="searchRadio" style="width:100px">
			<div data-options="name:'null',iconCls:'icon-tip',selected:true">所有</div>
			<div data-options="name:'1',iconCls:'icon-no'">商家</div>
			<div data-options="name:'2',iconCls:'icon-ok'">用户</div>
			<div data-options="name:'4',iconCls:'icon-ok'">订单</div>
			<div data-options="name:'5',iconCls:'icon-ok'">评论</div>
			<div data-options="name:'6',iconCls:'icon-ok'">消息</div>
		</div>
		
        <a id="deleteBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:'true'">删除</a>
 	</div>
 	
  </body>
</html>
