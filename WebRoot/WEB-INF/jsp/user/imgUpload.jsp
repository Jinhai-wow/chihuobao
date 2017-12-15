<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

		<title>上传图片</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" type="text/css" href="css/demos.css">
		<link rel="stylesheet" type="text/css" href="css/main.css">
		<link rel="stylesheet" type="text/css" href="css/jquery.Jcrop.css">
		<script type="text/javascript" language="javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" language="javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript" language="javascript" src="js/jquery.Jcrop.js"></script>
		<script type="text/javascript" language="javascript" src="js/imgUpload.js"></script>
		<script type="text/javascript">   
       
        /**检查图片上传类型*/          
 /*         function checkImgType(obj){   
            
          var imgFile = '';    
          //获取图片的全路径   
          var imgFilePath = getImgFullPath(obj);        
          var endIndex = imgFilePath.lastIndexOf("\\");   
          var lastIndex = imgFilePath.length-endIndex-1;   
          if (endIndex != -1)   
             imgFile= imgFilePath.substr(endIndex+1,lastIndex);   
          else  
             imgFile = imgFilePath;        
               
          var tag = true;               
          endIndex = imgFilePath.lastIndexOf(".");              
          if (endIndex == -1)    
            tag = false;   
               
          var ImgName = imgFilePath.substr(endIndex+1,lastIndex);   
          ImgName = ImgName.toUpperCase();           
            
          if (ImgName !="GIF" && ImgName !="JPG" && ImgName !="PNG" && ImgName !="BMP"){    
              tag=false;   
          }   
          if (!tag) {   
              alert("上传图片的文件类型必须为: *.gif,*.jpg,*.png,*.bmp,请重新选择!")   
              Upload.clear(obj);                        
              return false;   
          }      
          document.form1.submit();   
      }  */  
           
        function getImgFullPath(obj) {   
            if (obj) {     
               //ie     
               if (window.navigator.userAgent.indexOf("MSIE") >= 1) {     
                   obj.select();     
                   return document.selection.createRange().text;     
               }     
               //firefox     
               else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {     
                   if (obj.files) {     
                       return obj.files.item(0).getAsDataURL();     
                   }     
                   return obj.value;     
               }            
               return obj.value;      
           }     
        }
        /**/ 
    </script>
<link rel="stylesheet" href="css/main.css" type="text/css" />
<link rel="stylesheet" href="css/demos.css" type="text/css" />
<link rel="stylesheet" href="css/jquery.Jcrop.css" type="text/css" />
<style type="text/css">

/* Apply these styles only when #preview-pane has
   been placed within the Jcrop widget 
   仅在#preview-pane被放置在Jcrop小部件中时才应用这些样式*/

.jcrop-holder #preview-pane {
  display: block;
  position: absolute;
  z-index: 2000;
  top: 10px;
  right: -280px;
  padding: 6px;
  border: 1px rgba(0,0,0,.4) solid;
  background-color: white;

  -webkit-border-radius: 6px;
  -moz-border-radius: 6px;
  border-radius: 6px;

  -webkit-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
  -moz-box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
  box-shadow: 1px 1px 5px 2px rgba(0, 0, 0, 0.2);
}

/* The Javascript code will set the aspect ratio of the crop
   area based on the size of the thumbnail preview,
   specified here 
   Javascript代码将根据这里指定的缩略图预览的大小来设置作物区域的宽比。*/
#preview-pane .preview-container {
  width: 150px;
  height: 150px;
  overflow: hidden;
}

</style>
	</head>
	<body>
		<form name="form1" id="form1"  enctype="multipart/form-data">
			<div style="margin-left: 20%; margin-top: 4%">
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td>
							&nbsp;图片上传
							<font color='red'>(不支持汉语命名)*.gif,*.jpg,*.png,*.bmp</font>
						</td>
					</tr>
					<tr>
						<td width="80%">
							<input type="file" name="userImg" id="userImg" maxlength="160"
							 width="300px" /> <!-- onchange="checkImgType(this)" -->
							&nbsp;
						</td>
					</tr>
				</table>
			</div>
		</form>
		<div class="container">
<div class="row">
<div class="jc-demo-box">


  <img  src="upload/30b19e4b-74b9-4e4f-9624-b5e84e74d726.jpg" id="target" alt="[Jcrop Example]" />>
  <div id="preview-pane">
    <div class="preview-container">
      <img id="img-target" src="upload/30b19e4b-74b9-4e4f-9624-b5e84e74d726.jpg"  class="jcrop-preview" alt="Preview" />
    </div>
  </div>
		<form name="form2" action="${pageContext.request.contextPath }/user/imgCut.action" method="post">
			<input type="hidden" id="x" name="x" />
			<input type="hidden" id="y" name="y" />
			<input type="hidden" id="w" name="w" />
			<input type="hidden" id="h" name="h" />
			<input type="hidden" id="oldImgPath" name="oldImgPath" />
			<input type="submit" value="保存"  id="cropButton" />
		</form>
</div>
</div>
</div>
	</body>
</html>
