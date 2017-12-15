package com.chihuobao.po;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户信息po类
 * 保存的是用户相关信息
 * @author 陈志杰
 *
 */

public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;   		     //用户id
	private String username;     //用户名
	private String password;     //密码
	private String name;         //用户真实姓名
	private int sex;             //用户性别
	private String email;        //用户email
	private String phone;        //用户手机号码
	private String photo;		 //用户头像
	private Date registertime;   //注册时间
	private Integer userstatus;      //登陆状态
	private int userfreeze;      //用户账号状态
	
	
	
	public Integer getUserstatus() {
		return userstatus;
	}
	public void setUserstatus(Integer userstatus) {
		this.userstatus = userstatus;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Date getRegistertime() {
		return registertime;
	}
	public void setRegistertime(Date registertime) {
		this.registertime = registertime;
	}
	public int getUserfreeze() {
		return userfreeze;
	}
	public void setUserfreeze(int userfreeze) {
		this.userfreeze = userfreeze;
	}
	
	
}
