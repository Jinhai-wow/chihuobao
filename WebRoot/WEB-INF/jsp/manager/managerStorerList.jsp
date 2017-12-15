<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>商家信息管理</title>
    
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/datagrid-detailview.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
	<link id="themeLink" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
	
	


  </head>
  
  <body>

	
	
	<table id="list" style="height:400px;"></table>
	 
	 <!--  data-options="iconCls:'icon-more',closable:false,    
                collapsible:true,minimizable:false,maximizable:false,fit:true,collapsed:true" -->
	 <!--  style="padding: 10px; background: rgb(250, 250, 250); width: 100%; height: 100px; display: block;" -->
	<div id="detail" class="easyui-panel" title="详细信息"  
		 style="padding: 10px; background: rgb(250, 250, 250); width: 100%; height: 100px; display: block;"  
            data-options="iconCls:'icon-more',closable:false,    
                collapsible:true,minimizable:false,maximizable:false,fit:true,collapsed:true">   
		    
		 <div id="storerdetail" class="easyui-tabs" style="width:100%;height:130px" data-options="plain:true,">
		    	
		    </div> 
		    
		    
	</div> 
	

	<div id="note" class="easyui-panel" title="消息接收"     
        style="width:100%;height:30px;padding:10px;background:#fafafa;"   
        data-options="iconCls:'icon-large-smartart',closable:false,    
                collapsible:true,minimizable:false,maximizable:false,fit:true,collapsed:true">   
		       
	</div>  
	

	
    <!-- 工具条 -->
    <div id="toolbar">
    	
		<input id="searchContext" style="width:200px;"/>
		<div id="searchRadio" style="width:100px">
			<div data-options="name:'null',iconCls:'icon-tip',selected:true">所有</div>
			<div data-options="name:'1',iconCls:'icon-no'">已冻结</div>
			<div data-options="name:'0',iconCls:'icon-ok'">未冻结</div>
		</div>
		
		&nbsp;&nbsp;&nbsp;
    	<!-- <a id="saveBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-'">冻结</a> -->
    	<a id="editBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:'true'">修改</a>
    	<a id="deleteBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:'true'">删除</a>
    	<a id="freezeBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-filter',plain:'true'">冻结</a>
    	<a id="releaseBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:'true'">解冻</a>
   		<a id="detailBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-more',plain:'true'" 
   		                  pageUrl="${pageContext.request.contextPath }/manager/storerdetail.action">查看详细</a>

		<a id="exportBtn" href="javascript:void(0)" class="easyui-linkbutton" style="float:right;" data-options="iconCls:'icon-save'">导出execl</a>
	</div>
    
    <!-- 编辑窗口 -->
    <div id="editWin" >
    	<form id="editForm" method="post">
    		<%-- 提供一个隐藏域 --%>
    		<input type="hidden" name="id" value="${storer.id }"/>
			 		<table>
				<tr>
					<td>商家名称</td>
					<td><input type="text" name="storerName" class="easyui-validatebox" data-options="required:true" value="${storer.storerName }"/></td>
				</tr> 
				<tr>
					<td>商家密码</td>
					<td><input type="text" name="password" class="easyui-numberbox" data-options="required:true" value="${storer.password }"/></td>
				</tr>
				
			</table>   
    	</form>
    </div>




	<script type="text/javascript">
		$(function() {
	
	
			$("#list").datagrid({
				title : '数据列表',
				fit : true,
				resizable : true,
				fitColumns : true, 
				striped : true, 
				height : 380,
				rownumbers : true,
				url : "${pageContext.request.contextPath }/manager/selectstorerlist.action",
				//url:"${pageContext.request.contextPath }/itemEdit.action?id=4", 			
				columns : [ [
					{
						field : "id",
						title : "商家编号",
						width : 200,
						hidden : true,
						sortable : true
					},
					{
						field : "storerNumber",
						title : "商家编号",
						width : 200
					},
					{
						field : "storerName",
						title : "商家名称",
						width : 160
					},
					{
						field : "telephone",
						title : "商家手机",
						width : 160
					},
					{
						field : "email",
						title : "商家邮箱",
						width : 200
					},
					{
						field : "storerMoney",
						title : "商家资金",
						width : 120
					},
					{
						field : "storerRegistTime",
						title : "商家注册时间",
						width : 200,
						sortable : true,
						formatter : function(value, row, index) {
							if (value != null) {
								da = new Date(value) ;
								var year = da.getFullYear();
								var month = da.getMonth();
								var date = da.getDate();
								var hours = da.getHours();
								var minutes = da.getMinutes();
								var seconds = da.getSeconds();
								return year + "-" + month + "-" + date + "-" + hours + "-" + minutes + "-" + seconds;
							}
						}
					},
					{
						field : "accountState",
						title : "商家状态",
						width : 120,
						formatter : function(value, row, index) {
							if (value != null) {
								return value == "1" ? "<font color='red'>冻结</font>" : "<font color='green'>正常</font>";
							}
						}
					},
				] ],
	
				pagination : true,
				pageSize : 20,
				//工具条件
				toolbar : "#toolbar",
				remoteSort : true,
	
				view : detailview,
				detailFormatter : function(rowIndex, rowData) {
					return '<table><tr>' +
						'<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath }/image/1.png" style="height:50px;"></td>' +
						'<td style="border:0">' +
						'<p>Attribute: 666</p>' +
						'<p>Status: 666</p>' +
						'</td>' +
						'</tr></table>';
				}
			});
	
	
			$("#editWin").dialog({
				title : "编辑窗口",
				width : 400,
				height : 200,
				closed : true,
				modal : true,
				//底部按钮栏
				buttons : [
					{
						iconCls : "icon-save",
						text : "保存",
						handler : function() {
							$("#editForm").form("submit", {
								url : "${pageContext.request.contextPath }/manager/updatestorer.action",
								onSubmit : function() {
									//表单验证
									return $("#editForm").form("validate");
								},
	
								success : function(data) {
									data = eval("(" + data + ")");
									if (data.success) {
	
	
										//1.表单清空
										$("#editForm").form("clear");
										//2.关闭窗口
										$("#editWin").window("close");
										//3.刷新datagrid
	
										$("#list").datagrid("reload");
										$.messager.show({
											title : "提示",
											msg : "操作成功",
											timeout : 1000,
											showType : 'show',
										});
										//window.location.reload();
	
									} else {
										$.messager.alert("提示", "保存失败:" + data.msg, "error");
									}
								}
							});
	
						}
					},
					{
						iconCls : "icon-edit",
						text : "重置",
					}
				]
			});
	
	
	
			//点击添加按钮，弹出编辑窗口
			$("#saveBtn").click(function() {
				//打开窗口
				$("#editWin").window("open");
			});
	
			//导出execl
			$("#exportBtn").click(function() {

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
				form.attr('action', '${pageContext.request.contextPath }/manager/storerExport.action');
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
	
	
			//修改商品 -- 回显商品信息
			$("#editBtn").click(function() {
	
				//1.获取选择的商品
				var rows = $("#list").datagrid("getSelections");
	
				//判断一次只能选择一个
				if (rows.length != 1) {
					$.messager.alert("提示", "一次只能选择一行", "warning");
					return;
				}
	
				//2.获取第一行
				var row = rows[0];
	
	
				//3.到后台商品数据，填充到表单
				$("#editForm").form("load", "${pageContext.request.contextPath }/manager/itemEdit.action?id=" + row.id);
	
				//4.弹出编辑窗口
				$("#editWin").window("open");
			});
	
			//删除商家
			$("#deleteBtn").click(function() {
				//1.获取选择的商品
				var rows = $("#list").datagrid("getSelections");
	
				if (rows.length == 0) {
					$.messager.alert("提示", "至少选择一个商品", "warning");
					return;
				}
	
				//2.获取商品的id 格式： 字符串  1,2,3 
				var ids = new Array();
				$(rows).each(function(i) {
					ids.push(rows[i].id);
				});
	
				ids = ids.join(",");
	
				//3.发送商品id到后台进行删除
				$.post("${pageContext.request.contextPath }/manager/deletestorer.action", {
					"ids" : ids
				}, function(data) {
					if (data.success) {
						//刷新datagrid
						$("#list").datagrid("reload");
						
						//提示
						$.messager.show({
							title : "提示",
							msg : "删除成功",
							timeout : 1500
						});
					} else {
						$.messager.alert("提示", "删除失败:" + data.msg, "error");
					}
				}, "json");
	
			});
	
	
	
			//冻结操作
			$("#freezeBtn").click(function() {
				//1.获取选择的商品
	
				var rows = $("#list").datagrid("getSelections");
				if (rows.length != 1) {
					$.messager.alert("提示", "只能选择一个", "warning");
					return;
				}
	
				if (rows[0].accountState == 1) {
					$.messager.alert("提示", "该账户已冻结", "warning");
					return;
				}
	
				//2.获取商品的id 格式： 字符串  1,2,3 
				var id = rows[0].id;
				$.post("${pageContext.request.contextPath }/manager/freezeshoper.action", {
					"id" : id
				}, function(data) {
					if (data.success) {
						//刷新datagrid
						$("#list").datagrid("reload");
						//提示
						$.messager.show({
							title : "提示",
							msg : "冻结成功",
							timeout : 1500
						});
					} else {
						$.messager.alert("提示", "删除失败:" + data.msg, "error");
					}
				}, "json");
	
	
			});
	
	
			//解除冻结操作
			$("#releaseBtn").click(function() {
				//1.获取选择的商品
	
				var rows = $("#list").datagrid("getSelections");
				if (rows.length != 1) {
					$.messager.alert("提示", "只能选择一个", "warning");
					return;
				}
	
				if (rows[0].accountState == 0) {
					$.messager.alert("提示", "该账户已是解除状态", "warning");
					return;
				}
	
				//2.获取商品的id 格式： 字符串  1,2,3 
				var id = rows[0].id;
				$.post("${pageContext.request.contextPath }/manager/releaseshoper.action", {
					"id" : id
				}, function(data) {
					if (data.success) {
						//刷新datagrid
						$("#list").datagrid("reload");
						//提示
						$.messager.show({
							title : "提示",
							msg : "解除成功",
							timeout : 1500
						});
					} else {
						$.messager.alert("提示", "解除失败:" + data.msg, "error");
					}
				}, "json");
	
	
			});
	
	
			//查看商家详细信息 
	
			$("a[pageUrl]").click(function() {
	
				var rows = $("#list").datagrid("getSelections");
				if (rows.length != 1) {
					$.messager.alert("提示", "只能有一个", "warning");
					return;
				}
	
				$("#detail").panel({
					collapsed : false,
				});
	
				var id = rows[0].id;
				//1.获取pageUrl属性值（需要跳转的页面地址）
				var pageUrl = $(this).attr("pageUrl");
				//alert(pageUrl);
				var url = pageUrl + "?id=" + id;
				//获取a标签的内容，标题
				var title = $(this).text();
				//2.判断是否存在指定标题的选项卡
				if ($("#storerdetail").tabs("exists", title)) {
					//3.如果存在，则选项该选项卡
					//$("#context").tabs("select",title);
					$("#storerdetail").tabs("close", title);
	
					$("#storerdetail").tabs("add", {
						title : title,
						content : "<iframe src='" + url + "' width='100%' height='100%' frameborder='0'><iframe>",
						closable : true
					});
	
				} else {
					//4.如果不存在，则添加选项卡
					$("#storerdetail").tabs("add", {
						title : title,
						content : "<iframe src='" + url + "' width='100%' height='100%' frameborder='0'><iframe>",
						closable : true
					});
				}
	
				//$('#storerdetail').panel('refresh');
	
			});
	
	
			$('#searchContext').searchbox({
				searcher : function(value, name) {
					var url = "${pageContext.request.contextPath }/manager/searchByContext.action";
					if (value != null && value != "".trim()) {
						url = url + "?storerName=" + value;
	
						if (name != "null" && name != "") {
							url = url + "&accountState=" + name;
						}
					} else {
	
						if (name != "null" && name != "") {
							url = url + "?accountState=" + name;
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
