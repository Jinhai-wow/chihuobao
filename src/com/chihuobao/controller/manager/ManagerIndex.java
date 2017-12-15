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
	public  String login(String username,HttpSession session){
		
		session.setAttribute("username", username);
		return "manager/chat";
	}
	
	
}
