package com.chihuobao.util;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.google.gson.Gson;

public class Message implements Serializable{


	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String welcome;
	private List<String> usernames;
	private String content;
	
	
	
	public String getContent() {
		return content;
	}
	public void setContent(String name,String msg) {
		String time = new Date().toLocaleString();
		/*this.content = "<i style='color:red;font-size: 10px'>"+time+":</i><br/><i style='color:#ff7c3d;font-size: 10px'>"+name+":</i><br/>"+msg+"";*/
		this.content= name+":"+msg;
	}
	public String getWelcome() {
		return welcome;
	}
	public void setWelcome(String welcome) {
		this.welcome = welcome;
	}
	public List<String> getUsernames() {
		return usernames;
	}
	public void setUsernames(List<String> usernames) {
		this.usernames = usernames;
	}

	private static Gson gson = new Gson();
	public String toJson(){
		
		return gson.toJson(this);
	}

	
}
