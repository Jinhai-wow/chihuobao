package com.chihuobao.vo;

import java.io.Serializable;

/**
 * 选择发送消息的对象扩展类
 * @author 谢韦烈
 * 2017-12-18
 */
public class MessageObject implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String name;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	

}
