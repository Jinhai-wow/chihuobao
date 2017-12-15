package com.chihuobao.po;

import java.io.Serializable;

/**
 * 订单详情实体类
 * @author 谢韦烈
 *2017-12-05
 */
public class ManagerOrderGoods implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer orderId;
	private String goodsName;
	private Integer goodsQuatity;
	private String goodsMoney;
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public Integer getGoodsQuatity() {
		return goodsQuatity;
	}
	public void setGoodsQuatity(Integer goodsQuatity) {
		this.goodsQuatity = goodsQuatity;
	}
	public String getGoodsMoney() {
		return goodsMoney;
	}
	public void setGoodsMoney(String goodsMoney) {
		this.goodsMoney = goodsMoney;
	}
	
	
	
}
