package com.chihuobao.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadcast")
public class BroadcastSocket {

	private String username;
	private static List<Session> sessions = new ArrayList<Session>();
	private static List<String> names = new ArrayList<String>();
	
	private static Map<String,Session> map = new HashMap<String,Session>();
	
	@OnOpen
	public void open(Session session){
		
		String queryString = session.getQueryString();
		System.out.println(queryString);
		username= queryString.split("=")[1];
		this.names.add(username);
		sessions.add(session);
		map.put(this.username, session);
		
		/*
		String msg = "欢迎"+username+"进入!!";
		
		Message message = new Message();
		message.setWelcome(msg);
		message.setUsernames(names);
		this.broadcast(sessions, message.toJson());*/
	}
	
	
	//发送广播通知
	public void broadcast(List<Session> ss, String msg) {

		for (Iterator iterator = ss.iterator(); iterator.hasNext();) {

			Session session = (Session) iterator.next();

			try {
				session.getBasicRemote().sendText(msg);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	//退出浏览器时session去除当前username
	@OnClose
	public void close(Session session){
		
		sessions.remove(session);
		names.remove(this.username);
		
		
		/*String msg = "欢送"+username+"走出!!<br/>";
		Message message = new Message();
		message.setWelcome(msg);
		message.setUsernames(names);
		
		broadcast(sessions, message.toJson());*/
	}
	
	
	@OnMessage
	public void message(Session session,String msg){
		
		
			//guangbo
			Message message = new Message();

			message.setContent(this.username, msg);
			
			broadcast(sessions, message.toJson());
		
	}
	
	
}
