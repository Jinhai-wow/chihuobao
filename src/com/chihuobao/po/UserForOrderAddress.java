package com.chihuobao.po;

public class UserForOrderAddress {
	private Integer userid;
	private String username;
	private Integer sex;
	private String position;
	private String detailaddress;
	
	private Integer shopcartid;
	
	
	public Integer getShopcartid() {
		return shopcartid;
	}
	public void setShopcartid(Integer shopcartid) {
		this.shopcartid = shopcartid;
	}
	@Override
	public String toString() {
		return "UserForOrderAddress [userid=" + userid + ", username=" + username + ", sex=" + sex + ", position="
				+ position + ", detailaddress=" + detailaddress + ", shopcartid=" + shopcartid + ", phone=" + phone
				+ "]";
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	private String phone;
	
	
	
}
