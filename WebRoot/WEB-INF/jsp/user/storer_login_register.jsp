<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商家登陆注册页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="css/storer_login_register.css"/>
	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/storer_login_register.js"></script>
  </head>
  
  <body>
    <div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<img src="${pageContext.request.contextPath}/img/chb-logo-l.png" alt="logo">
			<div class="login-type">
				<a id="note" class="font-color" href="javascript:;">短信登陆</a>
				<a id="password" href="javascript:;">密码登陆</a>
			</div>
			<div class="from-option">
				<form class="form-horizontal" id="login-note" action="${pageContext.request.contextPath }/user/storerAccountLoginRegisterByMessage.action" method="post">
					<div class="form-group has-warning">
						<section class="MessageLogin-FsPlX">
							<input type="tel" id="loginphone" class="form-control input-lg" maxlength="11" name="telephone" placeholder="手机号" value=""/>
							<button type="button" disabled="disabled" class="CountButton-3e-kd">
								获取验证码
							</button>
						</section>
					</div>
					<div class="form-group has-error">
						<input type="text" class="form-control input-lg" name="captcha" placeholder="验证码" value=""/>
					</div>
					<button class="btn btn-success btn-lg btn-block" type="submit">登陆</button>
				</form>
			</div>
		</div>
	</div>
	</div>
  </body>
</html>
