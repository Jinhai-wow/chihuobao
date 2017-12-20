$(document).ready(function(){
	
	//发送验证码
	$(".CountButton-3e-kd").click(function(){
		var phone=$("#loginphone").val();
		$.get("user/createCaptcha.action?phone="+phone);
	});
	
	
	//发送验证码的button的disabled处理
	function handle(){
		if($("#loginphone")[0].value.length==11){
			$(".CountButton-3e-kd").removeAttr("disabled")
		}else{
			$(".CountButton-3e-kd").attr("disabled", true);
		}
	}
	//发送验证码的button的disabled处理
	$("#loginphone")[0].addEventListener("input",handle,false);

	
	//手机短信登陆
	$("#note")[0].addEventListener('click',function(){
		$("#password").removeClass("font-color");
		$("#note").addClass("font-color");
        $(".from-option")[0].innerHTML='<form class="form-horizontal" action="/CHB/user/storerAccountLoginRegisterByMessage.action" method="post"><div class="form-group has-warning"><section class="MessageLogin-FsPlX"><input type="tel" id="loginphone" class="form-control input-lg" maxlength="11" name="telephone" placeholder="手机号" value=""/><button type="button" disabled="disabled" class="CountButton-3e-kd">获取验证码</button></section></div><div class="form-group has-error"><input type="text" class="form-control input-lg" name="captcha" placeholder="验证码" value=""/></div><button class="btn btn-success btn-lg btn-block" type="submit">登陆</button></form>';
	
    	//发送验证码
    	$(".CountButton-3e-kd").click(function(){
    		var phone=$("#loginphone").val();
    		$.get("user/createCaptcha.action?phone="+phone);
    	});

    	//发送验证码的button的disabled处理
    	function handle(){
    		if($("#loginphone")[0].value.length==11){
    			$(".CountButton-3e-kd").removeAttr("disabled")
    		}else{
    			$(".CountButton-3e-kd").attr("disabled", true);
    		}
    	}
    	//发送验证码的button的disabled处理
    	$("#loginphone")[0].addEventListener("input",handle,false);
	});
	
	
	
	//密码登陆
    $("#password")[0].addEventListener('click',function(){
		$("#note").removeClass("font-color");
		$("#password").addClass("font-color");
        $(".from-option")[0].innerHTML='<form class="form-horizontal" action="/CHB/user/storerAccountLoginByPassword.action" method="post"><div class="form-group has-warning"><input type="text" class="form-control input-lg" placeholder="手机/邮箱/用户名" name="telephone" value=""/></div><div class="form-group has-error"><input type="password" class="form-control input-lg" placeholder="密码" name="password" value=""/></div><button class="btn btn-success btn-lg btn-block">登陆</button></form>';
       /* $("button").click(function(){
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
       	  });*/
        });
});