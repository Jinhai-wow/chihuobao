package com.chihuobao.util;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.web.socket.client.WebSocketClient;

//ws://127.0.0.1:8087/Demo1/ws/张三
@ServerEndpoint("/ws")
public class WSServer {
	
	static Map<String,Session> sessionMap=new HashMap<String,Session>();
	private String currentUser;
	
	//连接打开时执行
	@OnOpen
	public void onOpen(Session session) {
		String user=session.getQueryString();
		
		currentUser=user.split("=")[1];
	System.out.println(user);
		sessionMap.put(currentUser, session);
		/*System.out.println("Connected ... " + session.getId());*/
		System.out.println("Connected ... ............................................." + currentUser);
		System.out.println("sessionid ... " + session.getId());
		
		/*this.onMessage(message, session);*/
	}

	//收到消息时执行
	@OnMessage
	public String onMessage(String message, Session session) {
		/*System.out.println(currentUser + ":" + message);*/
		/*WebSocketClient socket =new WebSocketClient(){
			
			
		} ;*/
		
		
		try {
			if(sessionMap.get(message)!=null){
		/*	for (Map.Entry<String, Session> es:sessionMap.entrySet()) {
				 System.out.println("map的key:"+es.getKey());
			}*/
				System.out.println("不为空");
				/*System.out.println("123sessionid:"+sessionMap.get("123").getId());*/
			sessionMap.get(message).getBasicRemote().sendText("收到订单"+currentUser+"的催单");}
		   
	/*	sessionMap.get(currentUser).getBasicRemote().sendText("收到订单"+currentUser+"的催单");*/
			
			System.out.println("message:"+message);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return currentUser + ":" + "已收到您的催单请求";
	}

	 
	//连接关闭时执行
	@OnClose
	public void onClose(Session session, CloseReason closeReason) {
		System.out.println(String.format("Session %s closed because of %s", session.getId(), closeReason));
	}

	//连接错误时执行
	@OnError
	public void onError(Throwable t) {
		t.printStackTrace();
	}
}
