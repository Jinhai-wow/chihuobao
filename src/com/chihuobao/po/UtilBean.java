package com.chihuobao.po;

public class UtilBean {

	private Integer shopcartid;
	private Integer userid;
	private Integer shopid;
	/*送达时间*/
	private String arrivetime;
	/*备注*/
	private String remark;
	/*json,订单中商品的商品名，数量，单价等*/
	private String ordergoodsinfo;
	private  double  totalMoney;
	
	public double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}
	public Integer getShopcartid() {
		return shopcartid;
	}
	public void setShopcartid(Integer shopcartid) {
		this.shopcartid = shopcartid;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getShopid() {
		return shopid;
	}
	public void setShopid(Integer shopid) {
		this.shopid = shopid;
	}
	public String getArrivetime() {
		return arrivetime;
	}
	public void setArrivetime(String arrivetime) {
		this.arrivetime = arrivetime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getOrdergoodsinfo() {
		return ordergoodsinfo;
	}
	public void setOrdergoodsinfo(String ordergoodsinfo) {
		this.ordergoodsinfo = ordergoodsinfo;
	}
	
	@Override
	public String toString() {
		return "UtilBean [shopcartid=" + shopcartid + ", userid=" + userid + ", shopid=" + shopid + ", arrivetime="
				+ arrivetime + ", remark=" + remark + ", ordergoodsinfo=" + ordergoodsinfo + "]";
	}
	
}
