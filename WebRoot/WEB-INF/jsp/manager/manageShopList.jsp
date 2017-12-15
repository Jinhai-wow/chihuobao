<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>商品管理</title>
    
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/datagrid-detailview.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
	<link id="themeLink" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
	
	


  </head>
  
  <body>

	
	
	<table id="list" style="height:350px;"></table>
	 
	
    <!-- 工具条 -->
    <div id="toolbar">
    	
		<input id="searchContext" style="width:200px;"/>
		<div id="searchRadio" style="width:100px" >
			 <div data-options="name:'null',iconCls:'icon-tip',selected:true">所有</div>
			
		</div>
		
		&nbsp;&nbsp;&nbsp;
    	<a id="deleteBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:'true'">删除</a>
   		<a id="detailBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-more',plain:'true'" 
   		                  pageUrl="${pageContext.request.contextPath }/manager/ShopGoodsDetail.action">查看店下商品</a>

	<a id="exportBtn" href="javascript:void(0)" class="easyui-linkbutton" style="float:right;" data-options="iconCls:'icon-save'">导出execl</a>
	</div>
    

    <div id="detail" class="easyui-panel" title="详细信息"  
		 style="padding: 10px; background: rgb(250, 250, 250); width: 100%; height: 100px; display: block;"  
            data-options="iconCls:'icon-more',closable:false,    
                collapsible:true,minimizable:false,maximizable:false,fit:true,collapsed:true">   
		    
		 <div id="Goodsdetail" class="easyui-tabs" style="width:100%;height:130px" data-options="plain:true,">
		    	
		    </div> 
    
    
    
    
    <script type="text/javascript">
    	$(function() {
    
    
    
    
    		$("#list").datagrid({
				url:"${pageContext.request.contextPath }/manager/selectShoplist.action",  
    			title:'数据列表',
				resizable:true,
				fitColumns:true , 
				striped: true ,	
    			height:400 ,
    			rownumbers:true ,
    			
    			columns:[[
    				 {field:"id",title:"id",width:100,hidden:true}, 
    				 {field:"shopNumber",title:"商店编号",width:200},
    				{field:"shopName",title:"商店名称",width:120},
    				{field:"storerName",title:"商家名称",width:120,formatter: function(value,row,index){
                          if (row.storerAccount){
                        return row.storerAccount.storerName;
                     }}},    
    				{field:"styleName",title:"商店类型",width:150,formatter:function(value,row,index){
    						if(row.shopStyle){
    						return row.shopStyle.styleName;
    						}
    				}},
    				{field:"shopOwner",title:"商店法人",width:120},
    				{field:"address",title:"商店地址",width:180},
    				{field:"telephone",title:"商店手机",width:100},
    				{field:"businessTime",title:"营业时间",width:150},
    				{field:"shopScore",title:"评分",width:80},
    				{field:"openState",title:"状态",width:80},
    				/* {field:"id",title:"id",width:100,}, 
    				 {field:"goodName",title:"商品名",width:100},
    				{field:"styleName",title:"商品类型",width:100}, 
                     
                     {field:"shopName",title:"商店名",width:100},
    				 */
    			]],
    			pagination:true,
    			//工具条件
    			toolbar:"#toolbar",
    			view: detailview,
				detailFormatter: function(rowIndex, rowData){
					return '<table><tr>' +
							'<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath }/image/1.png" style="height:50px;"></td>' +
							'<td style="border:0">' +
							'<p>Attribute: 666</p>' +
							'<p>Status: 666</p>' +
							'</td>' +
							'</tr></table>';
				}
    		});
    		
    		
    		//删除商品
    		$("#deleteBtn").click(function(){
    			//1.获取选择的商品
    			var rows = $("#list").datagrid("getSelections");
    			
    			if(rows.length==0){
    				$.messager.alert("提示","至少选择一个商店","warning");
    				return;
    			}
    			
    			//2.获取商品的id 格式： 字符串  1,2,3 
    			var ids = new Array();
    			$(rows).each(function(i){
    				ids.push(rows[i].id);
    			});
    			
    			ids = ids.join(",");
    			
    			//3.发送商品id到后台进行删除
    			$.post("${pageContext.request.contextPath }/manager/deleteShop.action",{"ids":ids},function(data){
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
    	
    	//查看详情
    		$("a[pageUrl]").click(function(){
    	
    			var rows = $("#list").datagrid("getSelections");
    			if(rows.length != 1){
    				$.messager.alert("提示","只能有一个","warning");
    				return;
    			}
    			
    			$("#detail").panel({
    			collapsed:false,
    		});
    			
    			alert(6666);
    			var id = rows[0].id;
    			
    			
    			alert(id);
    			
    			//1.获取pageUrl属性值（需要跳转的页面地址）
    			var pageUrl = $(this).attr("pageUrl");
    		
    			var url =  pageUrl+"?id="+id;
    			alert(url);
    			//获取a标签的内容，标题
    			var title = $(this).text();
    			
    			//2.判断是否存在指定标题的选项卡
    			 if( $("#Goodsdetail").tabs("exists",title)  )  {
	    			//3.如果存在，则选项该选项卡
    				//$("#context").tabs("select",title);
    				$("#Goodsdetail").tabs("close",title);
    				
    				$("#Goodsdetail").tabs("add",{
    					title:title,
    					content:"<iframe src='"+url+"' width='100%' height='100%' frameborder='0'><iframe>",
    					closable:true
    				});	
    								
    			}else{
	    			//4.如果不存在，则添加选项卡
    				$("#Goodsdetail").tabs("add",{
    					title:title,
    					content:"<iframe src='"+url+"' width='100%' height='100%' frameborder='0'><iframe>",
    					closable:true
    				});				
    			} 
    		});
    		
    		
    
    
    		$('#searchContext').searchbox({
    			searcher : function(value, name) {
    				alert(value + "," + name);
    				/* $("#list").datagrid("reload",{
    					url:"${pageContext.request.contextPath }/itemEdit.action?id=4"
    				}); */
    
    
    				var url= "${pageContext.request.contextPath }/manager/searchShopByContext.action";
    				if(value != null && value !="".trim()){
    					url = url+"?shopName="+value;
    					
    					if(name != "null" && name !=""){
    					url = url+"&shopStyleId="+name;
    					alert(url);
    				    }
    				}else{
    					
    					if(name != "null" && name !=""){
    					url = url+"?shopStyleId="+name;
    					alert(url);
    				    }
    				}
    				
    				$('#list').datagrid('options').url = url;
    				
    				$("#list").datagrid('load');  
    			},
    			
    			menu : '#searchRadio',
    			prompt : '请输入值'
    		});
    		
    		
    		
    		$.ajax({
    			type:"post",
    			url : "${pageContext.request.contextPath }/manager/shopStyle.action",
    			datatype : "json", //回调
    			success : function(data) {
    
    				var array =  data.goodsStyle;
    					
        			$(array).each(function(i){
    					
        
    					 $('#searchRadio').menu('appendItem', {
    						text : array[i].styleName,
    						name : array[i].id,
    						iconCls : 'icon-ok',
    						/* onclick : function() {
    							alert('新增');
    						}, */
    					});
    					}); 
    				}
    		}); 
    		
    		
    		
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
    			form.attr('action', '${pageContext.request.contextPath }/manager/shopExport.action');
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
