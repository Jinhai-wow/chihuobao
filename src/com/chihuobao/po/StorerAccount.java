package com.chihuobao.po;

import java.io.Serializable;
import java.util.Date;

public class StorerAccount implements Serializable{

	/**
	 * 
	 */
	
	/**
	 * 商家账号信息
	 */
	
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String storerNumber;
	private String storerName;
	private Date storerRegistTime;
	private String email;
	private String password;
	private String storerPic;
	private Double storerMoney;
	private Integer accountState;
	private String telephone;
	
	
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getStorerNumber() {
		return storerNumber;
	}
	public void setStorerNumber(String storerNumber) {
		this.storerNumber = storerNumber;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStorerName() {
		return storerName;
	}
	public void setStorerName(String storerName) {
		this.storerName = storerName;
	}
	public Date getStorerRegistTime() {
		return storerRegistTime;
	}
	public void setStorerRegistTime(Date storerRegistTime) {
		this.storerRegistTime = storerRegistTime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStorerPic() {
		return storerPic;
	}
	public void setStorerPic(String storerPic) {
		this.storerPic = storerPic;
	}
	public Double getStorerMoney() {
		return storerMoney;
	}
	public void setStorerMoney(Double storerMoney) {
		this.storerMoney = storerMoney;
	}
	public Integer getAccountState() {
		return accountState;
	}
	public void setAccountState(Integer accountState) {
		this.accountState = accountState;
	}
	
	
}
