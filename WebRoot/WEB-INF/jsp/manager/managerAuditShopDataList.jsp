<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户信息管理</title>
    
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/datagrid-detailview.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
	<link id="themeLink" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
	
  </head>
  
  <body>

	
	
	<table id="list" style="height:380px;"></table>
	
	<div id="detail" class="easyui-panel" title="定位"  
		 style="padding: 10px;  width: 100%; height: 400px; display: block;"  
            data-options="iconCls:'icon-more',closable:false,    
                collapsible:true,minimizable:false,maximizable:false,collapsed:true">   
	</div>

    <!-- 工具条 -->
    <div id="toolbar" style="padding:2px">
    	
		&nbsp;&nbsp;
	
		<a id="detailBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-more'" 
   		                  pageUrl="${pageContext.request.contextPath }/manager/position.action">定位</a>
    	<a id="editBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:'true'">审核</a>
    	
	</div>
    
    <!-- 编辑窗口 -->
    <div id="editWin" >
    	<form id="editForm" method="post">
    		<%-- 提供一个隐藏域 --%>
    		<input type="hidden" name="shopId" value="${shopData.shopId }"/>
    		<input type="hidden" name="id" value="${shopData.shopId }"/>
			 <table>
				<tr>
					<td>商店正面照</td>
					<td><img src="${pageContext.request.contextPath }/image/1.png" style="width:60px;height:50px;"></td>
					<%-- <td><input type="text" name="outPic"   value="${shopData.outPic }"/></td> --%>
				</tr> 
				<tr>
					<td>商店内部照</td>
					<td><img src="${pageContext.request.contextPath }/image/1.png" style="width:60px;height:50px;"></td>
					<%-- <td><input type="text" name="inPic"   value="${shopData.inPic }"/></td> --%>
				</tr>
				<tr>
					<td>商店营业执照</td>
					<td><img src="${pageContext.request.contextPath }/image/1.png" style="width:60px;height:50px;"></td>
					<%-- <td><input type="text" name="shopLicense"  value="${shopData.shopLicense }"/></td> --%>
				</tr>
				<tr>
					<td>法人身份证号码</td>
					<td><img src="${pageContext.request.contextPath }/image/1.png" style="width:60px;height:50px;"></td>
					<%-- <td><input type="text" name="ownerId"   value="${shopData.ownerId }"/></td> --%>
				</tr>
				<tr>
					<td>身份证正面照</td>
					<td><img src="${pageContext.request.contextPath }/image/1.png" style="width:60px;height:50px;"></td>
					<%-- <td><input type="text" name="ownerIdUpPic"   value="${shopData.ownerIdUpPic }"/></td> --%>
				</tr>
				<tr>
					<td>身份证背面面照</td>
					<td><img src="${pageContext.request.contextPath }/image/1.png" style="width:60px;height:50px;"></td>
					<%-- <td><input type="text" name="ownerIdDownPic"   value="${shopData.ownerIdDownPic }"/></td> --%>
				</tr>
				<tr>
					<td>餐饮服务许可证照片</td>
					<td><img src="${pageContext.request.contextPath }/image/1.png" style="width:80px;height:50px;"></td>
					<%-- <td><input type="text" name="serviceLicense"   value="${shopData.serviceLicense }"/></td> --%>
				</tr>
				<tr>
					<td>建议</td>
					<td><input type="text" name="advise"   value="${shopData.advise }"/></td>
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
    			height:350 ,
    			rownumbers:true ,
    			
				url:"${pageContext.request.contextPath }/manager/selectShopDataList.action?auditState=0",  
				//url:"${pageContext.request.contextPath }/itemEdit.action?id=4", 			
    			columns:[[
    				{field:"id",title:"资料id",width:50,hidden:true}, 
    				{field:"shopId",title:"商家id",width:50,hidden:true}, 
    				{field:"shopNumber",title:"商店编号",width:150},     
    				{field:"shopName",title:"商店名",width:180},
    				{field:"shopOwner",title:"商店法人",width:180},
    				{field:"address",title:"商店地址",width:180},
    				{field:"telephone",title:"商店手机",width:180},
    				{field:"longitude",title:"地址经度",width:140},
    				{field:"latitude",title:"地址纬度",width:140},
    				{field:"serviceScope",title:"商店服务范围",width:100},
    				{field:"auditState",title:"审核状态",width:130,formatter:function(value,row,index){
    					if(value != null){
    						return value=="0"?"<font color='red'>待审核</font>":"<font color='green'>审核通过</font>";
    					}
    				}}
    				
    			]],
    			
    			pagination:true,
    			//工具条件
    			toolbar:"#toolbar",
    			remoteSort:false,
    			
    		});  
    		
    	
    		$("#editWin").dialog({
			title:"审核窗口",
			width:600,
			height:500,
			closed:true,
			modal:true,
			//底部按钮栏
			buttons:[
						{
							iconCls:"icon-ok",
							text:"通过",
							handler:function(){
				$("#editForm").form("submit",{
					url:"${pageContext.request.contextPath }/manager/auditSuccess.action",
					
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
							iconCls:"icon-no",
							text:"不通过",
							handler:function(){
							$("#editForm").form("submit",{
					url:"${pageContext.request.contextPath }/manager/auditFail.action",
					
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
							
						}
			]
		});
    		
    		
    		
    	
    		//审核商店 -- 回显商店资料信息
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
    			$("#editForm").form("load","${pageContext.request.contextPath }/manager/shopDataEdit.action?id="+row.id);
    			
    			//4.弹出编辑窗口
    			$("#editWin").window("open");
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
    			$.post("${pageContext.request.contextPath }/manager/deleteUser.action",{"ids":ids},function(data){
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
     	
    	//查看该商家的详细地址 (按地址)
    	$("a[pageUrl]").click(function(){
    		
    		var rows = $("#list").datagrid("getSelections");
    			if(rows.length != 1){
    				$.messager.alert("提示","只能有一个","warning");
    				return;
    			}
    			
    			$("#detail").panel({
    			collapsed:false,
    		});
    		var longitude = rows[0].longitude;
    		var latitude = rows[0].latitude;
    		var serviceScope = rows[0].serviceScope;
    		var pageUrl = $(this).attr("pageUrl");
    		
    		var url =  pageUrl+"?longitude="+longitude+"&latitude="+latitude+"&serviceScope="+serviceScope;
    			alert(url);
   			$('#detail').panel({
   			   collapsed:false,
   			   
   				content:"<iframe src='"+url+"' width='100%' height='100%' frameborder='0'><iframe>",
   				
   				onLoad : function() {
   					alert('loaded successfully');
   				}
   			});
   		});
    	
    	
    	
    	
    	
    	 
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
    			 if( $("#userdetail").tabs("exists",title)  )  {
	    			//3.如果存在，则选项该选项卡
    				//$("#context").tabs("select",title);
    				$("#userdetail").tabs("close",title);
    				
    				$("#userdetail").tabs("add",{
    					title:title,
    					content:"<iframe src='"+url+"' width='100%' height='100%' frameborder='0'><iframe>",
    					closable:true
    				});	
    								
    			}else{
	    			//4.如果不存在，则添加选项卡
    				$("#userdetail").tabs("add",{
    					title:title,
    					content:"<iframe src='"+url+"' width='100%' height='100%' frameborder='0'><iframe>",
    					closable:true
    				});				
    			} 
    			
    			//$('#storerdetail').panel('refresh');
    			
    		});
     */
    
    		$('#searchContext').searchbox({
    			searcher : function(value, name) {
    				alert(value + "," + name);
    				/* $("#list").datagrid("reload",{
    					url:"${pageContext.request.contextPath }/itemEdit.action?id=4"
    				}); */
    
    
    				var url= "${pageContext.request.contextPath }/manager/searchUserByContext.action";
    				if(value != null && value !="".trim()){
    					url = url+"?username="+value;
    					
    					if(name != "null" && name !=""){
    					url = url+"&userstatus="+name;
    					alert(url);
    				    }
    				}else{
    					
    					if(name != "null" && name !=""){
    					url = url+"?userstatus="+name;
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
