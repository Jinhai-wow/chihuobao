package com.chihuobao.po;

public class Complain {

	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private int userid;
	private String reason;
	private long orderid;
	private int shopid;
	private String otherreason;
	public String getOtherreason() {
		return otherreason;
	}
	public void setOtherreason(String otherreason) {
		this.otherreason = otherreason;
	}
	@Override
	public String toString() {
		return "Complain [userid=" + userid + ", reason=" + reason + ", orderid=" + orderid + ", shopid=" + shopid
				+ "]";
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public long getOrderid() {
		return orderid;
	}
	public void setOrderid(long orderid) {
		this.orderid = orderid;
	}
	public int getShopid() {
		return shopid;
	}
	public void setShopid(int shopid) {
		this.shopid = shopid;
	}
}
