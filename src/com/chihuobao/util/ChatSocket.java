package com.chihuobao.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;



@ServerEndpoint("/chat")
public class ChatSocket {

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
		
		
		String msg = "欢迎"+username+"进入!!<br/>";
		
		Message message = new Message();
		message.setWelcome(msg);
		message.setUsernames(names);
		this.broadcast(sessions, message.toJson());
	}
	
	
	public void broadcast(List<Session> ss,String msg){
		
		for (Iterator iterator = ss.iterator(); iterator.hasNext();) {
			
			Session session = (Session) iterator.next();
			
			
			try {
				session.getBasicRemote().sendText(msg);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@OnClose
	public void close(Session session){
		
		sessions.remove(session);
		names.remove(this.username);
		
		
		String msg = "欢送"+username+"走出!!<br/>";
		Message message = new Message();
		message.setWelcome(msg);
		message.setUsernames(names);
		
		broadcast(sessions, message.toJson());
	}
	
	private static Gson gson = new Gson();
	@OnMessage
	public void message(Session session,String json){
		
		ContentVo vo = gson.fromJson(json, ContentVo.class);
		
		
		if(vo.getType()==1){ 
			//guangbo
			Message message = new Message();

			message.setContent(this.username, vo.getMsg());
			
			broadcast(sessions, message.toJson());
			
		}else{
			//danliao
			//根据username 找到对应的session对象
			String to = vo.getTo();
			String from = vo.getFrom();
			Session to_session = map.get(to);
			Session from_session = map.get(from);
			
			Message message = new Message();

			message.setContent(this.username, vo.getMsg());

			try {
				to_session.getBasicRemote().sendText(message.toJson());
//				from_session.getBasicRemote().sendText(message.toJson());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
}
