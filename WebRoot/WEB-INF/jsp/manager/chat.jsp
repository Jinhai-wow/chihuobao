<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>欢迎 ${sessionScope.username }进入</title>
    <link rel="stylesheet" href="css/normalize.css" type="text/css">
	<link rel="stylesheet" href="css/animate.min.css">
	<link rel="stylesheet" href="css/jquery.gDialog.css">
    <link rel="stylesheet" href="css/chat.css" media="screen" type="text/css" />
    <style>
    body{
    	background:url("");
    }
    </style>
</head>
<body>

<div id="box">
    <div id="convo">
        <ul id="content" class="chat-thread">

        </ul>
        <ul id="userList" class="personnel">
<!--             <li><img src="img/shop-bg.jpg"><span data-value="用户某某某">用户某某某</span></li>
            <li><img src="img/shop-bg.jpg"><span data-value="客服123号">客服123号</span></li> -->
        </ul>
    </div>
    <div id="send">
        <textarea></textarea>
        <i>Ctrl + Enter换行</i>
        <span></span>
        <button>发送(enter)</button>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
<script src="js/jquery.gDialog.js"></script>

<script>
$(function () {
    //创建元素方法
    function createEle(eleName,className,parent) {
        var create  = document.createElement(eleName);
        className ? create.className = className:'';
        parent? parent.appendChild(create):'';
        return create;
    }
    //聊天信息放在哪一边(用户有userId 客服有什么？？？)
    var leftRight = "right";
    //聊天对象
    var chatObj = "";
    //当前用户
    var user= "${sessionScope.admin}";
    //装载聊天内容
    var showMsg = $("#convo .chat-thread")[0];
    //装载聊天人
    var personnel  = $("#convo .personnel")[0];
    var $personnelLis;
    //发生消息内容
    var postMsg = $("#send>textarea")[0];
    //字数提示
    var tips = $("#send>span")[0];
    //提交按钮
    var postBtn = $("#send>button")[0];
    //显示发出来的消息
    function show() {
        if (postMsg.value && postMsg.value.length <= 150) {
            var postStr = createEle("li",leftRight,showMsg);
            //显示发送的空格、换行
            var strArr = postMsg.value.split(' ');
            postMsg.value  = (strArr.join('&nbsp;')).split('\n').join('<br/>');
            //存储聊天记录，[显示在哪边，内容]
            // chatMsg.push([user,postMsg.value]);
            //还是直接写入数据库的好
            postStr.innerHTML = getData() +  postMsg.value ;
            subSend();
            //不是输入框输入的，则不需要发送，也不需要清空
            postMsg.value = '';//点击发送后清除输入框内容
            showMsg.scrollTop = showMsg.scrollHeight;//保持聊天内容 是刚刚输入的内容
        }
    }
    //给提交按钮添加事件
    $(postBtn).on("click",function () {
        if(chatObj != ""){
            show();
        }else{
	    	alertBox("选择需要为你服务的管理员","没有目标");
	    }
        return false;
    })
    //监控键盘输入
    $(document).on("keydown",function (event) {
        event = event || window.event;
        //ctrl + enter 换行
        if(event.ctrlKey && event.which == 13){
            $(postMsg)[0].value += "\n";
            return false;

        //enter 按键发送消息
        }else if(!event.ctrlKey && event.which == 13){
            if(chatObj != ""){
	            show();
	        }else{
	        	alertBox("选择需要为你服务的管理员","没有目标");
	        }
            //不让换行
            return false;
        }
        // return false; 加了这个就无法输入
    })
    //鼠标在按钮上，左键按下时候变色
    $(postBtn).on("mousedown",function () {
        postBtn.className = 'active';
        return false;
    })
    //鼠标在按钮上，左键弹开时候恢复原来的颜色
    $(postBtn).on("mouseup",function () {
        postBtn.removeAttribute('class');
        return false;
    })
    //定时检测输入框
    setInterval(function(){
        if(postMsg.value==''){
            tips.innerHTML = '请输入内容';
        }else if(postMsg.value.length > 150){
            tips.innerHTML = '请输入少于150字';
        }else{
            tips.innerHTML = '还可以输入'+(150-postMsg.value.length)+'个字';
        }
    },100);
    //右边的人物点击事件
	function blind(){
		$personnelLis.on("click",function () {
	        if($(this)[0].className == "active"){
	            $(this).removeClass();
	            /* showMsg.innerHTML = ""; */
	            chatObj = '';
	        }else{
	            $personnelLis.each(function () {
	                $(this).removeClass();
	            })
	            $(this).addClass("active");
	        }
	        if($(this)[0].className == "active"){
	            chatObj = $(this.lastElementChild).attr("data-value");
	            alertBox(chatObj);
	            /* showMsg.innerHTML = ""; */
	        }
	    })
	}

    function getData(){
	    var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		var hour = date.getHours();
		var minute = date.getMinutes();
		var second = date.getSeconds();
		return "<i style='color:red;font-size: 10px'>"+year+"-"+month+"-"+day+"&nbsp;"+hour+":"+minute+":"+second+":</i><br><i style='color:#ff7c3d;font-size: 10px'>${sessionScope.admin}:</i><br>";
    }
    
    
    
    /* 拿过来改了下的代码 */
    var admin='${sessionScope.admin}';
    alertBox(admin,'sessionScope.admin');
    var ws;// 管理登陆，退出，用户列表的 socket
    //var ws2;  // 管理聊天 的 socket
    
    ws_init();
    
    function ws_init(){
    	var target="ws://localhost:8080/CHB/chat?username="+admin;
   	    if ('WebSocket' in window) {
            ws = new WebSocket(target);
        } else if ('MozWebSocket' in window) {
            ws = new MozWebSocket(target);
        } else {
            alertBox('WebSocket is not supported by this browser.',"Error");
            return;
        }
        
        ws.onopen=function(){
			    			
		};
		
		window.onbeforeunload=function(){
			ws.close();
		};
		
		ws.onmessage=function(event){
			eval("var msg="+event.data+";"); 
			if(msg.welcome!=undefined){//todo
				/* $("#content").append(msg.welcome); */
			}
			if(msg.usernames!=undefined){
				$("#userList").html(""); 
				/* var array = msg.usernames; */
				$(msg.usernames).each(function(i){
					if(admin != "aaa"){
						return;
					}else{
						/* $("#userList").append("<input type=checkbox value='"+this+"'/>"+this+"</br>"); */
						$("#userList").append('<li><img src="img/shop-bg.jpg"><span data-value="'+this+'">'+this+'</span></li>');
					}
				});
				$personnelLis = $("#convo .personnel li");
				blind();
 				if(admin != "aaa"){
					$("#userList").append('<li><img src="img/shop-bg.jpg"><span data-value="'+admin+'">'+admin+'</span></li>');
					$("#userList").append('<li><img src="img/shop-bg.jpg"><span data-value="aaa">aaa</span></li>');
				} 
			}
			if(msg.content!=undefined){
				/* $("#content").append(msg.content+"</br>");//todo msg.content是什么来的？？ */
				$("#content").append('<li class="left">'+msg.content+'</li>');
			} 
		}
    }
    
    function subSend(){
    	if(chatObj==""){
    		return;
    	}else{
    		var name='${sessionScope.admin }';
    		console.log(postMsg,postMsg.value);
    		var val = postMsg.value;
    		var obj= {
		   			from:name,
		   			to:chatObj,
		   			msg:val,
		   			type:2
	   			}
	   		var str = JSON.stringify(obj);
	   		ws.send(str);
    	}
    }
    //弹出框
	function alertBox(str,title){
		$.gDialog.alert(str, {
			title: title,
	    	animateIn: "bounceIn",
	    	animateOut: "bounceOut"
		}); 
	}

})

</script>
</body>
</html>