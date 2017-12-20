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
	<script type="text/javascript">
	$(function() {
	
	
	
	
			$('#tb').textbox({
				label: '通知发送:',
			    labelPosition: 'top',
				buttonText:'Search',
				iconCls : 'icon-edit',
				iconAlign : 'left',
				multiline:'true',
				height:'100',
				onClickButton:function(){
					var text = $('#tb').textbox('getText');
				if(style == null && text == null){
					alert("选择类型和内容不能为空");
				}else{
					$.post("${pageContext.request.contextPath }/sendMessageToObject.action", {"style" : style,"obj":obj,"text":text}, function(data) {
					
				});
				
				}
					$('#tb').textbox('setText','');
					alert(style+"-"+obj+"-"+text);
					
				}
			});
	
	var style = "";
	var obj = "";
			$('#cc1').combobox({
				    
        onSelect: function(rec){    
        
            hidePanel:'true';
             var url = '${pageContext.request.contextPath }/selectUserOrStorer.action?typeid='+rec.typeid;    
            $('#cc2').combobox('reload', url);    

             style = rec.typeid;
            
            
        }
			});
	
	
	$('#cc2').combobox({
	
		label: '名称:',
		labelPosition: 'top',
				    
        onSelect: function(rec){    
        
            hidePanel:'true';
             obj = rec.id;
        }
			});
	
	
	
	
		});
	
	</script>


  </head>
  
  <body>
	<script type="text/plain" id="editor"></script>

	<input id="cc1" class="easyui-combobox" style="width:150px;"   
		data-options=" 
		label: '类型:',
		labelPosition: 'top',
		 panelHeight:'50',
		limitToList:true,  
        valueField: 'typeid',    
        textField: 'name',
         
        data:[{    
    'typeid':1,    
    'name':'用户'   
},{    
     'typeid':2,    
    'name':'商家'
}]," />
	<input id="cc2" class="easyui-combobox" style="width:150px;"
		data-options="panelHeight:'150',valueField:'id',textField:'name'" />
	<div>
		<!-- <textarea id="editor" name="DIVCSS5" cols="30" rows="4">
		网页制作教程www.DIVCSS5.com
	    </textarea> -->
	    <input id="tb" type="textarea" cols="30" rows="4" style="width:300px;">
	</div>
	
	
	
</body>
</html>
