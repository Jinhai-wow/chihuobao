package com.chihuobao.po;

import java.io.Serializable;
import java.util.Date;

/**
 * 商家消息实体类
 * @author 谢韦烈
 * 2017-12-17
 */
public class StorerMessage implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	private Integer storerId;
	private String message;
	private Date messageDate;
	private Integer type;
	
	
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getStorerId() {
		return storerId;
	}
	public void setStorerId(Integer storerId) {
		this.storerId = storerId;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}
	
	
}
