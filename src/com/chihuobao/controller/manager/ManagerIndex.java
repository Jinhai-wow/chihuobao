package com.chihuobao.controller.manager;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 备用controller类
 * @author 谢韦烈
 * 2017-11-18
 */
@Controller
public class ManagerIndex {
	
	
	//管理员首页入口
	@RequestMapping(value="/admin.action")
	public String index(){
		
		return "manager/admin";
	}
	
	//客服聊天入口
	@RequestMapping(value="/go.action")
	public  String login(HttpSession session){
		String admin = "aaa";
		session.setAttribute("admin", admin);
		return "manager/chat";
	}
	
	
	//用户客服进入
	@RequestMapping(value="/userChat.action")
	public  String userChat(){
			
		return "manager/userChat";
	}
	
	//测试消息接收
	@RequestMapping(value="/text.action")
	public String text(){
		
		return "manager/text";
	}
	

	//发送消息入口
	@RequestMapping(value="/sendMessage.action")
	public String sendMessage(){
		
		return "manager/sendMessage";
	}
}
