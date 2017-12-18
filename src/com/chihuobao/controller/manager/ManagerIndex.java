package com.chihuobao.controller.manager;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ManagerIndex {
	
	

	@RequestMapping(value="/index.action")
	public String index(){
		
		return "manager/index";
	}
	
	@RequestMapping(value="/go.action")
	public String user(){
		
		return "manager/login";
	}
	
	
	@RequestMapping(value="/login.action")
	public  String login(String admin,HttpSession session){
		
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
	
	@RequestMapping(value="/paytest.action")
	public String paytest(){
		
		return "manager/paytest";
	}
}
