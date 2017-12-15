<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>商品信息管理</title>
    
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
	<link id="themeLink" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
	
	


  </head>
  
  <body>

	<table id="list" style="height:400px;"></table>
	 
    <!-- 工具条 -->
    <div id="toolbar" style="padding:2px">
    	
		
		
		&nbsp;&nbsp;&nbsp;
    	<a id="saveBtn" href="#javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:'true'">新增</a> 
    	<a id="editBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:'true'">修改</a>
    	<a id="deleteBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:'true'">删除</a>
    	
	</div>
    
    <!--新增窗口 -->
    <div id="addWin" >
    	<form id="addForm" method="post">
    		<%-- 提供一个隐藏域 --%>
    		<%-- <input type="hidden" name="id" value="${shopStyle.id }"/> --%>
			 		<table>
				<tr>
					<td>商家类型</td>
					<td><input type="text" name="styleName" class="easyui-validatebox" data-options="required:true" value="${shopStyle.styleName }"/></td>
				</tr> 
				<tr>
					<td>描述</td>
					<td><input type="text" name="styleDesc" class="easyui-validatebox" data-options="required:true" value="${shopStyle.styleDesc }"/></td>
				</tr> 
				
			</table>   
    	</form>
    </div>
    
    <!--编辑窗口 -->
    <div id="editWin" >
    	<form id="editForm" method="post">
    		<%-- 提供一个隐藏域 --%>
    		<input type="hidden" name="id" value="${shopStyle.id }"/> 
			 		<table>
				<tr>
					<td>商家类型</td>
					<td><input type="text" name="styleName" class="easyui-validatebox" data-options="required:true" value="${shopStyle.styleName }"/></td>
				</tr> 
				<tr>
					<td>描述</td>
					<td><input type="text" name="styleDesc" class="easyui-validatebox" data-options="required:true" value="${shopStyle.styleDesc }"/></td>
				</tr> 
				
			</table>   
    	</form>
    </div>
    
    
    <script type="text/javascript">
    	$(function() {
    
    		
    		$("#list").datagrid({
				
				title:'数据列表',
				resizable:true,
				fitColumns:true , 
				striped: true ,	
    			height:400 ,
    			rownumbers:true ,
    			nowrap:true,
				
				url:"${pageContext.request.contextPath }/manager/shopStyleList.action",  
				//url:"${pageContext.request.contextPath }/itemEdit.action?id=4", 			
    			columns:[[
    				{field:"id",title:"商家类型编号",width:100,hidden:true},     
    				{field:"styleName",title:"商家类型名称",width:200},
    				{field:"styleDesc",title:"描述",width:200},
    				
    			]],
    			
    			pagination:true,
    			rownumbers:true ,
    			//工具条件
    			toolbar:"#toolbar",
    			sortName:"id",
    			sortOrder:'desc',
    		});
    		
    		
    		
    		//新增的窗口
    		$("#addWin").dialog({
			title:"新增窗口",
			width:400,
			height:200,
			closed:true,
			modal:true,
			//底部按钮栏
			buttons:[
						{
							iconCls:"icon-save",
							text:"保存",
							handler:function(){
				$("#addForm").form("submit",{
					url:"${pageContext.request.contextPath }/manager/saveShopStyle.action",
					onSubmit:function(){
						//表单验证
						return $("#addForm").form("validate");
					},
					
					success:function(data){
						data = eval("("+data+")");
						if(data.success){
						
						
							//1.表单清空
							$("#addForm").form("clear");
							//2.关闭窗口
							$("#addWin").window("close");
							//3.刷新datagrid
							
							$("#list").datagrid("reload");
							$.messager.show({
								title:"提示",
								msg:"操作成功",
								timeout:1000,
								showType:'show',
    									});
							//window.location.reload();
							
						}else{
							$.messager.alert("提示","保存失败:"+data.msg,"error");
						}
					}
    			});
    			
							}
						},
						{
							iconCls:"icon-edit",
							text:"重置",
							handler:function(){
								//1.表单清空
							$("#addForm").form("clear");
							}
							
						}
			]
		});
    		
    		
    		
    		//点击添加按钮，弹出编辑窗口
    		$("#saveBtn").click(function(){
    			//打开窗口
    			$("#addWin").window("open");
    		});
    		
    		//保存商品
    		$("#save").click(function(){
    			
    			$("#addForm").form("submit",{
					url:"product_save.action",
					onSubmit:function(){
						//表单验证
						return $("#editForm").form("validate");
					},
					success:function(data){
						data = eval("("+data+")");
						if(data.success){
							//1.表单清空
							$("#editForm").form("clear");
							//2.关闭窗口
							$("#editWin").window("close");
							//3.刷新datagrid
							$("#list").datagrid("reload");
							
							$.messager.show({
								title:"提示",
								msg:"保存成功"
							});
						}else{
							$.messager.alert("提示","保存失败:"+data.msg,"error");
						}
					}
    			});
    			
    			
    		});
    		
    		
    		
    		//修改商品 -- 回显商品信息
    		$("#editBtn").click(function(){
    			
    			//1.获取选择的商品
    			var rows = $("#list").datagrid("getSelections");
    			
    			//判断一次只能选择一个
    			if(rows.length!=1){
    				$.messager.alert("提示","一次只能选择一行","warning");
    				return;
    			}
    			
    			//2.获取第一行
    			var row = rows[0];
    			
    			
    			//3.到后台商品数据，填充到表单
    			$("#editForm").form("load","${pageContext.request.contextPath }/manager/shopStyleEdit.action?id="+row.id);
    			
    			//4.弹出编辑窗口
    			$("#editWin").window("open");
    		});
    		
    		
    		//修改的编辑窗口
    		$("#editWin").dialog({
			title:"编辑窗口",
			width:400,
			height:200,
			closed:true,
			modal:true,
			//底部按钮栏
			buttons:[
						{
							iconCls:"icon-save",
							text:"保存",
							handler:function(){
				$("#editForm").form("submit",{
					url:"${pageContext.request.contextPath }/manager/updateShopStyle.action",
					onSubmit:function(){
						//表单验证
						return $("#editForm").form("validate");
					},
					
					success:function(data){
						data = eval("("+data+")");
						if(data.success){
						
						
							//1.表单清空
							$("#editForm").form("clear");
							//2.关闭窗口
							$("#editWin").window("close");
							//3.刷新datagrid
							
							$("#list").datagrid("reload");
							$.messager.show({
								title:"提示",
								msg:"操作成功",
								timeout:1000,
								showType:'show',
    									});
							//window.location.reload();
							
						}else{
							$.messager.alert("提示","保存失败:"+data.msg,"error");
						}
					}
    			});
    			
							}
						},
						{
							iconCls:"icon-edit",
							text:"重置",
							handler:function(){
								//1.表单清空
							$("#editForm").form("clear");
							}
							
						}
			]
		});
    		
    		
    		
    		//删除商品
    		$("#deleteBtn").click(function(){
    			//1.获取选择的商品
    			var rows = $("#list").datagrid("getSelections");
    			
    			if(rows.length==0){
    				$.messager.alert("提示","至少选择一个商品","warning");
    				return;
    			}
    			
    			//2.获取商品的id 格式： 字符串  1,2,3 
    			var ids = new Array();
    			$(rows).each(function(i){
    				ids.push(rows[i].id);
    			});
    			
    			ids = ids.join(",");
    			
    			//3.发送商品id到后台进行删除
    			$.post("${pageContext.request.contextPath }/manager/deleteShopStyle.action",{"ids":ids},function(data){
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
    	
    	
    	
    	//冻结操作
    	$("#freezeBtn").click(function(){
    			//1.获取选择的商品
    			
    			var rows = $("#list").datagrid("getSelections");
    			if(rows.length != 1){
    				$.messager.alert("提示","只能选择一个","warning");
    				return;
    			}
    			
    			if(rows[0].accountState == 1){
    				$.messager.alert("提示","该账户已冻结","warning");
    				return;
    			}
    			
    			//2.获取商品的id 格式： 字符串  1,2,3 
    			var id = rows[0].id;
    			 $.post("${pageContext.request.contextPath }/manager/freezeshoper.action",{"id":id},function(data){
    				if(data.success){
    					//刷新datagrid
    					$("#list").datagrid("reload");
    					//提示
    					$.messager.show({
							title:"提示",
							msg:"冻结成功",
							timeout:1500
						});
    				}else{
    					$.messager.alert("提示","删除失败:"+data.msg,"error");
    				}
    			},"json");
    			
    		
    	});
    	
    	
    	//解除冻结操作
    	$("#releaseBtn").click(function(){
    			//1.获取选择的商品
    			
    			var rows = $("#list").datagrid("getSelections");
    			if(rows.length != 1){
    				$.messager.alert("提示","只能选择一个","warning");
    				return;
    			}
    			
    			if(rows[0].accountState == 0){
    				$.messager.alert("提示","该账户已是解除状态","warning");
    				return;
    			}
    			
    			//2.获取商品的id 格式： 字符串  1,2,3 
    			var id = rows[0].id;
    			 $.post("${pageContext.request.contextPath }/manager/releaseshoper.action",{"id":id},function(data){
    				if(data.success){
    					//刷新datagrid
    					$("#list").datagrid("reload");
    					//提示
    					$.messager.show({
							title:"提示",
							msg:"解除成功",
							timeout:1500
						});
    				}else{
    					$.messager.alert("提示","解除失败:"+data.msg,"error");
    				}
    			},"json");
    			
    		
    	});
    	
    	
    	//查看商家详细信息 
    	 
    	$("a[pageUrl]").click(function(){
    	
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
    
    
    		$('#searchContext').searchbox({
    			searcher : function(value, name) {
    				alert(value + "," + name);
    				/* $("#list").datagrid("reload",{
    					url:"${pageContext.request.contextPath }/itemEdit.action?id=4"
    				}); */
    
    
    				var url= "${pageContext.request.contextPath }/manager/searchByContext.action";
    				if(value != null && value !="".trim()){
    					url = url+"?storerName="+value;
    					
    					if(name != "null" && name !=""){
    					url = url+"&accountState="+name;
    					alert(url);
    				    }
    				}else{
    					
    					if(name != "null" && name !=""){
    					url = url+"?accountState="+name;
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
  </body>
</html>
