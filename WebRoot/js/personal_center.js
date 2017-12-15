$(document).ready(function(){
	
	/**
	 * 
	 * 
	 * 我的资料-个人资料
	 */
	$("#personal-data")[0].addEventListener('click', function(){
		$(".messagn-panel")[0].innerHTML='<div class="profile"><div class="profileinfo"><h3 ng-if="pageTitleVisible" class="profile-paneltitle ng-scope"><span ng-bind="pageTitle" class="ng-binding">个人资料</span> <span class="subtitle ng-binding" ng-bind-html="pageSubtitle | toTrusted"></span></h3>'
			+'<div class="container head-portrait"><div class="row clearfix"><div class="col-md-1 column"><div class="profileinfo-label">头像</div></div><div class="col-md-2 column"><div id="user-img-block"><img id="profile-img" src="" alt="2290f218cab"><a class="profileinfo-facedit" href="javascript:;">编辑头像</a></div></div></div></div>'
			+'<div class="container message-item"><div class="row clearfix"><div class="col-md-1 column"><div class="profileinfo-label">用户名</div></div><div class="col-md-2 column"><div id="profile-username" class="profileinfo-value nf-binding"></div></div><div class="col-md-1 column">'
			+'<div class="col-md-12 column"><a id="modal-554954" href="#modal-container-554954" role="button" class="btn" data-toggle="modal">[修改]</a><div class="modal fade" id="modal-container-554954" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h4 class="modal-title" id="myModalLabel">修改用户名</h4></div>'
			+'<div class="modal-body"><input id="modal-username" type="text" class="form-control" name=""></div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">取消</button> <button id="update-username" type="button" class="btn btn-primary" data-dismiss="modal">确定</button></div></div></div></div></div></div></div></div>'
			+'<div class="container message-item"><div class="row clearfix"><div class="col-md-1 column"><div class="profileinfo-label">手机号码</div></div><div class="col-md-2 column"><div id="profile-phone" class="profileinfo-value nf-binding"></div></div><div class="col-md-1 column"><a href="javascript:;">[修改]</a></div></div></div>'
			+'<div class="container message-item"><div class="row clearfix"><div class="col-md-1 column"><div class="profileinfo-label">我的邮箱</div></div><div class="col-md-2 column"><div id="profile-email" class="profileinfo-value nf-binding">未绑定</div></div><div class="col-md-1 column"><a class="unbind" href="javascript:;">[立即绑定]</a></div></div></div></div></div>';
		$(".setfontcolor").removeClass("fontlink-color");
		$("#personal-data").addClass("fontlink-color"); 
		//加载数据库中存到的头像图片
		//图片编辑框
		$("#user-img-block").mouseover(function(){
			$(".profileinfo-facedit").css("display", "block");
		});
		$("#user-img-block").mouseout(function(){
			$(".profileinfo-facedit").css("display", "none");
		});
		$(".profileinfo-facedit")[0].addEventListener('click',function(){
			$(".messagn-panel")[0].innerHTML='<form name="form1" id="form1"  enctype="multipart/form-data"><div style="margin-left: 1%; margin-top: 2%"><table width="100%" border="0" align="center" cellpadding="0"cellspacing="0">'
			+'<tr><td>&nbsp;图片上传<font color="red">(不支持汉语命名)*.gif,*.jpg,*.png,*.bmp</font></td></tr><tr><td width="80%"><input type="file" name="userImg" id="userImg" maxlength="160"width="300px" /> &nbsp;</td></tr></table></div></form>'
			+'<div class="container1"><div class="row"><div class="jc-demo-box"><img  src="upload/30b19e4b-74b9-4e4f-9624-b5e84e74d726.jpg" id="target" alt="[Jcrop Example]" />><div id="preview-pane"><div class="preview-container"><img id="img-target" src="upload/30b19e4b-74b9-4e4f-9624-b5e84e74d726.jpg"  class="jcrop-preview" alt="Preview" /></div></div>'
			+'<form name="form2" action="user/imgCut.action" method="post"><input type="hidden" id="x" name="x" /><input type="hidden" id="y" name="y" /><input type="hidden" id="w" name="w" /><input type="hidden" id="h" name="h" /><input type="hidden" id="oldImgPath" name="oldImgPath" /><input type="submit" value="保存"  id="cropButton" /></form></div></div></div>';
			
		    // 创建变量(在这个范围内)来保存API和图像大小
		   		var jcrop_api,
		        boundx,        //原始图片的宽度
		        boundy,        //原始图片的高度
		        // Grab some information about the preview pane
		        // 获取关于预览面板的一些信息
		        $preview = $('#preview-pane'),
		        $pcnt = $('#preview-pane .preview-container'),
		        $pimg = $('#preview-pane .preview-container img'),

		        xsize = $pcnt.width(),      //剪切后的图片的边框宽度
		        ysize = $pcnt.height();     //剪切后的图片的边框高度
		    $('#target').Jcrop({
		      onChange: updatePreview,
		      onSelect: updatePreview,
		      aspectRatio: xsize / ysize
		    },function(){
		      // 使用API获取真实的图像大小
		      var bounds = this.getBounds();
		      boundx = bounds[0];
		      boundy = bounds[1];
		      // 将API存储在jcrop_apiAPI变量中
		      jcrop_api = this;
		      //将预览移动到jcrop物容器中，用于css定位，将预览移到css位置的jcrop裁剪容器中。
		      $preview.appendTo(jcrop_api.ui.holder);
		    });

		    function updatePreview(c)
		    {
		      if (parseInt(c.w) > 0)
		      {
		        var rx = xsize / c.w;
		        var ry = ysize / c.h;
		         $('#w').val(c.w);
		         $('#h').val(c.h);
		         $('#x').val(c.x);
		         $('#y').val(c.y);
		         $('#x2').val(c.x+c.w);
		         $('#y2').val(c.y+c.h);

		        $pimg.css({
		          width: Math.round(rx * boundx) + 'px',
		          height: Math.round(ry * boundy) + 'px',
		          marginLeft: '-' + Math.round(rx * c.x) + 'px',
		          marginTop: '-' + Math.round(ry * c.y) + 'px'
		        });
		      }
		    };
		    //上传图片
		    $("#userImg")[0].addEventListener('change', function(){
		         var formData =new FormData($("#form1")[0]);
		         $.ajax({
		       		 type:'post',
		       		 url:'user/imgUpload.action',
		       		 //contentType:'application/json;charset=utf-8',
		       		 data:formData,
		       		 async: false,  
		       		 cache: false,  
		       		 contentType: false,  
		       		 processData: false, 
		       		 success:function(data){
		       			$(".container1 img").attr("src","upload/"+data);
		       			$("#oldImgPath").val(data);
		       		 },
		       	 	 error: function(data){
		             alert("图片上传失败！");
		             }
		       	  });
		    });
		});
		//加载个人资料里的用户数据
		var id=$("#input-hid").val();
		$.get("user/personalData.action?id="+id,function(data,status,xhr){
			$("#profile-img").attr("src", "upload/"+data.user.photo);
			$("#profile-img").attr("alt", data.user.username);
			$("#profile-username").text(data.user.username);
			$("#profile-phone").text(data.user.phone);
			//$("#profile-email").text(data.user.email);
		});
		//修改用户名
		$("#update-username")[0].addEventListener('click', function(){
			var id=$("#input-hid").val();
			var username=$("#modal-username").val();
			$.ajax({
				type:'post',
				url:'user/updateUsername.action',
				contentType:'application/json;charset=utf-8',
				data:'{"id":'+id+',"username":"'+username+'"}',
				success:function(data){
					$("#profile-username").text(data); 
					$("#profile-img").attr("alt", data);
					$("#center-username").text(data);
				} 
			});
		});
	});
	
	
	
	/**
	 * 
	 * 
	 * 我的资料-修改密码
	 */
	$("#modify-password")[0].addEventListener('click', function(){
		$(".messagn-panel")[0].innerHTML='<div class="profile"><div class="profileinfo">'
		        +'<h3 ng-if="pageTitleVisible" class="profile-paneltitle ng-scope"><span ng-bind="pageTitle" class="ng-binding">设置密码</span> <span class="subtitle ng-binding" ng-bind-html="pageSubtitle | toTrusted"></span></h3><div class="profile-panelcontent" ng-transclude=""><form class="changepwd ng-scope ng-pristine ng-valid"><p class="changepwd-tip">饿了么提示你：使用大小写字母、数字与标点符号的组合，可以大幅提升帐号安全！</p>'
				+'<div class="formfield ng-isolate-scope" form-field="" label="新密码" model="changePwdData" property="newPwd"><label ng-bind="label" class="ng-binding">新密码</label><input id="newPassword1" type="password" name="newPwd" ng-model="changePwdData.newPwd" placeholder="请输入新密码" class="ng-scope ng-pristine ng-valid"><div class="formfield-hint"><span class="ng-binding"></span></div></div>'
				+'<div class="formfield ng-isolate-scope" form-field="" label="确认密码" model="changePwdData" property="confirmPwd"><label ng-bind="label" class="ng-binding">确认密码</label><input id="newPassword2" type="password" name="confirm" ng-model="changePwdData.confirmPwd" placeholder="请再次输入密码" class="ng-scope ng-pristine ng-valid"><div class="formfield-hint"><span  class="ng-binding"></span></div></div>'
				+'<div class="form-group formfield ng-isolate-scope" form-field=""><label ng-bind="label" class="ng-binding"></label><button id="modifypassword-button" type="button" class="btn-primary btn-lg ng-scope">确认</button><div class="formfield-hint"><span class="ng-binding"></span></div></div></form></div></div></div>';		
		$(".setfontcolor").removeClass("fontlink-color");
		$("#modify-password").addClass("fontlink-color");
		$("#modifypassword-button")[0].addEventListener('click',function(){
			var newpassword=$("#newPassword1").val();
			var confirmpassword=$("#newPassword2").val();
			if(typeof(newpassword)!='undefined'||newpassword!=null||newpassword==confirmpassword){
				var id=$("#input-hid").val();
				$.ajax({
					type:'post',
					url:'user/modifyPassword.action',
					contentType:'application/json;charset=utf-8',
					data:'{"id":'+id+',"password":"'+newpassword+'"}',
					success:function(data){
						window.location.href="/user/personalCenter.action";   //跳转到个人中心默认页面
					},
					error:function(){
						alert("修改密码失败！");
					}
				});
			}else{
				alert("两次输入的密码不同，请输入正确的密码！");
			}
		});
	})
	
	
	/**
	 * 
	 * 
	 * 我的资料-地址管理
	 */
	//密码登陆
/*   $("#password")[0].addEventListener('click',function(){
		$("#note").removeClass("font-color");
		$("#password").addClass("font-color");
        $(".from-option")[0].innerHTML='<form class="form-horizontal" action="/CHB/user/loginByPassword.action" method="post"><div class="form-group has-warning"><input type="text" class="form-control input-lg" placeholder="手机/邮箱/用户名" name="user.phone" value=""/></div><div class="form-group has-error"><input type="password" class="form-control input-lg" placeholder="密码" name="user.password" value=""/></div><button class="btn btn-success btn-lg btn-block">登陆</button></form>';
        $("button").click(function(){
         var str=$("form").serialize();
       	 $.ajax({
       		 type:'post',
       		 url:'user/loginByPassword.action',
       		 //contentType:'application/json;charset=utf-8',
       		 data:str,
       		 datatype:'json',
       		 success:function(data){
       			 evil("var msg="+data+";");
       			alert(data.user.username);
       			 console.info(msg);
       		 },
       	 	 error: function() {
             alert("加载失败");
             }
       	  });
        });*/
});