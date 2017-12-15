<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html >
<title>聊天室</title>
<link href="CSS/style.css" rel="stylesheet">
<script type="text/javascript">
	function check(){
		if(document.getElementById("form1").username.value==""){
			alert("请输入用户名！");
			document.getElementById("form1").username.focus();
			return false;
		}
		
		if(document.getElementById("form1").password.value==""){
			alert("请输入密码名！");
			document.getElementById("form1").password.focus();
			return false;
		}
	}
</script>
<body>
	<br>
	
	<form id="form1" name="form1" method="post" action="${pageContext.request.contextPath }/login.action" onSubmit="return check()">
		
		<table width="371" height="230" border="0" align="center" cellpadding="0" cellspacing="0" >
			
			<tr>
				<td width="53" align="center" valign="top" class="word_dark">&nbsp;</td>
				<td width="216" align="center" valign="top" class="word_dark">
				<table width="100%" height="100%">
						<tr>
							<td>用户名：</td>
							<td><input type="text" name="username" class="login"></td>
						</tr>
					</table>
				</td>
				
			</tr>
			
			
			<tr>
				<td width="53" align="center" valign="top" class="word_dark">&nbsp;</td>
				<td width="216" align="center" valign="top" class="word_dark">
				<input name="Submit" type="submit" class="btn_bg" value="进 入">
				</td>
				
			</tr>
			

		</table>
	</form>
</body>
</html>
